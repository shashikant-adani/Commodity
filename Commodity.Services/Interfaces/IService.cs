

namespace Commodity.Services.Interfaces
{
    public interface IService<TEntity> where TEntity : class
    {
        public Task<IEnumerable<TEntity>> GetAll();
        public Task<TEntity> Find(object id);
        Task Add(TEntity entity);
        Task Update(TEntity entity);
        Task Remove(TEntity entity);
        Task Delete(object id);
    }
}
