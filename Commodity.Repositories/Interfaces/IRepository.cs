
using System.Linq.Expressions;

namespace Commodity.Repositories.Interfaces
{
    public interface IRepository<TEntity> where TEntity : class
    {
        public Task<IEnumerable<TEntity>> GetAll();
        public Task<TEntity> Find(object id);
        Task Add(TEntity entity);
        Task Update(TEntity entity);
        Task Remove(TEntity entity);
        Task Delete(object id);
        Task<int> SaveChanges();
    }
}
