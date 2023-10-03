
using Commodity.Repositories.Interfaces;
using Commodity.Services.Interfaces;

namespace Commodity.Services.Implementations
{
    public class Service<TEntity> : IService<TEntity> where TEntity : class
    {
        IRepository<TEntity> _repo;
        public Service(IRepository<TEntity> repo)
        {
            _repo = repo;
        }

        public async Task<IEnumerable<TEntity>> GetAll()
        {
            return await _repo.GetAll();
        }

        public async Task<TEntity> Find(object id)
        {
            return await _repo.Find(id);
        }

        public async Task Add(TEntity entity)
        {
            await _repo.Add(entity);
            await _repo.SaveChanges();
        }
        public async Task Update(TEntity entity)
        {
            await _repo.Update(entity);
            await _repo.SaveChanges();
        }

        public async Task Delete(object id)
        {
            await _repo.Delete(id);
            await _repo.SaveChanges();
        }

        public async Task Remove(TEntity entity)
        {
            await _repo.Remove(entity);
            await _repo.SaveChanges();
        }

    }
}
