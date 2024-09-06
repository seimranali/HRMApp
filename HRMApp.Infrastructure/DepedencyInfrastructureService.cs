using HRMApp.Domain.Repositories;
using HRMApp.Infrastructure.Repositories;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HRMApp.Infrastructure
{
    public static class DepedencyInfrastructureService
    {
        //Inject Interfaces
        public static void AddInfrastructureService(this IServiceCollection services)
        {

            services.AddScoped<IUnitofWork, UnitofWork>();
            services.AddScoped<IBusinessTypeRepository, BusinessTypeRepository>();
            services.AddScoped<ICompanyRepository, CompanyRepository>();


        }

    }
}
