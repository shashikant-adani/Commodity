
using Commodity.Core.Entities;
using Commodity.Models;
using Microsoft.AspNetCore.Http;

namespace Commodity.Services.Interfaces
{
    public interface ICommodityService
    {
        Task<string> ReadExcelFile(IFormFile file, DateTime date);
        Task<(string status, IEnumerable<StateDimensionModel>)> GetStateDimension();
        Task<(string status, IEnumerable<CropModel>)> CommodityDatabyStateDate(int stateId, DateTime date);

    }
}
