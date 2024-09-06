using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HRMApp.Domain.Entities
{
    /// <summary>
    /// This Entity same as Database's Table 
    /// </summary>
    public class BusinessType
    {
        [Key] //Primary Key
        public int BusinessTypeID { get; set; }
        [Required(ErrorMessage = "This field is required.")]
        public string BusinessTypeName { get; set; }
        public string? BusinessTypeDescription { get; set; } //nullable field

    }
}
