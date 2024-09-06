using HRMApp.Application.Behaviors;
using HRMApp.Infrastructure;
using Microsoft.Extensions.DependencyInjection;

namespace HRMApp.Application
{
    public static class DepdendencyApplicationService
    {

        public static void AddApplicationService(this IServiceCollection services)
        {

            services.AddMediatR(config =>
            {
                config.RegisterServicesFromAssembly(typeof(DepdendencyApplicationService).Assembly);
                config.AddOpenBehavior(typeof(UnitofWorkBehavior<,>));

            });
            services.AddInfrastructureService();

        }
    }
}
