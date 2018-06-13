using System;
using System.Collections.Generic;
using LocaMat.Metier;
using LocaMat.UI.Framework;
using System.Linq;

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
            this.menu.AjouterElement(new ElementMenu("3", "Supprimer un produit")
            {
                FonctionAExecuter = this.SupprimerProduit
            });
            this.menu.AjouterElement(new ElementMenu("4", "Rechercher un produit")
            {
                FonctionAExecuter = this.ChercherProduit
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

        public void AfficherProduits()
        {
            ConsoleHelper.AfficherEntete("Produits");

            var liste = Application.GetBaseDonnees().Produits.ToList();
            ConsoleHelper.AfficherListe(liste);

        }

        private void AjouterProduit()
        {
            ConsoleHelper.AfficherEntete("Nouveau produit");
            var produit = new Produit
            {
                Nom = ConsoleSaisie.SaisirChaine("Nom : ", false),
                Description = ConsoleSaisie.SaisirChaine("Description : ", false),
                PrixJourHT = ConsoleSaisie.SaisirDecimalObligatoire("Prix : "),
                IdCategorie = ConsoleSaisie.SaisirEntierObligatoire("Id catégorie : ")


            };
            using (var bd = Application.GetBaseDonnees())
            {
                var categorie = bd.CategorieProduits.
                SingleOrDefault(x => x.Id == produit.IdCategorie);
                if (categorie == null)
                {
                    ConsoleHelper.AfficherMessageErreur("catégorie invalide.Retour au menu");
                        return;
                }
               
            }
        }
        private void SupprimerProduit()
        {
            ConsoleHelper.AfficherEntete("Suppimer un produit");
            var liste = Application.GetBaseDonnees().Produits.ToList();
            ConsoleHelper.AfficherListe(liste);

            var id = ConsoleSaisie.SaisirEntierObligatoire("Numero Id :");

            using (var sup = Application.GetBaseDonnees())
            {
                var produit = sup.Produits.Single(x => x.Id == id);
                sup.Produits.Remove(produit);
                sup.SaveChanges();
            }
        }
        public void ChercherProduit()
        {
            ConsoleHelper.AfficherEntete("Rechercher un produit");

            var nom = ConsoleSaisie.SaisirChaine("nom ", false);

            using (var rec = Application.GetBaseDonnees())
            {
                var liste = rec.Produits.Where(x => x.Nom.Contains(nom));
                ConsoleHelper.AfficherListe(liste);

                rec.SaveChanges();

            }
            
        }
    }
}

