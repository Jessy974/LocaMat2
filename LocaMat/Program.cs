using LocaMat.UI;
using System.Configuration;
using System.Data.SqlClient;

namespace LocaMat
{
    class Program
    {
        static void Main(string[] args)
        {
            var application = new Application();
            application.Demarrer();
        }
    }
}
