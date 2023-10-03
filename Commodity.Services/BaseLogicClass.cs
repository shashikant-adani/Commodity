
using Commodity.Core.Entities;
using Commodity.Services.Interfaces;

namespace Commodity.Services
{
    public class BaseLogicClass
    {
        IService<StateDimension> _serviceStateDimension;
        IService<CropDimension> _serviceCropDimension;
        public BaseLogicClass(IService<StateDimension> serviceStateDimension, IService<CropDimension> serviceCropDimension) 
        {
            _serviceStateDimension = serviceStateDimension;
            _serviceCropDimension = serviceCropDimension;
        }

        public async Task<IEnumerable<StateDimension>> GetAllStateDimension()
        {
            IEnumerable<StateDimension> stateDimension = await _serviceStateDimension.GetAll();
            return stateDimension;
        }
        public async Task<IEnumerable<CropDimension>> GetAllCropDimension()
        {
            IEnumerable<CropDimension> cropDimensions = await _serviceCropDimension.GetAll();
            return cropDimensions;
        }

       
    }
}
