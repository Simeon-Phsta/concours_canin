using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsCanin
{
    public partial class FormCanin : Form
    {
        private CONCOURSCANINEntities monModele;

        //Function pour mettre à jour le dtgv
        private void reload()
        {
            monModele = new CONCOURSCANINEntities();

            var req = from el in monModele.CONCOURS
                      select el;

            bdgSourceConcours.DataSource = req.ToList();
            dataGridView1.DataSource = bdgSourceConcours;

        }


        /* Initialisation du formulaire
         * requêtage puis attribution dans le datasource du datagriedview 
         */
      
        public FormCanin()
        {
            InitializeComponent();

            monModele = new  CONCOURSCANINEntities();

            var req = from el in monModele.CONCOURS
                          select el;

            bdgSourceConcours.DataSource = req.ToList();
            dataGridView1.DataSource = bdgSourceConcours;
        }


        /*
        * Déclaration d'une variable bool 
        * elle sert à vérifier qu'à la sortie de la cellule, soit l'utilisateur fait un ajout, soit une modification
        */
        private bool ajout = false;

        
        /*
        * Evènement déclenché dès une saisie débute sur une nouvelle ligne du datagrid
        * cela donne true pour le bool ajout 
        */
        private void dgv_concours_UserAddedRow(object sender, DataGridViewRowEventArgs e)
        {
            ajout = true;
        }

        /*
         * Code déclenché dès que l'utilisateur quitte la cellule qu'il vient d'éditer
         * on va alors avoir deux cas de figure
         * Soit l'utilisateur a ajouté une ligne et donc un concours
         * Soit il a modifié des informations sur une ligne
         */
        private void dataGridView1_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {

   
            ///Nous avons ici le cas où l'utilisateur fait un ajout
            /// A la fin de l'édition d'une cellule du datagridview
            /// Il faut être en colonne 5, en mode ajout, et la toute dernière ligne du datagried
            /// Alors on créé, rajoute un nouveau concours et le sauvegarde dans la bdd
         

            if (e.ColumnIndex == 5 && ajout == true && dataGridView1.CurrentRow.Index + 2 >= dataGridView1.Rows.Count)
            {
                //convertion de string à datetime
                string dateCoursString = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
                DateTime dt;
                dt = Convert.ToDateTime(dateCoursString);

                
                //Création d'un concours avec la date du jour
                CONCOUR concou = new CONCOUR()
                {
                    codeconcours = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString(),
                    adresseconcours = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString(),
                    cpconcours = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString(),
                    dateconcours = dt,
                    salleconcours = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString(),
                    villeconcours = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString()
                };

                //Ajout du nouveau concours dans monModele
                monModele.CONCOURS.Add(concou);
                //Sauvegarde des changements
                monModele.SaveChanges();
                //On repasse ajout à false
                ajout = false;
                //Mise à jour du datagriedview
                reload();
                
            }

            /// Sinon c'est tous les autres cas
            else
            {
                ///Nous avons ici le cas où l'utilisateur fait une modification
                ///Il faut donc vérifier que ce ne soit pas un ajout
                if (ajout == false)
                {
                    //convertion de string à datetime
                    string dateCoursString = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
                    DateTime dt;
                    dt = Convert.ToDateTime(dateCoursString);

                    //On récupère le concours correspondant à la ligne sur laquelle on se trouve du datagridview
                    CONCOUR temps = monModele.CONCOURS.Find(dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString());

                    //On met à jour temps en prenant les informations de la ligne
                    temps.codeconcours = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
                    temps.adresseconcours = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
                    temps.cpconcours = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
                    temps.dateconcours = dt;
                    temps.salleconcours = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
                    temps.villeconcours = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
                    
                    //Sauvegarde des changements dans la bdd
                    monModele.SaveChanges();
                    //Mise à jour du dtgv
                    reload();
                }
            }
        }

        //Code declenché lorsque l'utilisateur supprime une ligne 
        private void dgv_concours_UserDeletingRow(object sender, DataGridViewRowCancelEventArgs e)
        {
            //On récupère le code concours 
            string codeconcours = dataGridView1.SelectedCells[0].Value.ToString();
            //On récupère l'objet correspondant 
            CONCOUR temp = monModele.CONCOURS.Find(codeconcours);
            //On le supprime du monModele
            monModele.CONCOURS.Remove(temp);
            //Pour enfin mettre à jour monModele et la bdd
            monModele.SaveChanges();
            //Et mise à jour du dtgv
            reload();
        }

        //Bouton pour retourner au menu
        private void btnMenu_Click(object sender, EventArgs e)
        {
            menu test = new menu();
            this.Hide();
            test.Show();
        }

        //Bouton pour quitter l'application
        private void btnQuitter_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        //Bouton pour l'utilisateur afin d'avoir des informations sur le fonctionement du formulaire
        private void btnAide_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Sur ce formulaire vous pourez:\r\r" +
                "- Ajouter un nouveau concours en cliquant sur la dernière ligne du formulaire. Entrez ensuite les informations voulues dans chacunes des cases,\r\r" +
                "- Modifier un concours, il suffit de cliquer sur l'information que vous désirez modifier et de la remplacer par celle désirée,\r\r" +
                "- Supprimer un concours, selectionnez la ligne que vous voulez supprimer puis utilisez votre touche \"Suppr\".\rElle se trouve au dessus de vos flèches directionnelles et à la droite de la touche \"Entrée\".\r\r\r" +
                "Vous ne pouvez faire que cela. Il est impossible de modifier une autre information.");
        }
    }
}
