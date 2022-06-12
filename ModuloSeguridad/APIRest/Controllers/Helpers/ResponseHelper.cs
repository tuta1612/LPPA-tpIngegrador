using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIRest.Controllers.Helpers
{
    public class GenericResponse<T>
    {
        public T data { get; }
        public String message { get; }

        public GenericResponse(T responseData, String responseMessage){
            this.data = responseData;
            this.message = responseMessage;
        }
    }
}
