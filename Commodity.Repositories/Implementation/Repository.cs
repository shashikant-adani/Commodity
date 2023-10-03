

using Commodity.Core;
using Commodity.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace Commodity.Repositories.Implementation
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        protected AppDbContext _db;
        public Repository(AppDbContext db)
        {
            _db = db;
        }
        public async Task<IEnumerable<TEntity>> GetAll()
        {
            return await _db.Set<TEntity>().ToListAsync();
        }
        public async Task<TEntity> Find(object id)
        {
            return await _db.Set<TEntity>().FindAsync(id);
        }

        public async Task Add(TEntity entity)
        {
            _db.Set<TEntity>().Add(entity);
        }
        public async Task Update(TEntity entity)
        {
            _db.Set<TEntity>().Update(entity);
        }

        public async Task Delete(object id)
        {
            TEntity entity = await _db.Set<TEntity>().FindAsync(id);
            if (entity != null)
            {
                _db.Set<TEntity>().Remove(entity);
            }
        }

        public async Task Remove(TEntity entity)
        {
            _db.Set<TEntity>().Remove(entity);
        }

        public async Task<int> SaveChanges()
        {
            return await _db.SaveChangesAsync();
        }

        
    }
}
