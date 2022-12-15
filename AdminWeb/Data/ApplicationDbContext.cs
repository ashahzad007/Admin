using AdminWeb.Models;
using AdminWeb.Models.IdentityExtend;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace AdminWeb.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        //Extend Identity User CLass.
        public DbSet<ApplicationUser> ApplicationUsers { get; set; }
        public virtual DbSet<Person> Person { get; set; }
    }
}