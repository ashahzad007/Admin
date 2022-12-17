using AdminWeb.Models;
using AdminWeb.Repositories.Contract;
using Microsoft.Data.SqlClient;
using System.Data;

namespace AdminWeb.Implementation
{
    public class PersonRepository :IGenericRepository<Person>
    {
        private readonly IConfiguration _configuration;

        public PersonRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<List<Person>> GetList()
        {
            List<Person> _List = new List<Person>();

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("spGetPersons", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = await cmd.ExecuteReaderAsync())
                {
                    while (await dr.ReadAsync())
                    {
                        _List.Add(new Person()
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            Name = dr["Name"].ToString(),
                            Address = dr["Address"].ToString(),
                            HomeTown = dr["HomeTown"].ToString(),
                            CreatedByUser = dr["CreatedByUser"].ToString(),
                            //CreatedDate = Convert.ToDateTime(dr["CreatedDate"]),
                            //ModifiedByUser = dr["ModifiedByUser"].ToString(),
                            //ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"])
                        });
                    }
                }
            }
            return _List;
        }

        public async Task<List<Person>> GetSingle(int? id)
        {
            List<Person> _List = new List<Person>();

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("sp_OneRecord", connection);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = await cmd.ExecuteReaderAsync())
                {
                    while (await dr.ReadAsync())
                    {
                        _List.Add(new Person()
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            Name = dr["Name"].ToString(),
                            Address = dr["Address"].ToString(),
                            HomeTown = dr["HomeTown"].ToString(),
                            CreatedByUser = dr["CreatedByUser"].ToString(),
                            //CreatedDate= Convert.ToDateTime(dr["CreatedDate"]),
                            //ModifiedByUser = dr["ModifiedByUser"].ToString(),
                            //ModifiedDate= Convert.ToDateTime(dr["ModifiedDate"])

                        });
                    }
                }
            }
            return _List;
        }

        public Task<bool> Delete(int id)
        {
            throw new NotImplementedException();
        }




        public async Task<bool> Save(Person entity)
        {
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("sp_SavePerson", connection);
                cmd.Parameters.AddWithValue("Name", entity.Name);
                cmd.Parameters.AddWithValue("Address", entity.Address);
                cmd.Parameters.AddWithValue("HomeTown", entity.HomeTown);
                cmd.Parameters.AddWithValue("CreatedByUser", entity.CreatedByUser);
                cmd.Parameters.AddWithValue("CreatedDate", entity.CreatedDate);
                cmd.Parameters.AddWithValue("ModifiedByUser", entity.ModifiedByUser);
                cmd.Parameters.AddWithValue("ModifiedDate", entity.ModifiedDate);
                cmd.CommandType = CommandType.StoredProcedure;

                int affectedRows = await cmd.ExecuteNonQueryAsync();

                if (affectedRows > 0)
                    return true;
                else
                    return false;
            }
        }

        public async Task<bool> Edit(Person entity)
        {
            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("sp_EditPerson", connection);
                cmd.Parameters.AddWithValue("Id", entity.Id);
                cmd.Parameters.AddWithValue("Name", entity.Name);
                cmd.Parameters.AddWithValue("Address", entity.Address);
                cmd.Parameters.AddWithValue("HomeTown", entity.HomeTown);
                cmd.Parameters.AddWithValue("CreatedByUser", entity.CreatedByUser);
                cmd.Parameters.AddWithValue("CreatedDate", entity.CreatedDate);
                cmd.Parameters.AddWithValue("ModifiedByUser", entity.ModifiedByUser);
                cmd.Parameters.AddWithValue("ModifiedDate", entity.ModifiedDate);
                cmd.CommandType = CommandType.StoredProcedure;

                int affectedRows = await cmd.ExecuteNonQueryAsync();

                if (affectedRows > 0)
                    return true;
                else
                    return false;
            }
        }
    }
}

