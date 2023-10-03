

using Commodity.Core;
using Commodity.Core.Entities;
using Commodity.Repositories.Interfaces;

namespace Commodity.Repositories.Implementation
{
    public class MandiRepository : Repository<CropPrice>, IMandiRepository
    {
        public MandiRepository(AppDbContext db) : base(db)
        {
        }

       public async Task<bool> AddAllCropPrice(IList<CropPrice> cropPrice)
        {
            try
            {
               await _db.CropPrices.AddRangeAsync(cropPrice);
               await _db.SaveChangesAsync();
                return true;

            }catch (Exception ex)
            {
                return false;
            }
            return false;
        }

        public async Task<IEnumerable<usp_GetCropPriceBySateDateResult>> usp_GetCropPriceBySateDateResult(int stateId, DateTime date)
        {
            try
            {
                IEnumerable<usp_GetCropPriceBySateDateResult> pivotCommodtityData = await _db.Procedures.usp_GetCropPriceBySateDateAsync(stateId, date);
                return pivotCommodtityData;
            }catch (Exception ex)
            {
                return null;
            }
            return null;
        }

    }
}
