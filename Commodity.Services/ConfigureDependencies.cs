using Commodity.Core;
using Commodity.Core.Entities;
using Commodity.Repositories.Implementation;
using Commodity.Repositories.Interfaces;
using Commodity.Services.Implementations;
using Commodity.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using OfficeOpenXml;

namespace Commodity.Services
{
    public class ConfigureDependencies
    {
        public static void RegisterServices(IServiceCollection services, IConfiguration configuration)
        {
            
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            //Database
            services.AddDbContext<AppDbContext>(options =>
            {
                options.UseSqlServer(configuration.GetConnectionString("DbConnection"));
            });
            services.AddScoped<DbContext, AppDbContext>();

            //Repositories
            services.AddScoped<IRepository<CropPrice>, Repository<CropPrice>>();
            services.AddScoped<IRepository<CropDimension>, Repository<CropDimension>>();
            services.AddScoped<IRepository<StateDimension>, Repository<StateDimension>>();
            services.AddScoped<IMandiRepository,MandiRepository>();
            services.AddScoped<ICropRepository,CropRepository>();
            services.AddScoped<IStateRepository,StateRepository>();

            //Services
            services.AddScoped<IService<CropPrice>, Service<CropPrice>>();
            services.AddScoped<IService<CropDimension>, Service<CropDimension>>();
            services.AddScoped<IService<StateDimension>, Service<StateDimension>>();
            services.AddScoped<ICommodityService, CommodityService>();

            services.AddScoped<BaseLogicClass>();
        }
    }
}
