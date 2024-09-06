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
    public class CreateBusinessTypeCommand : IRequest<GenericResult<BusinessType>>
    {

        //Request Property

        public BusinessType BusinessType { get; set; }


        private class CreateBusinessTypeCommandHandler : IRequestHandler<CreateBusinessTypeCommand, GenericResult<BusinessType>>
        {
            private readonly IBusinessTypeRepository _businessType;

            public CreateBusinessTypeCommandHandler(IBusinessTypeRepository businessType)
            {

                this._businessType = businessType;
            }


            public async Task<GenericResult<BusinessType>> Handle(CreateBusinessTypeCommand request, CancellationToken cancellationToken)
            {
                GenericResult<BusinessType> genericResult = new GenericResult<BusinessType>();

                try
                {


                    if (request == null)
                    {

                        genericResult.Status = false;
                        genericResult.Message = "Data is not provided";
                        return genericResult;

                    }


                    var Result = await this._businessType.Add(request.BusinessType);


                    if (Result is not null)
                    {

                        genericResult.Data = Result;
                        genericResult.Status = true;
                        genericResult.Message = $"Business type {Result.BusinessTypeName} has been saved successfully.";
                    }
                    else
                    {
                        genericResult.Status = false;
                        genericResult.Message = $"Business type {Result.BusinessTypeName} has not been saved successfully.";
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
