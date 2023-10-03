using Commodity.Core.Entities;

namespace Commodity.Repositories.Interfaces
{
    public interface IMandiRepository : IRepository<CropPrice>
    {
        Task<bool> AddAllCropPrice(IList<CropPrice> cropPrice);

        Task<IEnumerable<usp_GetCropPriceBySateDateResult>> usp_GetCropPriceBySateDateResult(int stateId, DateTime date);
    }
}
