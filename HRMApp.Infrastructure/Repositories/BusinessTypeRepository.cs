using HRMApp.Domain.Entities;
using HRMApp.Domain.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HRMApp.Infrastructure.Repositories
{
    public class BusinessTypeRepository : IBusinessTypeRepository, IDisposable
    {
        bool _disposed;
        private readonly AppDbContext _dbContext;
        public BusinessTypeRepository(AppDbContext dbContext)
        {
            this._dbContext = dbContext;
        }

        public async Task<BusinessType> Add(BusinessType entity)
        {
            try
            {
                var Result =  await this._dbContext.BusinessType.AddAsync(entity);
                return Result.Entity;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<BusinessType> Delete(BusinessType entity)
        {
            try
            {
                var Result = this._dbContext.BusinessType.Remove(entity);
                return Result.Entity;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        protected virtual void Disposed(bool disposing)
        {

            if (!_disposed)
            {

                if (disposing)
                {
                    this._dbContext.Dispose();
                }
            }

            _disposed = true;

        }

        public void Dispose()
        {
            Disposed(true);
            GC.SuppressFinalize(this);
        }

        public IQueryable<BusinessType> GetAll(Expression<Func<BusinessType, bool>>? filter = null, Func<IQueryable<BusinessType>, IOrderedQueryable<BusinessType>>? orderBy = null)
        {
            try
            {
                IQueryable<BusinessType> query = this._dbContext.BusinessType;


                if (filter is not null)
                    query = query.Where(filter);

                if (orderBy is not null)
                    query = orderBy(query);


                return query;


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<BusinessType> GetByID(int id)
        {
            try
            {
                return await this._dbContext.BusinessType.FindAsync(id);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<BusinessType> Update(BusinessType entity)
        {
            try
            {

                //UPDATE BusinessType SET BusinessTypeName={Value1}, BusinessTypeDescription={Value2} WHERE BusinessID={ID}

                var Result =  await this._dbContext.BusinessType.Where(x => x.BusinessTypeID == entity.BusinessTypeID).ExecuteUpdateAsync(f =>

                 f.SetProperty(t => t.BusinessTypeName, t => entity.BusinessTypeName)
                 .SetProperty(t => t.BusinessTypeDescription, t => entity.BusinessTypeDescription));

                if (Result > 0)
                    return entity;
                else
                    throw new Exception("An error occured.");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
