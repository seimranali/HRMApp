using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HRMApp.Domain.Entities
{
    public class Company
    {
        [Key] //Primary Key        
        public int CompanyID { get; set; }
        [Required(ErrorMessage = "This field is required")]
        public int BusinessTypeID { get; set; }
        [Required(ErrorMessage = "This field is required")]
        public string CompanyName { get; set; }
        public string? CRNumber { get; set; }
        public string? VATNumber { get; set; }
        public string? AddressLine1 { get; set; }
        public string? AddressLine2 { get; set; }
        public int? CountryID { get; set; }
        public string? ProvinceName { get; set; }
        public string? ZipCode { get; set; }
        public string? CityName { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Website { get; set; }
        public string? CompanyLogo { get; set; }
        public bool? IsCompanyVerified { get; set; }
        public DateTime? CreatedDate { get; set; }

    }
}
