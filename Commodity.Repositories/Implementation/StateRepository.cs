

using Commodity.Core;
using Commodity.Core.Entities;
using Commodity.Repositories.Interfaces;

namespace Commodity.Repositories.Implementation
{
    public class StateRepository : Repository<StateDimension>, IStateRepository
    {
        public StateRepository(AppDbContext db) : base(db)
        {
        }
    }
}
