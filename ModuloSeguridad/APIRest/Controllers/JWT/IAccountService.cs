using APIRest.Controllers.Helpers;
using APIRest.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIRest.Controllers.JWT
{
    public interface IAccountService
    {
        AuthenticationResponse AuthenticateSync(LoginRequest request);
        AuthenticationResponse RefreshTokenSync(String refreshToken);
        bool RegisterSync(RegisterRequest request);
    }
}
