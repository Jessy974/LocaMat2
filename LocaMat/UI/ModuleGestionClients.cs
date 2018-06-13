using System;
using LocaMat.Metier;
using LocaMat.UI.Framework;
using System.Data.SqlClient;
using System.Collections.Generic;

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
            var listeClient = RecupererListeClient();
            ConsoleHelper.AfficherListe(listeClient);
            //Console.WriteLine("TO DO");
            
        }

        private void AjouterClient()
        {
            ConsoleHelper.AfficherEntete("Nouveau client");

            /* var client = new Client
             {
                 Nom = ConsoleSaisie.SaisirChaine("Nom : ", false),
                 Prenom = ConsoleSaisie.SaisirChaine("Prénom : ", false),
                 Adresse = ConsoleSaisie.SaisirChaine("Adresse : ", false)
             };*/
            var connectionString = Menu.GetConnexion();

            Console.WriteLine("Entrez le nom");
            var nom = ConsoleSaisie.SaisirChaine("Nom : ", false);


            Console.WriteLine("Entrez le prénom");
            var prenom = ConsoleSaisie.SaisirChaine("Prénom : ", false);

            Console.WriteLine("Entrez l'Adresse");
            var adresse = ConsoleSaisie.SaisirChaine("Adresse : ", false);

            var connectionStrings = Menu.GetConnexion();

            //Méthode condensée
            using (var connexion = Menu.GetConnexion())
            {
                var sql = "INSERT INTO Clients (Nom,Prenom,Adresse) Values (@Nom,@Prenom,@Adresse)";
                var commande = new SqlCommand(sql, connexion);
                commande.Parameters.Add(new SqlParameter
                {
                    ParameterName = "Nom",
                    Value = nom
                });
                commande.Parameters.Add(new SqlParameter
                {
                    ParameterName = "Prenom",
                    Value = prenom
                });
                commande.Parameters.Add(new SqlParameter
                {
                    ParameterName = "Adresse",
                    Value = adresse
                });

                connexion.Open();
                commande.ExecuteNonQuery();
                connexion.Close();
            }

            Console.WriteLine("TO BE CONTINUED");
        }
        private List<Client> RecupererListeClient()
        {

            // Création de la connecion
            var connectionString = Menu.GetConnexion();


            //Méthode condensée
            using (var connexion = Menu.GetConnexion())
            {
                // création d'une commande SQL
                var commande = new SqlCommand("SELECT* FROM Clients ", connexion);
                var listeClient = new List<Client>();

                // Mode connecté
                connexion.Open();
                using (var dataReader = commande.ExecuteReader())
                {
                    while (dataReader.Read())
                    {

                        var indexColonneNom = dataReader.GetOrdinal("Nom");
                        var indexColonnePrenom = dataReader.GetOrdinal("Prenom");
                        var indexColonneAdresse = dataReader.GetOrdinal("Adresse");
                        var clients = new Client
                        {


                            Nom = dataReader.GetString(indexColonneNom),
                            Prenom = dataReader.GetString(indexColonnePrenom),
                            Adresse = dataReader.GetString(indexColonneAdresse)

                        };
                        listeClient.Add(clients);

                    }

                    connexion.Close();
                    return listeClient;
                }

            }
        }
    }
}
