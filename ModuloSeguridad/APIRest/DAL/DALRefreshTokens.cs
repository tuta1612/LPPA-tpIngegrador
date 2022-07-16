using APIRest.DAL.Adapters;
using APIRest.DAL.Contracts;
using APIRest.DAL.Herramientas;
using APIRest.DTOs;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace APIRest.DAL
{
    public class DALRefreshTokens: IGenericRepository<TokenDAO>
    {
        private String connectionString;
        internal DALRefreshTokens(String oneConnectionString)
        {
            connectionString = oneConnectionString;
        }



        public void Insert(TokenDAO oneObject)
        {
            if (oneObject.UserId == 0 ||
                oneObject.Token == null || oneObject.Token.Trim().Length == 0 ||
                oneObject.Expires == null || oneObject.Expires <= DateTime.Now)
                throw new Exception("Faltan completar datos");
            try {
                SqlHelper sqlHelper = new SqlHelper(connectionString);
                String newTokenId = sqlHelper.ExecuteScalar("Token_Insert", System.Data.CommandType.StoredProcedure, new SqlParameter[] {
                        new SqlParameter("@UserId", oneObject.UserId),
                        new SqlParameter("@Token", oneObject.Token),
                        new SqlParameter("@Expires", oneObject.Expires),}).ToString();
                oneObject.Id = int.Parse(newTokenId);
            } catch (Exception) {
                throw new Exception("Hubo un problema al agregar un nuevo refresh token");
            }
        }

        public void Delete(TokenDAO oneObject)
        {
        }

        public void Update(TokenDAO oneObject)
        {
            if (oneObject.UserId == 0 ||
                oneObject.Token == null || oneObject.Token.Trim().Length == 0 ||
                oneObject.Expires == null || oneObject.Expires <= DateTime.Now)
                throw new Exception("Faltan completar datos");
            try {
                SqlHelper sqlHelper = new SqlHelper(connectionString);
                String newTokenId = sqlHelper.ExecuteScalar("Token_Mod", System.Data.CommandType.StoredProcedure, new SqlParameter[] {
                        new SqlParameter("@Id", oneObject.Id),
                        new SqlParameter("@UserId", oneObject.UserId),
                        new SqlParameter("@Token", oneObject.Token),
                        new SqlParameter("@Expires", oneObject.Expires),}).ToString();
            }
            catch (Exception)
            {
                throw new Exception("Hubo un problema al modificar este refresh token");
            }
        }

        public IEnumerable<TokenDAO> FindAll()
        {
            try {
                List<TokenDAO> allTokens = new List<TokenDAO>();
                SqlHelper sqlHelper = new SqlHelper(connectionString);
                string query = "SELECT Id, UserId, Token, Expires FROM RefreshToken";
                using (var dr = sqlHelper.ExecuteReader(query, System.Data.CommandType.Text))
                {
                    while (dr.Read())
                    {
                        object[] values = new object[dr.FieldCount];
                        dr.GetValues(values);
                        TokenDAO oneToken = TokenDAOAdapter.Current.Adapt(values);
                        allTokens.Add(oneToken);
                    }
                }
                return allTokens;
            } catch (Exception ex) {
                throw new Exception("Hubo un problema al listar los tokens");
            }
        }
    }
}
