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
    public class DALUser: IGenericRepository<UserDAO>
    {
        private String connectionString;
        internal DALUser(String oneConnectionString)
        {
            connectionString = oneConnectionString;
        }

        public void Insert(UserDAO oneObject)
        {
            if (oneObject.Username == null || oneObject.Username.Trim().Length == 0 ||
                oneObject.Salt== null || oneObject.PasswordHash.Trim().Length == 0 ||
                oneObject.PasswordHash == null || oneObject.PasswordHash.Trim().Length == 0 ||
                oneObject.Email == null || oneObject.Email.Trim().Length == 0)
                throw new Exception("Faltan completar datos");
            try {
                SqlHelper sqlHelper = new SqlHelper(connectionString);
                String newUserId = sqlHelper.ExecuteScalar("User_Insert", System.Data.CommandType.StoredProcedure, new SqlParameter[] {
                        new SqlParameter("@UserName", oneObject.Username),
                        new SqlParameter("@Salt", oneObject.Salt),
                        new SqlParameter("@PasswordHash", oneObject.PasswordHash),
                        new SqlParameter("@Email", oneObject.Email),}).ToString();
                oneObject.Id = int.Parse(newUserId);

                oneObject.Permissions.ForEach(child =>
                    new DALRelationshipUserPermission(connectionString).Join(oneObject, child)
                );
            } catch (Exception ex) {
                throw new Exception("Hubo un problema al agregar un nuevo usuario");
            }
        }

        public void Delete(UserDAO oneObject)
        {
            try {
                new DALRelationshipUserPermission(connectionString).UnlinkAll(oneObject);

                SqlHelper sqlHelper = new SqlHelper(connectionString);
                sqlHelper.ExecuteNonQuery("User_Deleted", System.Data.CommandType.StoredProcedure, new SqlParameter[] {
                       new SqlParameter("@id", oneObject.Id)});
            } catch (Exception ex) {
                throw new Exception("Hubo un problema al borrar este usuario");
            }
        }

        public void Update(UserDAO oneObject)
        {
            if (oneObject.Username == null || oneObject.Username.Trim().Length == 0 ||
                oneObject.Salt == null || oneObject.PasswordHash.Trim().Length == 0 ||
                oneObject.PasswordHash == null || oneObject.PasswordHash.Trim().Length == 0 ||
                oneObject.Email == null || oneObject.Email.Trim().Length == 0)
                throw new Exception("Faltan completar datos");
            try {
                SqlHelper sqlHelper = new SqlHelper(connectionString);
                sqlHelper.ExecuteNonQuery("User_Mod", System.Data.CommandType.StoredProcedure, new SqlParameter[] {
                        new SqlParameter("@id", oneObject.Id),
                        new SqlParameter("@UserName", oneObject.Username),
                        new SqlParameter("@Salt", oneObject.Salt),
                        new SqlParameter("@PasswordHash", oneObject.PasswordHash),
                        new SqlParameter("@Email", oneObject.Email),});

                new DALRelationshipUserPermission(connectionString).UnlinkAll(oneObject);
                oneObject.Permissions.ForEach(child =>
                    new DALRelationshipUserPermission(connectionString).Join(oneObject, child)
                );
            }
            catch (Exception ex) {
                throw new Exception("Hubo un problema al modificar este usuario");
            }
        }

        public IEnumerable<UserDAO> FindAll()
        {
            try {
                List<UserDAO> allUsers = new List<UserDAO>();
                SqlHelper sqlHelper = new SqlHelper(connectionString);
                string query = "SELECT Id, UserName, Salt, PasswordHash, Email FROM Users";
                using (var dr = sqlHelper.ExecuteReader(query, System.Data.CommandType.Text)) {
                    while (dr.Read()) {
                        object[] values = new object[dr.FieldCount];
                        dr.GetValues(values);
                        UserDAO oneUser = UserDAOAdapter.Current.Adapt(values);
                        oneUser.Permissions.AddRange(
                            new DALRelationshipUserPermission(connectionString).GetChildren(oneUser)
                        );
                        allUsers.Add(oneUser);
                    }
                }
                return allUsers;
            } catch (Exception ex) {
                throw new Exception("Hubo un problema al listar los usuarios");
            }
        }
    }
}
