using APIRest.Controllers.Helpers;
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
        public GenericResponse<IEnumerable<Permission>> Get()
        {
            try {
                return new GenericResponse<IEnumerable<Permission>>(DALFactory.GetPermissionsRepository(this._configuration).FindAll(), "Success");
            } catch (Exception ex){
                return new GenericResponse<IEnumerable<Permission>>(new List<Permission>(), ex.Message);
            }
        }

        [HttpPost]
        public GenericResponse<bool> Post(Permission newPermission)
        {
            try {
                DALFactory.GetPermissionsRepository(this._configuration).Insert(newPermission);
                return new GenericResponse<bool>(true, "Success");
            } catch (Exception ex) {
                return new GenericResponse<bool>(false, ex.Message);
            }
        }

        [HttpPut]
        public GenericResponse<bool> Put(Permission onePermission)
        {
            try {
                DALFactory.GetPermissionsRepository(this._configuration).Update(onePermission);
                return new GenericResponse<bool>(true, "Success");
            } catch (Exception ex) {
                return new GenericResponse<bool>(false, ex.Message);
            }
        }

        [HttpDelete]
        public GenericResponse<bool> Delete(Permission onePermission)
        {
            try {
                DALFactory.GetPermissionsRepository(this._configuration).Delete(onePermission);
                return new GenericResponse<bool>(true, "Success");
            } catch (Exception ex) {
                return new GenericResponse<bool>(false, ex.Message);
            }
        }
    }
}
