using HRMApp.Domain.Entities;
using HRMApp.Domain.Repositories;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HRMApp.Application.BusinessTypeRequest.Commands
{
    public class GetAllBusinessTypeQuery : IRequest<IQueryable<BusinessType>>
    {

        //Create Nasted Class

        private class GetAllBusinessTypeQueryHandler : IRequestHandler<GetAllBusinessTypeQuery, IQueryable<BusinessType>>
        {

            private IBusinessTypeRepository _businessType;

            public GetAllBusinessTypeQueryHandler(IBusinessTypeRepository businessType)
            {
                this._businessType = businessType;
            }
            public async Task<IQueryable<BusinessType>> Handle(GetAllBusinessTypeQuery request, CancellationToken cancellationToken)
            {



                try
                {
                    if (request is null)
                    {
                        return null;
                    }


                    return this._businessType.GetAll();



                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

    }
}
