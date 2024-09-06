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
    public class DeleteBusinessTypeCommand : IRequest<GenericResult<BusinessType>>
    {

        public int Id { get; set; }

        //Create Nasted Class

        private class DeleteBusinessTypeCommandHandler : IRequestHandler<DeleteBusinessTypeCommand, GenericResult<BusinessType>>
        {

            private IBusinessTypeRepository _businessType;

            public DeleteBusinessTypeCommandHandler(IBusinessTypeRepository businessType)
            {
                this._businessType = businessType;
            }
            public async Task<GenericResult<BusinessType>> Handle(DeleteBusinessTypeCommand request, CancellationToken cancellationToken)
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


                    var entity = await this._businessType.GetByID(request.Id);

                    if (entity is not null)
                    {
                        var Result = await this._businessType.Delete(entity);


                        if (Result is not null)
                        {
                            genericResult.Data = Result;
                            genericResult.Status = true;
                            genericResult.Message = $"Business type {Result.BusinessTypeName} has been deleted successfully.";
                        }
                        else
                        {
                            genericResult.Status = false;
                            genericResult.Message = $"Business type {Result.BusinessTypeName} has not been deleted successfully.";
                        }

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
