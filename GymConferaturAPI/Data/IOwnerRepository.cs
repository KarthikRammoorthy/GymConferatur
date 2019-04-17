using System.Threading.Tasks;
using GymConferaturAPI.Models;

namespace GymConferaturAPI.Data
{
    public interface IAuthRepository
    {
          Task<Owner> RegisterAsync(Owner owner, string password);
         Task<Owner> LoginAsync(string ownername, string password);
         Task<bool> UserExistsAsync(string ownername);
    }
}