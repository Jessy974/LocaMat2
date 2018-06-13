using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using LocaMat.Metier;

namespace LocaMat.DAL
{
    public class BasesDonnees : DbContext

    {
        public BasesDonnees(string connectionstring = "Connexion")
            : base(connectionstring)
        {
        }
        public DbSet<Agence> Agences { get; set; }

        public DbSet<CategorieProduit> CategorieProduits{ get; set; }

        public DbSet<Client> Clients { get; set; }

        public DbSet<Location> Locations { get; set; }

        public DbSet<OffreProduit> OffreProduits { get; set; }

        public DbSet<Produit> Produits { get; set; }
    }
}
