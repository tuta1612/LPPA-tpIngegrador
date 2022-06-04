using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIRest.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HelloWordController : ControllerBase
    {
        private readonly ILogger<HelloWordController> _logger;

        public HelloWordController(ILogger<HelloWordController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<String> Get()
        {
            List<String> rta = new List<String>();
            rta.Add("Hello");
            rta.Add("World");
            return rta;
        }
    }
}
