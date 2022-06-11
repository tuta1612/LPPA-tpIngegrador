using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using APIRest.DAL.Contracts;
using APIRest.DTOs;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;


namespace APIRest.DAL
{
    public class DALFactory
    {
        public static IGenericRepository<Permission> GetPermissionsRepository(IConfiguration configuration)
        {
            return new DALPrivilege(configuration.GetConnectionString("DefaultConnection"));
        }
    }
}

