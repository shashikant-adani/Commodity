using Commodity.Core.Entities;

namespace Commodity.Repositories.Interfaces
{
    public interface IMandiRepository : IRepository<_2dcropPrice>
    {
        Task<bool> AddAllCropPrice(IList<_2dcropPrice> cropPrice);

        Task<IEnumerable<usp_GetCropPriceBySateDateResult>> usp_GetCropPriceBySateDateResult(int stateId, DateTime date);
    }
}
