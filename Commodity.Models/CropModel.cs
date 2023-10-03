
namespace Commodity.Models
{
    public class CropModel
    {
        public string name { get; set; }
        public string img {  get; set; }
        public string stateName { get; set; }
        public RetailModel retail { get; set; }
        public WholesaleModel wholesale { get; set; }
    }
}
