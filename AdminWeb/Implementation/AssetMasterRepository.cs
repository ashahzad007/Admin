using AdminWeb.Models;
using AdminWeb.Repositories.Contract;
using Microsoft.Data.SqlClient;
using System.Data;

namespace AdminWeb.Implementation
{
    public class AssetMasterRepository : IGenericRepository<AssetMaster>
    {
        private readonly IConfiguration _configuration;

        public AssetMasterRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<List<AssetMaster>> GetList()
        {
            List<AssetMaster> _List = new List<AssetMaster>();

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("spGetLocations", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = await cmd.ExecuteReaderAsync())
                {
                    while (await dr.ReadAsync())
                    {
                        _List.Add(new AssetMaster()
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            Coordinates = dr["Coordinates"].ToString(),
                            Address = dr["Description"].ToString(),
                         
                            //CreatedDate = Convert.ToDateTime(dr["CreatedDate"]),
                            //ModifiedByUser = dr["ModifiedByUser"].ToString(),
                            //ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"])
                        });
                    }
                }
            }
            return _List;
        }

        public async Task<List<AssetMaster>> GetSingle(int? id)
        {
            List<AssetMaster> _List = new List<AssetMaster>();

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("sp_OneRecord", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = await cmd.ExecuteReaderAsync())
                {
                    while (await dr.ReadAsync())
                    {
                        _List.Add(new AssetMaster()
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            Coordinates = dr["LocationName"].ToString(),
                            Address = dr["Description"].ToString(),
                            //CreatedDate= Convert.ToDateTime(dr["CreatedDate"]),
                            //ModifiedByUser = dr["ModifiedByUser"].ToString(),
                            //ModifiedDate= Convert.ToDateTime(dr["ModifiedDate"])

                        });
                    }
                }
            }
            return _List;
        }


        public async Task<bool> Save(AssetMaster entity)
        {
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("sp_SaveLocation", connection);
                cmd.Parameters.AddWithValue("LocationName", entity.Coordinates);
                cmd.Parameters.AddWithValue("Description", entity.Address);
               
                cmd.CommandType = CommandType.StoredProcedure;

                int affectedRows = await cmd.ExecuteNonQueryAsync();

                if (affectedRows > 0)
                    return true;
                else
                    return false;
            }
        }

        public async Task<bool> Edit(AssetMaster entity)
        {
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("sp_EditLocation", connection);
                cmd.Parameters.AddWithValue("Id", entity.Id);
                cmd.Parameters.AddWithValue("LocationName", entity.Coordinates);
                cmd.Parameters.AddWithValue("Description", entity.Address);
                cmd.CommandType = CommandType.StoredProcedure;

                int affectedRows = await cmd.ExecuteNonQueryAsync();

                if (affectedRows > 0)
                    return true;
                else
                    return false;
            }
        }

        public async Task<bool> Delete(int? id)
        {
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("spDeleteLocation", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", id);
                int affectedRows = await cmd.ExecuteNonQueryAsync();

                if (affectedRows > 0)
                    return true;
                else
                    return false;

            }
        }
    }
}

