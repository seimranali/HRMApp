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
    public class GetAllBusinessTypeQuery : IRequest<GenericResult<IQueryable<BusinessType>>>
    {

        //Create Nasted Class

        private class GetAllBusinessTypeQueryHandler : IRequestHandler<GetAllBusinessTypeQuery, GenericResult<IQueryable<BusinessType>>>
        {

            private IBusinessTypeRepository _businessType;

            public GetAllBusinessTypeQueryHandler(IBusinessTypeRepository businessType)
            {
                this._businessType = businessType;
            }
            public async Task<GenericResult<IQueryable<BusinessType>>> Handle(GetAllBusinessTypeQuery request, CancellationToken cancellationToken)
            {

                GenericResult<IQueryable<BusinessType>> genericResult = new GenericResult<IQueryable<BusinessType>>();

                try
                {
                    if (request is null)
                    {

                        genericResult.Status = false;
                        genericResult.Message = "Data is not provided";
                        return genericResult;
                    }


                    var query = this._businessType.GetAll();

                    if (query is not null)
                    {

                        genericResult.Data = query;
                        genericResult.Status = true;
                        genericResult.Message = $"Business types has been found successfully.";


                    }
                    else
                    {
                        genericResult.Status = false;
                        genericResult.Message = "Data is not provided";
                    }

                    return genericResult;

                }
                catch (Exception ex)
                {
                    genericResult.Status = false;
                    genericResult.Message = ex.Message;
                    return genericResult;
                }
            }
        }

    }
}
