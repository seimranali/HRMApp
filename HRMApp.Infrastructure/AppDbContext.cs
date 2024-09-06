using HRMApp.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace HRMApp.Infrastructure
{
    public class AppDbContext:DbContext
    {

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }


        public DbSet<BusinessType> BusinessType { get; set; }
        public DbSet<Company> Company { get; set; }




    }
}
