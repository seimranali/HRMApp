using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HRMApp.Application
{
    public class GenericResult<T> where T : class
    {
        public T? Data { get; set; }
        public bool Status { get; set; }
        public string Message { get; set; }
    }
}
