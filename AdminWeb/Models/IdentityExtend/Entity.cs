using System.ComponentModel.DataAnnotations;

namespace AdminWeb.Models.IdentityExtend
{
    public abstract class Entity
    {
        public int Id { get; set; }
        public string CreatedByUser { get; set; }
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        [DataType(DataType.Date)]
        public DateTimeOffset CreatedDate { get; set; }
        public string ModifiedByUser { get; set; }
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        [DataType(DataType.Date)]
        public DateTimeOffset ModifiedDate { get; set; }
    }
}
