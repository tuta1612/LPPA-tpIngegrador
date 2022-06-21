using APIRest.DAL.Contracts;
using APIRest.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIRest.DAL.Adapters
{
    public class TokenDAOAdapter
    {
        #region Singleton
        private readonly static TokenDAOAdapter _instance = new TokenDAOAdapter();

        public static TokenDAOAdapter Current
        {
            get
            {
                return _instance;
            }
        }

        private TokenDAOAdapter()
        {
            //Implement here the initialization code
        }
        #endregion

        public TokenDAO Adapt(object[] values)
        {
            var fecha = DateTime.ParseExact(values[3].ToString(), "dd/MM/yyyy H:mm:ss", null);
            return new TokenDAO()
            {
                Id = int.Parse(values[0].ToString()),
                UserId = int.Parse(values[1].ToString()),
                Token = values[2].ToString(),
                Expires = fecha
            };
        }


    }
}
