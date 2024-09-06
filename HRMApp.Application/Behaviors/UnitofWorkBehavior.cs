using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HRMApp.Domain.Repositories;
using MediatR;

namespace HRMApp.Application.Behaviors
{
    public sealed class UnitofWorkBehavior<TRequest, TResponse> : IPipelineBehavior<TRequest, TResponse> where TRequest : class
    {

        private readonly IUnitofWork _unitofWork;
        public UnitofWorkBehavior(IUnitofWork unitofWork)
        {
            this._unitofWork = unitofWork;
        }

        public async Task<TResponse> Handle(TRequest request, RequestHandlerDelegate<TResponse> next, CancellationToken cancellationToken)
        {
            try
            {

                if (IfNotCommand())
                {

                    return await next();

                }


                var response = await next();


                await this._unitofWork.SaveChangesAsync(cancellationToken);

                return response;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        private static bool IfNotCommand()
        {
            return !typeof(TRequest).Name.EndsWith("Command");

        }



    }
}
