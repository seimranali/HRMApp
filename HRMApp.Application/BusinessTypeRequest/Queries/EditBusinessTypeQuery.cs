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
    public class EditBusinessTypeQuery : IRequest<GenericResult<BusinessType>>
    {

        public int Id { get; set; }

        //Create Nasted Class

        private class EditBusinessTypeCommandHandler : IRequestHandler<EditBusinessTypeQuery, GenericResult<BusinessType>>
        {

            private IBusinessTypeRepository _businessType;

            public EditBusinessTypeCommandHandler(IBusinessTypeRepository businessType)
            {
                this._businessType = businessType;
            }
            public async Task<GenericResult<BusinessType>> Handle(EditBusinessTypeQuery request, CancellationToken cancellationToken)
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

                        genericResult.Data = entity;
                        genericResult.Status = true;
                        genericResult.Message = $"Business type {entity.BusinessTypeName} has been found successfully.";


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
