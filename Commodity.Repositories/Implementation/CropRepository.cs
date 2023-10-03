
using Commodity.Core;
using Commodity.Core.Entities;
using Commodity.Repositories.Interfaces;

namespace Commodity.Repositories.Implementation
{
    public class CropRepository : Repository<CropDimension>, ICropRepository
    {
        public CropRepository(AppDbContext db) : base(db)
        {
        }
    }
}
