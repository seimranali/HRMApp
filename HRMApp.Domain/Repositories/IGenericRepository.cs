using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HRMApp.Domain.Repositories
{
    public interface IGenericRepository<T, U>
    {
        Task<T> Add(T entity);
        Task<T> Update(T entity);
        Task<T> Delete(T entity);
        Task<T> GetByID(U id);
        IQueryable<T> GetAll(Expression<Func<T, bool>>? filter = default, Func<IQueryable<T>, IOrderedQueryable<T>>? orderBy = default);
    }
}
