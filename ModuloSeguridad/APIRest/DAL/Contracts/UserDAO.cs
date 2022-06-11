using APIRest.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIRest.DAL.Contracts
{
    public class UserDAO
    {
        public int Id { get; set; }

        public string Username { get; set; }
        public string Salt { get; set; }
        public string PasswordHash { get; set; }
        public string Email { get; set; }

        public List<Permission> Permissions { get; set; }

    }
}
