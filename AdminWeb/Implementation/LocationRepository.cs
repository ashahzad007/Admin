using AdminWeb.Models;
using AdminWeb.Repositories.Contract;
using Microsoft.Data.SqlClient;
using System.Data;

namespace AdminWeb.Implementation
{
    public class LocationRepository : IGenericRepository<Location>
    {
        private readonly IConfiguration _configuration;

        public LocationRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<List<Location>> GetList()
        {
            List<Location> _List = new List<Location>();

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("spGetLocations", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = await cmd.ExecuteReaderAsync())
                {
                    while (await dr.ReadAsync())
                    {
                        _List.Add(new Location()
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            LocationName = dr["LocationName"].ToString(),
                            Description = dr["Description"].ToString(),
                         
                            //CreatedDate = Convert.ToDateTime(dr["CreatedDate"]),
                            //ModifiedByUser = dr["ModifiedByUser"].ToString(),
                            //ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"])
                        });
                    }
                }
            }
            return _List;
        }

        public async Task<List<Location>> GetSingle(int? id)
        {
            List<Location> _List = new List<Location>();

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("sp_OneRecord", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = await cmd.ExecuteReaderAsync())
                {
                    while (await dr.ReadAsync())
                    {
                        _List.Add(new Location()
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            LocationName = dr["LocationName"].ToString(),
                            Description = dr["Description"].ToString(),
                            //CreatedDate= Convert.ToDateTime(dr["CreatedDate"]),
                            //ModifiedByUser = dr["ModifiedByUser"].ToString(),
                            //ModifiedDate= Convert.ToDateTime(dr["ModifiedDate"])

                        });
                    }
                }
            }
            return _List;
        }


        public async Task<bool> Save(Location entity)
        {
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("sp_SaveLocation", connection);
                cmd.Parameters.AddWithValue("LocationName", entity.LocationName);
                cmd.Parameters.AddWithValue("Description", entity.Description);
               
                cmd.CommandType = CommandType.StoredProcedure;

                int affectedRows = await cmd.ExecuteNonQueryAsync();

                if (affectedRows > 0)
                    return true;
                else
                    return false;
            }
        }

        public async Task<bool> Edit(Location entity)
        {
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("sp_EditLocation", connection);
                cmd.Parameters.AddWithValue("Id", entity.Id);
                cmd.Parameters.AddWithValue("LocationName", entity.LocationName);
                cmd.Parameters.AddWithValue("Description", entity.Description);
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

