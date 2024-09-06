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
    public class UpdateBusinessTypeCommand : IRequest<GenericResult<BusinessType>>
    {

        public BusinessType BusinessType { get; set; }

        //Create Nested Class
        private class UpdateBusinessTypeCommandHandler : IRequestHandler<UpdateBusinessTypeCommand, GenericResult<BusinessType>>
        {

            private readonly IBusinessTypeRepository _businessType;
            public UpdateBusinessTypeCommandHandler(IBusinessTypeRepository businessType)
            {
                this._businessType = businessType;
            }


            public async Task<GenericResult<BusinessType>> Handle(UpdateBusinessTypeCommand request, CancellationToken cancellationToken)
            {
                GenericResult<BusinessType> genericResult = new GenericResult<BusinessType>();
                try
                {

                    if (request is null)
                    {
                        genericResult.Status = false;
                        genericResult.Message = "Data is not provided";
                        return genericResult;
                    }


                    var Result = await this._businessType.Update(request.BusinessType);

                    if (Result is not null)
                    {

                        genericResult.Data = Result;
                        genericResult.Status = true;
                        genericResult.Message = $"Business type {Result.BusinessTypeName} has been updated successfully.";
                    }
                    else
                    {
                        genericResult.Status = false;
                        genericResult.Message = $"Business type {Result.BusinessTypeName} has not been updated successfully.";
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
