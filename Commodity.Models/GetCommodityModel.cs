
using System.ComponentModel.DataAnnotations;

namespace Commodity.Models
{
    public class GetCommodityModel
    {
        [Required(ErrorMessage = "State-Id is Required. ")]
        public int StateId { get; set; }

        [Required(ErrorMessage = "Date of Birth is required.")]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yy}", ApplyFormatInEditMode = true)]
        [RegularExpression(@"^\d{2}-\d{2}-\d{4}$", ErrorMessage = "Invalid date format. Use dd-MM-yy.")]
        public string Date { get; set; }
    }
}
