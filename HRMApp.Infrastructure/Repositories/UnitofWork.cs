using HRMApp.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HRMApp.Infrastructure.Repositories
{
    public class UnitofWork : IUnitofWork
    {
        private readonly AppDbContext _dbCotnext;
        public UnitofWork(AppDbContext dbCotnext)
        {
            this._dbCotnext = dbCotnext;
        }
        public async Task<int> SaveChangesAsync(CancellationToken cancellationToken)
        {
            return await this._dbCotnext.SaveChangesAsync(cancellationToken);
        }
    }
}
