using Microsoft.AspNetCore.Identity;

namespace AdminWeb.Models.IdentityExtend
{
    public class ApplicationUser : IdentityUser
    {
        public string Name { get; set; }
        public string EmployeeCode { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
    }
}
