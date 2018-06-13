using System;
using System.Collections.Generic;
using LocaMat.Metier;
using LocaMat.UI.Framework;
using System.Configuration;
using System.Data.SqlClient;

namespace LocaMat.UI
{
    public class ModuleGestionProduits
    {
        private Menu menu;

        private void InitialiserMenu()
        {
            this.menu = new Menu("Gestion des produits");
            this.menu.AjouterElement(new ElementMenu("1", "Afficher les produits")
            {
                FonctionAExecuter = this.AfficherProduits
            });
            this.menu.AjouterElement(new ElementMenu("2", "Ajouter un produit")
            {
                FonctionAExecuter = this.AjouterProduit
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

        private void AfficherProduits()
        {

            ConsoleHelper.AfficherEntete("Produits");
            var liste = new List<Produit>();
            using (var connexion = Menu.GetConnexion())
            {
                // création d'une commande SQL
                var commande = new SqlCommand($@"SELECT p.*, c.Nom 
                                               as NomCategorie FROM Produits p join CategoriesProduits c ON  p.IdCategorie = c.Id", connexion);


                // Mode connecté
                connexion.Open();


                using (var dataReader = commande.ExecuteReader())
                {

                    while (dataReader.Read())
                    {
                        // Console.WriteLine($"Id :{dataReader.GetInt32(0)}, Nom : {dataReader.GetString(1)}");
                        var indexColonneId = dataReader.GetOrdinal("Id");
                        var indexColonneNom = dataReader.GetOrdinal("Nom");
                        var indexColonneDescription = dataReader.GetOrdinal("Description");
                        var indexColonneIdCategorie = dataReader.GetOrdinal("IdCategorie");
                        var indexColonneCategorie = dataReader.GetOrdinal("NomCategorie");
                        var indexColonnePrixJourHT = dataReader.GetOrdinal("PrixJourHT");
                        var produit = new Produit
                        {

                            Id = dataReader.GetInt32(indexColonneId),
                            Nom = dataReader.GetString(indexColonneNom),
                            Description = dataReader.GetString(indexColonneDescription),
                            IdCategorie = dataReader.GetInt32(indexColonneIdCategorie),
                            Categorie = new CategorieProduit { Libelle = dataReader.GetString(indexColonneCategorie), Id = dataReader.GetInt32(indexColonneIdCategorie) },
                            PrixJourHT = dataReader.GetDecimal(indexColonnePrixJourHT)

                        };
                        liste.Add(produit);

                    }
                }

                connexion.Close();



            }
            ConsoleHelper.AfficherListe(liste);


        }
        private void AjouterProduit()
        {
            ConsoleHelper.AfficherEntete("Nouveau produit");

            var connectionString = Menu.GetConnexion();

            Console.WriteLine("Entrez le nom:");
            var nom = ConsoleSaisie.SaisirChaine("Nom : ", false); ;


            Console.WriteLine("Entrez la description:");
            var description = ConsoleSaisie.SaisirChaine("Description : ", false);

            Console.WriteLine("Entrez l'IdCategorie:");
            var IdCategorie = ConsoleSaisie.SaisirEntierObligatoire("IdCategorie : ");


            Console.WriteLine("Entrez le prixJourHT:");
            var prixJourHT = ConsoleSaisie.SaisirDecimalObligatoire("prixJourHT: ");
            var connectionStrings = Menu.GetConnexion();

            //Méthode condensée
            using (var connexion = Menu.GetConnexion())
            {
                var sql = "INSERT INTO Produits (Nom,Description,IdCategorie,PrixJourHT) Values (@Nom,@Description,@IdCategorie,@PrixJourHT)";
                var commande = new SqlCommand(sql, connexion);
                commande.Parameters.Add(new SqlParameter
                {
                    ParameterName = "Nom",
                    Value = nom
                });
                commande.Parameters.Add(new SqlParameter
                {
                    ParameterName = "Description",
                    Value = description
                });
                commande.Parameters.Add(new SqlParameter
                {
                    ParameterName = "IdCategorie",
                    Value = IdCategorie
                });
                commande.Parameters.Add(new SqlParameter
                {
                    ParameterName = "PrixJourHT",
                    Value = prixJourHT
                });
                connexion.Open();
                commande.ExecuteNonQuery();
                connexion.Close();
                // Console.WriteLine("TO DO");
            }
        }

    }
}



