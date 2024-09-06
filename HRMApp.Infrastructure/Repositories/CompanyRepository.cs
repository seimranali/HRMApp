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
    public class CompanyRepository : ICompanyRepository, IDisposable
    {

        bool _disposed;

        private readonly AppDbContext _dbContext;
        public CompanyRepository(AppDbContext dbContext)
        {
            this._dbContext = dbContext;

        }


        public async Task<Company> Add(Company entity)
        {
            try
            {
                var Result = await this._dbContext.Company.AddAsync(entity);
                return Result.Entity;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<Company> Delete(Company entity)
        {
            try
            {
                var Result =  this._dbContext.Company.Remove(entity);
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

        public IQueryable<Company> GetAll(Expression<Func<Company, bool>>? filter = null, Func<IQueryable<Company>, IOrderedQueryable<Company>>? orderBy = null)
        {
            try
            {

                IQueryable<Company> query = this._dbContext.Company;
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

        public async Task<Company> GetByID(int id)
        {
            try
            {
                return await this._dbContext.Company.FindAsync(id);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<Company> Update(Company entity)
        {

            try
            {


                var Result = await this._dbContext.Company.Where(x => x.CompanyID == entity.CompanyID).ExecuteUpdateAsync(f =>

                f.SetProperty(t=> t.BusinessTypeID, t=> entity.BusinessTypeID)
                .SetProperty(t=> t.CompanyName, t=> entity.CompanyName)
                .SetProperty(t => t.CRNumber, t => entity.CRNumber)
                .SetProperty(t => t.VATNumber, t => entity.VATNumber)
                .SetProperty(t => t.AddressLine1, t => entity.AddressLine1)
                .SetProperty(t => t.AddressLine2, t => entity.AddressLine2)
                .SetProperty(t => t.CountryID, t => entity.CountryID)
                .SetProperty(t => t.ProvinceName, t => entity.ProvinceName)
                .SetProperty(t => t.ZipCode, t => entity.ZipCode)
                .SetProperty(t => t.CityName, t => entity.CityName)
                .SetProperty(t => t.Phone, t => entity.Phone)
                .SetProperty(t => t.Email, t => entity.Email)
                .SetProperty(t => t.Website, t => entity.Website)
                .SetProperty(t => t.CompanyLogo, t => entity.CompanyLogo)
                .SetProperty(t => t.IsCompanyVerified, t => entity.IsCompanyVerified)
                .SetProperty(t => t.CreatedDate, t => entity.CreatedDate));


                if (Result > 0)
                    return entity;
                else
                    throw new Exception("An error occured");

            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
    }
}

