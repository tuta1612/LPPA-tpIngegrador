using APIRest.DAL;
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
    public class PermissionController : ControllerBase
    {
        private readonly ILogger<PermissionController> _logger;
        private readonly IConfiguration _configuration;

        public PermissionController(ILogger<PermissionController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
        }

        [HttpGet]
        public IEnumerable<Permission> Get()
        {
            return DALFactory.GetPermissionsRepository(this._configuration).FindAll();
        }

        [HttpPost]
        public bool Post(Permission newPermission)
        {
            try {
                DALFactory.GetPermissionsRepository(this._configuration).Insert(newPermission);
                return true;
            } catch (Exception) {
                return false;
            }
        }

        [HttpPut]
        public bool Put(Permission onePermission)
        {
            try {
                DALFactory.GetPermissionsRepository(this._configuration).Update(onePermission);
                return true;
            } catch (Exception) {
                return false;
            }
        }

        [HttpDelete]
        public bool Delete(Permission onePermission)
        {
            try {
                DALFactory.GetPermissionsRepository(this._configuration).Delete(onePermission);
                return true;
            } catch (Exception) {
                return false;
            }
        }
    }
}
