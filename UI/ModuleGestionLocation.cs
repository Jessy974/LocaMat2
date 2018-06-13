using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LocaMat.UI;
using LocaMat.UI.Framework;
using LocaMat.Metier;





namespace LocaMat
{

    class ModuleGestionLocation
    {
        private Menu menu;

        private void InitialiserMenu()
        {
            this.menu = new Menu("Gestion de la location");

            this.menu.AjouterElement(new ElementMenu("1", "Afficher les locations")
            {
                FonctionAExecuter = this.AfficherLocations
            });
            this.menu.AjouterElement(new ElementMenu("2", "Créer une location")
            {
                FonctionAExecuter = this.CreerLocation
            });

            this.menu.AjouterElement(new ElementMenuQuitterMenu("R", "Revenir au menu principal..."));
        }
        public void Demarrer()
        {
            if (this.menu == null)
            {
                this.InitialiserMenu();
            }

            this.menu.Afficher();
        }

        public void AfficherLocations()
        {

            ConsoleHelper.AfficherEntete("Location");
            var location = Application.GetBaseDonnees().Locations.ToList();
            ConsoleHelper.AfficherListe(location);
        


        }
        public void CreerLocation()
        {
            ConsoleHelper.AfficherEntete("Agence");
            var agence = Application.GetBaseDonnees().Agences.ToList();
            ConsoleHelper.AfficherListe(agence);



            using (var bd = Application.GetBaseDonnees())
            {
                var id = ConsoleSaisie.SaisirEntierObligatoire("Entrer Id de l'agence");

                var liste = bd.OffreProduits.Where(x => x.IdAgence == id);
                ConsoleHelper.AfficherListe(liste);
                

            }

        }

    }
}
