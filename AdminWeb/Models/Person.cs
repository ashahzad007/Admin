using AdminWeb.Models.IdentityExtend;

namespace AdminWeb.Models
{
    public class Person : Entity
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string HomeTown { get; set; }
        public int LocationId { get; set; }
    }
}
