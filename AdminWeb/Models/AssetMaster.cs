namespace AdminWeb.Models
{
    public class AssetMaster
    {
        public int Id { get; set; }
        public string Coordinates { get; set; }
        public string Address { get; set; }
        public string NearbyAsset { get; set; }
        public string NearbyPoliceStation { get; set; }
        public string PSContactNumber { get; set; }
        public string SHO_Name { get; set; }
        public string SHO_Contact { get; set; }
        public int LocationId { get; set; }
    }
}
