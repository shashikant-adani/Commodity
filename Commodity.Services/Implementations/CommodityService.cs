using Commodity.Core.Entities;
using Commodity.Models;
using Commodity.Repositories.Interfaces;
using Commodity.Services.Interfaces;
using Microsoft.AspNetCore.Http;
using OfficeOpenXml;

namespace Commodity.Services.Implementations
{
    public class CommodityService : ICommodityService
    {
        BaseLogicClass _baseLogic;
        IMandiRepository _mandiRepository;
        enum sheetName { Retail, Wholesale }
        public CommodityService(BaseLogicClass baseLogic, IMandiRepository mandiRepository)
        {
            _baseLogic = baseLogic;
            _mandiRepository = mandiRepository;
        }
        public async Task<string> ReadExcelFile(IFormFile file, DateTime date)
        {
            try
            {
                if (file != null && file.Length > 0)
                {
                    using (var stream = new MemoryStream())
                    {
                        await file.CopyToAsync(stream);
                        using (var package = new ExcelPackage(stream))
                        {
                            //var worksheet = package.Workbook.Worksheets.First();
                            var retailWorksheet = package.Workbook.Worksheets[sheetName.Retail.ToString()];
                            var wholeSaleWorksheet = package.Workbook.Worksheets[sheetName.Wholesale.ToString()];
                            var retailrowCount = retailWorksheet.Dimension.Rows;
                            var retailcolCount = retailWorksheet.Dimension.Columns;
                            var wholesalerowCount = wholeSaleWorksheet.Dimension.Rows;
                            var wholesalecolCount = wholeSaleWorksheet.Dimension.Columns;

                            IEnumerable<StateDimension> stateDimensionsList = await _baseLogic.GetAllStateDimension();
                            IEnumerable<CropDimension> cropDimensionsList = await _baseLogic.GetAllCropDimension();
                           

                            IList<_2dcropPrice> cropPricesList = new List<_2dcropPrice>();

                            if(retailWorksheet.Name == sheetName.Retail.ToString())
                            {
                                for (int row = 3; row <= retailrowCount; row++)
                                {
                                    var stateDimensionName = retailWorksheet.Cells[row, 1].Value.ToString();
                                    int stateDimensionId = stateDimensionsList.Where(s => s.StateName == stateDimensionName).Select(s => s.Id).FirstOrDefault();
                                    for (int col = 2; col <= retailcolCount; col++)
                                    {
                                        var cropDimensionName = retailWorksheet.Cells[2, col].Value.ToString();
                                        int cropDimensionId = cropDimensionsList.Where(c => c.CropName == cropDimensionName).Select(c => c.Id).FirstOrDefault();
                                        var price = retailWorksheet.Cells[row, col]!.Value?.ToString();
                                        if (!string.IsNullOrEmpty(price))
                                        {
                                            _2dcropPrice cropPrices = new _2dcropPrice {  Retail = price, CropDimensionId = cropDimensionId, StateDimensionId = stateDimensionId, Date = date };
                                            cropPricesList.Add(cropPrices);
                                        }
                                        else
                                        {
                                            _2dcropPrice cropPrices = new _2dcropPrice { Retail = "NA", CropDimensionId = cropDimensionId, StateDimensionId = stateDimensionId, Date = date };
                                            cropPricesList.Add(cropPrices);
                                        }
                                        
                                    }
                                }
                            }

                            if (wholeSaleWorksheet.Name == sheetName.Wholesale.ToString())
                            {
                                for(int row = 3; row <= wholesalerowCount; row++)
                                {
                                    var stateDimensionName = wholeSaleWorksheet.Cells[row, 1].Value.ToString();
                                    int stateDimensionId = stateDimensionsList.Where(s => s.StateName == stateDimensionName).Select(s => s.Id).FirstOrDefault();

                                    for (int col = 2; col <= wholesalecolCount; col++)
                                    {
                                        var cropDimensionName = wholeSaleWorksheet.Cells[2,col].Value.ToString();
                                        int cropDimensionId = cropDimensionsList.Where(c => c.CropName == cropDimensionName).Select(c => c.Id).FirstOrDefault();
                                        var price = wholeSaleWorksheet.Cells[row,col].Value?.ToString();
                                        if(!string.IsNullOrEmpty(price))
                                        {
                                            _2dcropPrice cropPrices = new _2dcropPrice { Wholesale = price, CropDimensionId = cropDimensionId, StateDimensionId = stateDimensionId, Date = date };
                                            cropPricesList.Add(cropPrices);
                                        }
                                        else
                                        {
                                            _2dcropPrice cropPrices = new _2dcropPrice { Wholesale = "NA", CropDimensionId = cropDimensionId, StateDimensionId = stateDimensionId, Date = date };
                                            cropPricesList.Add(cropPrices);
                                        }
                                    }
                                }
                            }

                            bool isInsertedCropPrice = await _mandiRepository.AddAllCropPrice(cropPricesList);

                            return isInsertedCropPrice.ToString();

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return null;
            }
            return null;
        }

        public async Task<(string status, IEnumerable<StateDimensionModel>)> GetStateDimension()
        {
            try
            {
                IEnumerable<StateDimension> stateDimension = await _baseLogic.GetAllStateDimension();
                List<int> removeIds = new List<int> { 34, 35, 36, 37 };
                IEnumerable<StateDimensionModel> stateDimensionModels = stateDimension.Where(s=> !removeIds.Contains(s.Id)).Select(s => new StateDimensionModel
                {
                    Id = s.Id,
                    Name = s.StateName
                });
                return ("Okay",stateDimensionModels);
            }catch(Exception ex)
            {
                return (null, null);
            }
            return (null, null);
        }

        public async Task<(string status,IEnumerable<CropModel>)> CommodityDatabyStateDate(int stateId, DateTime date)
        {
            try
            {
                IEnumerable<usp_GetCropPriceBySateDateResult> pivotCommodtityData = await _mandiRepository.usp_GetCropPriceBySateDateResult(stateId, date);
                IEnumerable<CropModel> cropModel = pivotCommodtityData.Select(pcd => new CropModel
                {
                    name = pcd.crop_name,
                    img = pcd.image,
                    stateName = pcd.State_Name,
                    retail = new RetailModel
                    {
                        price = pcd.Retail,
                        min = pcd.Minimum_Retail,
                        max = pcd.Maximum_Retail,
                        avg = pcd.Average_Retail,
                        modal = pcd.Modal_Retail
                    },
                    wholesale = new WholesaleModel
                    {
                        price = pcd.Wholesale,
                        min = pcd.Minimum_Wholesale,
                        max = pcd.Maximum_Wholesale,
                        avg = pcd.Average_Wholesale,
                        modal = pcd.Modal_Wholesale
                    }
                });
                return("Okay", cropModel);
            }catch (Exception ex)
            {
                return (null, null);
            }
            return (null, null);
        }
    }

}
