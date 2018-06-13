using System;
using System.Collections.Generic;
using LocaMat.Metier;
using LocaMat.UI.Framework;
using System.Data.SqlClient;

namespace LocaMat.UI
{
    public class ModuleGestionAgences
    {
        private Menu menu;

        private void InitialiserMenu()
        {
            this.menu = new Menu("Gestion des agences");
            this.menu.AjouterElement(new ElementMenu("1", "Afficher les agences")
            {
                FonctionAExecuter = this.AfficherAgences
            });
            this.menu.AjouterElement(new ElementMenu("2", "Ajouter une agence")
            {
                FonctionAExecuter = this.AjouterAgence
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

        private void AfficherAgences()
        {
            ConsoleHelper.AfficherEntete("Agences");
            var listeAgence = RecupererlisteAgence();
            ConsoleHelper.AfficherListe(listeAgence);

            //Console.WriteLine("TO DO");
        }

        private void AjouterAgence()
        {
            ConsoleHelper.AfficherEntete("Nouvelle agence");

            
            var connectionString = Menu.GetConnexion();

            Console.WriteLine("Entrez le nom de la ville:");
            var ville = ConsoleSaisie.SaisirChaine("Ville : ", false); ;


            Console.WriteLine("Entrez l'adresse:");
            var adresse = ConsoleSaisie.SaisirChaine("Adresse : ", false);

            var connectionStrings = Menu.GetConnexion();

            //Méthode condensée
            using (var connexion = Menu.GetConnexion())
            {
                var sql = "INSERT INTO Agences (Ville,Adresse) Values (@Ville,@Adresse)";
                var commande = new SqlCommand(sql, connexion);
                commande.Parameters.Add(new SqlParameter
                {
                    ParameterName = "Ville",
                    Value = ville
                });
                commande.Parameters.Add(new SqlParameter
                {
                    ParameterName = "Adresse",
                    Value = adresse
                });
               
                connexion.Open();
                commande.ExecuteNonQuery();
                connexion.Close();
                // Console.WriteLine("TO DO");
            }
        }

        private List<Agence>RecupererlisteAgence()
        {
            // Création de la connecion
            var connectionString = Menu.GetConnexion();


            //Méthode condensée
            using (var connexion = Menu.GetConnexion())
            {
                // création d'une commande SQL
                var commande = new SqlCommand("SELECT* FROM Agences ", connexion);
                var listeAgence = new List<Agence>();

                // Mode connecté
                connexion.Open();
                using (var dataReader = commande.ExecuteReader())
                {
                    while (dataReader.Read())
                    {

                        var indexColonneVille = dataReader.GetOrdinal("Ville");
                        var indexColonneAdresse = dataReader.GetOrdinal("Adresse");
                        var agence = new Agence
                        {


                            Ville = dataReader.GetString(indexColonneVille),
                            Adresse = dataReader.GetString(indexColonneAdresse)

                        };
                        listeAgence.Add(agence);

                    }

                    connexion.Close();
                    return listeAgence;
                }

            }
        }
           
        
    }
}
