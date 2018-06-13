using System;
using System.Linq;
using LocaMat.Metier;
using LocaMat.UI.Framework;

namespace LocaMat.UI
{
    public class ModuleGestionClients
    {
        private Menu menu;

        private void InitialiserMenu()
        {
            this.menu = new Menu("Gestion des clients");
            this.menu.AjouterElement(new ElementMenu("1", "Afficher les clients")
            {
                FonctionAExecuter = this.AfficherClients
            });
            this.menu.AjouterElement(new ElementMenu("2", "Ajouter un client")
            {
                FonctionAExecuter = this.AjouterClient
            });
            this.menu.AjouterElement(new ElementMenu("3", "Supprimer un client")
            {
                FonctionAExecuter = this.SupprimerClient
            });
            this.menu.AjouterElement(new ElementMenu("4", "Rechercher un client")
            {
                FonctionAExecuter = this.RechercherClient
            });
            this.menu.AjouterElement(new ElementMenu("5", "Modifier un client")
            {
                FonctionAExecuter = this.ModifierClient
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

        private void AfficherClients()
        {
            ConsoleHelper.AfficherEntete("Clients");

            var liste = Application.GetBaseDonnees().Clients.ToList();
            ConsoleHelper.AfficherListe(liste);

        }

        private void AjouterClient()
        {
            ConsoleHelper.AfficherEntete("Nouveau client");

            var client = new Client
            {
                Nom = ConsoleSaisie.SaisirChaine("Nom : ", false),
                Prenom = ConsoleSaisie.SaisirChaine("Prénom : ", false),
                Adresse = ConsoleSaisie.SaisirChaine("Adresse : ", false)
            };

            using (var bd = Application.GetBaseDonnees())
            {
                bd.Clients.Add(client);
                bd.SaveChanges();

            }
        }
        private void SupprimerClient()
        {
            ConsoleHelper.AfficherEntete("Supprimer un client");

            var liste = Application.GetBaseDonnees().Clients.ToList();
            ConsoleHelper.AfficherListe(liste);

            var id = ConsoleSaisie.SaisirEntierObligatoire("Numero Id: ");

            using (var sup = Application.GetBaseDonnees())
            {
                var client = sup.Clients.Single(x => x.Id == id);
                sup.Clients.Remove(client);
                sup.SaveChanges();

            }
        }
        private void RechercherClient()
        {
            ConsoleHelper.AfficherEntete("Rechercher un client");
            var nom = ConsoleSaisie.SaisirChaine("Entrez un nom ", false);

            using (var rec = Application.GetBaseDonnees())
            {
                var liste = rec.Clients.Where(x => x.Nom.Contains(nom));
                ConsoleHelper.AfficherListe(liste);


            }
        }
        private void ModifierClient()
        {
            ConsoleHelper.AfficherEntete("Modifier un client");
            var liste = Application.GetBaseDonnees().Clients.ToList();
            ConsoleHelper.AfficherListe(liste);
            var id = ConsoleSaisie.SaisirEntierObligatoire("Id");
            

            using (var mod = Application.GetBaseDonnees())
            {
                var client = mod.Clients.Single(x => x.Id == id);
                ConsoleHelper.AfficherEntete("Choisir l'index à modifier :");
                var index = ConsoleSaisie.SaisirEntierOptionnel("index à modifier :  1=Nom 2=Prénom 3=Adresse");


               switch  (index)
                {
                    case 1:
                       
                    client.Nom = ConsoleSaisie.SaisirChaine("nom", false);
                        break;

                    case 2:
                       
                    client.Prenom = ConsoleSaisie.SaisirChaine("prenom", false);
                        break;

                    case 3:
                       
                        client.Adresse = ConsoleSaisie.SaisirChaine("Adresse", false);
                        break;

                    default :
                        Console.WriteLine("Erreur de saisie");
                        break;
                }

                
               
                mod.SaveChanges();
            }

        }
    }
}
