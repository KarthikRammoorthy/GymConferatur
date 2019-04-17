using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using GymConferaturAPI.Data;
using GymConferaturAPI.Models;
using Dapper;
using Microsoft.Extensions.Configuration;

namespace GymConferaturAPI.Data
{
    public class OwnerRepository : IOwnerRepository
    {
        private readonly IConfiguration _config;
        private DynamicParameters param;

        public OwnerRepository(IConfiguration config)
        {
            _config = config;
        }

        public IDbConnection Connection
        {
            get
            {
                return new SqlConnection(_config.GetConnectionString("DefaultConnection"));
            }
        }

        public int RegisterOwner(Owner owner, string password)
        {
            int iRowsAffected = 0;
            if (Connection.State.Equals(ConnectionState.Closed))
                Connection.Open();

            byte[] passwordHash, passwordSalt;
            CreatePasswordHash(password, out passwordHash, out passwordSalt);
            param = new DynamicParameters();
            param.Add("@Owner_Number", owner.Owner_Number);
            param.Add("@Owner_Password_Hash", owner.Owner_Password_Hash);
            param.Add("@Owner_Password_Salt", owner.Owner_Password_Salt);
            param.Add("@Owner_Name", owner.Owner_Name);
            param.Add("@Owner_Address", owner.Owner_Address);
            param.Add("@Owner_City", owner.Owner_City);
            param.Add("@Owner_State", owner.Owner_State);
            param.Add("@Owner_Country", owner.Owner_Country);
            param.Add("@Owner_Zipcode", owner.Owner_Zipcode);

            iRowsAffected = Connection.Execute("spSaveOwner", param, commandType: CommandType.StoredProcedure);
            return iRowsAffected;

        }

        private void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new System.Security.Cryptography.HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
            }
        }




    }
}