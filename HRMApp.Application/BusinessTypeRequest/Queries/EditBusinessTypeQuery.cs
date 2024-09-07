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
    public class EditBusinessTypeQuery : IRequest<BusinessType>
    {

        public int Id { get; set; }

        //Create Nasted Class

        private class EditBusinessTypeCommandHandler : IRequestHandler<EditBusinessTypeQuery, BusinessType>
        {

            private IBusinessTypeRepository _businessType;

            public EditBusinessTypeCommandHandler(IBusinessTypeRepository businessType)
            {
                this._businessType = businessType;
            }
            public async Task<BusinessType> Handle(EditBusinessTypeQuery request, CancellationToken cancellationToken)
            {


                try
                {
                    if (request is null)
                    {


                        return null;
                    }


                    return await this._businessType.GetByID(request.Id);


                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

    }
}
