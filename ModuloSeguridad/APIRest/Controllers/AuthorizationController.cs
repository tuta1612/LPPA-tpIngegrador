using APIRest.Controllers.Helpers;
using APIRest.Controllers.JWT;
using APIRest.DAL;
using APIRest.DTOs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;





namespace APIRest.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class AuthorizationController : ControllerBase
    {
        private readonly ILogger<PermissionController> _logger;
        private readonly IConfiguration _configuration;

        public AuthorizationController(ILogger<PermissionController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
        }


        [HttpPost("authenticate")]
        public GenericResponse<AuthenticationResponse> LogIn(LoginRequest request)
        {
            AccountService accountService = new AccountService(_configuration);
            return new GenericResponse<AuthenticationResponse>(accountService.AuthenticateSync(request), "Ok");
        }

        [HttpPost("refreshtoken")]
        public GenericResponse<AuthenticationResponse> RefreshToken(String refreshToken)
        {
            AccountService accountService = new AccountService(_configuration);
            return new GenericResponse<AuthenticationResponse>(accountService.RefreshTokenSync(refreshToken), "Ok");
        }
    }
}
