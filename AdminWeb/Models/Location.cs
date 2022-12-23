using Microsoft.AspNetCore.Mvc.Rendering;

namespace AdminWeb.Models
{
    public class Location
    {
        public int Id { get; set; }
        public string LocationName { get; set; }
        public string Description { get; set; }
        public List<SelectListItem> Listofproducts { get; set; }

    }
}
