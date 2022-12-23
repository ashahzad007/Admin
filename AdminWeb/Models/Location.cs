namespace AdminWeb.Models
{
    public class Location
    {
        public int Id { get; set; }
        public string LocationName { get; set; }
        public string Description { get; set; }
        public List<Location> Listoflocations { get; set; }

    }
}
