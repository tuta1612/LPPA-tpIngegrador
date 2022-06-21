using APIRest.Controllers.Helpers;
using APIRest.DAL;
using APIRest.DAL.Contracts;
using APIRest.DTOs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Net.Mail;


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
        public GenericResponse<IEnumerable<UserDAO>> Get()
        {
            try {
                return new GenericResponse<IEnumerable<UserDAO>>(DALFactory.GetUsersRepository(this._configuration).FindAll(), "Success");
            } catch (Exception ex) {
                return new GenericResponse<IEnumerable<UserDAO>>(new List<UserDAO>(), ex.Message);
            }
        }

        [HttpPost]
        public GenericResponse<bool> Post(User newUser)
        {
            try {
                if (newUser.Password.Length < 5)
                    throw new Exception("La contraseña es muy corta");

                if (!verifyEmailFormat(newUser.Email))
                    throw new Exception("El mail no tiene un formato valido");

                string oneSalt = SecurityHelper.CreateSalt(35);
                UserDAO userDao = new UserDAO();
                userDao.Id = 0;
                userDao.Username = newUser.Username;
                userDao.Salt = oneSalt;
                userDao.PasswordHash = SecurityHelper.GenerateHash(newUser.Password, oneSalt);
                userDao.Email = newUser.Email;
                userDao.Permissions = newUser.Permissions;
                DALFactory.GetUsersRepository(this._configuration).Insert(userDao);
                return new GenericResponse<bool>(true, "Success");
            } catch (Exception ex) {
                return new GenericResponse<bool>(false, ex.Message);
            }
        }

        private bool verifyEmailFormat(string oneEmail) {
            try {
                MailAddress mailAddress = new MailAddress(oneEmail);
                return true;
            } catch (FormatException) {
                return false;
            }
        }

        [HttpPut]
        public GenericResponse<bool> Put(UserDAO oneUser)
        {
            try {
                DALFactory.GetUsersRepository(this._configuration).Update(oneUser);
                return new GenericResponse<bool>(true, "Success");
            } catch (Exception ex) {
                return new GenericResponse<bool>(false, ex.Message);
            }
        }

        [HttpDelete]
        public GenericResponse<bool> Delete(UserDAO oneUser)
        {
            try {
                DALFactory.GetUsersRepository(this._configuration).Delete(oneUser);
                return new GenericResponse<bool>(true, "Success");
            } catch (Exception ex) {
                return new GenericResponse<bool>(false, ex.Message);
            }
        }
    }
}
