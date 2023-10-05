using Commodity.Models;
using Commodity.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Globalization;
using System.Net;

namespace Commodity.API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class CommodityController : ControllerBase
    {
        ICommodityService _commodityService;
        enum successStatus { True, False }
        public CommodityController(ICommodityService commodityService)
        {
            _commodityService = commodityService;
        }
    

        [HttpPost("UploadCommodity")]
        [ProducesResponseType(typeof(string), (int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(string), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(string), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> UploadCommodity(IFormFile file, string date)
        {
            try
            {
                DateTime dateObj;
                if (date != null)
                {
                    dateObj = DateTime.ParseExact(date, "dd-MM-yyyy", CultureInfo.CurrentCulture);
                }
                else
                {
                    return BadRequest(new
                    {
                        Message = "Date is Not Valid. Date format is 'dd-MM-yyyy'."
                    });
                }
                var status = await _commodityService.ReadExcelFile(file, dateObj);
                if (status == successStatus.True.ToString())
                {
                    return Ok(
                        new
                        {
                            Status = status
                        });
                }
                return BadRequest();
            }catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpGet("StateDimension")]
        [ProducesResponseType(typeof(string), (int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(string), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(string), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetStateDimension()
        {
            try
            {
                (var status, IEnumerable<StateDimensionModel> stateDimensionModels) = await _commodityService.GetStateDimension();
                if (!string.IsNullOrEmpty(status))
                {
                    return Ok(new
                    {
                        Status = status,
                        Data = stateDimensionModels
                    });
                }
                return BadRequest();
            }catch(Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError,ex.Message);
            }
        }

        [HttpGet("GetCommodity")]
        [ProducesResponseType(typeof(string), (int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(string), (int)HttpStatusCode.BadRequest)]
        [ProducesResponseType(typeof(string), StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetCommoditybyStateDate([FromQuery] GetCommodityModel model)
        {
            try
            {
                DateTime dateObj;
                if (model.Date != null)
                {
                    dateObj = DateTime.ParseExact(model.Date, "dd-MM-yyyy", CultureInfo.CurrentCulture);
                }
                else
                {
                    return BadRequest(new
                    {
                        Message = "Date is Not Valid. Date format is 'dd-MM-yyyy'."
                    });
                }
                (var status, IEnumerable<CropModel> results) = await _commodityService.CommodityDatabyStateDate(model.StateId, dateObj);
                if (!string.IsNullOrEmpty(status))
                {
                    return Ok(new
                    {
                        status = status,
                        data = results
                    });
                }
                return BadRequest();
            }catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }
    }
}
