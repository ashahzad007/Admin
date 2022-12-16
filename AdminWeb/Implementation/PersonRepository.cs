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
                            HomeTown = dr["HomeTown"].ToString()

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

        public Task<bool> Edit(Person entity)
        {
            throw new NotImplementedException();
        }


        public Task<bool> Save(Person entity)
        {
            throw new NotImplementedException();
        }
    }
}

