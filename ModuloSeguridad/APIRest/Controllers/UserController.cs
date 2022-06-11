using APIRest.DAL;
using APIRest.DAL.Contracts;
using APIRest.DTOs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;





namespace APIRest.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : ControllerBase
    {
        private readonly ILogger<UserController> _logger;
        private readonly IConfiguration _configuration;

        public UserController(ILogger<UserController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
        }

        [HttpGet]
        public IEnumerable<UserDAO> Get()
        {
            return DALFactory.GetUsersRepository(this._configuration).FindAll();
        }

        [HttpPost]
        public bool Post(UserDAO newUser)
        {
            try {
                DALFactory.GetUsersRepository(this._configuration).Insert(newUser);
                return true;
            } catch (Exception) {
                return false;
            }
        }

        [HttpPut]
        public bool Put(UserDAO oneUser)
        {
            try {
                DALFactory.GetUsersRepository(this._configuration).Update(oneUser);
                return true;
            } catch (Exception) {
                return false;
            }
        }

        [HttpDelete]
        public bool Delete(UserDAO oneUser)
        {
            try {
                DALFactory.GetUsersRepository(this._configuration).Delete(oneUser);
                return true;
            } catch (Exception) {
                return false;
            }
        }
    }
}
