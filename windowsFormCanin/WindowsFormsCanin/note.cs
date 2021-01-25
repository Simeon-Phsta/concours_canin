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
    public partial class note : Form
    {
        private CONCOURSCANINEntities monModele;


        //Function pour mettre à jour le dtgv
        private void reload()
        {
            monModele = new CONCOURSCANINEntities();

            var req = from p in monModele.PARTICIPEs
                      from c in monModele.CHIENs
                      from pro in monModele.PROPRIETAIREs
                      where p.codechien == c.codechien
                      && pro.codeproprietaire == c.codeproprietaire
                      select new { p.codeconcours, pro.nomproprietaire, pro.codeproprietaire, c.codechien, c.nomchien, p.note };

            dataGridView1.Rows.Clear();

            foreach (var i in req.ToList())
            {
                dataGridView1.Rows.Add(i.codeconcours, i.nomproprietaire, i.codeproprietaire, i.codechien, i.nomchien, i.note);
            }

        }

        /* Initialisation du formulaire
        * requêtage puis attribution dans le datasource du datagriedview 
        */
        public note()
        {
            InitializeComponent();
            monModele = new CONCOURSCANINEntities();

            var req = from p in monModele.PARTICIPEs
                      from c in monModele.CHIENs
                      from pro in monModele.PROPRIETAIREs
                      where p.codechien == c.codechien
                      && pro.codeproprietaire == c.codeproprietaire
                      select new { p.codeconcours, pro.nomproprietaire, pro.codeproprietaire, c.codechien, c.nomchien, p.note };

            dataGridView1.Rows.Clear();

            foreach (var i in req.ToList())
            {
                dataGridView1.Rows.Add(i.codeconcours, i.nomproprietaire, i.codeproprietaire, i.codechien, i.nomchien, i.note);
            }
        }

        /*
        * Code déclenché dès que l'utilisateur quitte la cellule qu'il vient d'éditer
        * on va alors avoir deux cas de figure
        * Soit l'utilisateur a modifié ou ajouté une note à une ligne existante
        * Soit peux importe l'action, on lui empêche la modification
        */
        private void dataGridView1_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {   
            // Si l'utilisateur arrête son edit de cellule et qu'il est à la column 5, cela veut dire qu'il a modifié la note de cette ligne
            if (e.ColumnIndex == 5)
            {
                //On peut donc récupérer l'objet participe correspondant 
                PARTICIPE temps = monModele.PARTICIPEs.Find(dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString(), dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString(), dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString());

                //On modifie sa note avec celle rentré dans le dtgv
                temps.note = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString());

                //On met à jour monModele et la bdd
                monModele.SaveChanges();
                //On met à jour le dtgv
                reload();
            }
            //Dans n'importe quel autre cas, on  l'informe qu'il ne peux modifier que la note
            else
            {
                MessageBox.Show("Vous ne pouvez que modifier la note !");
            }
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
            MessageBox.Show("Sur ce formulaire vous pourez:\r\r- Modfier la note de chacun des chiens participants pour chacun des concours où ils sont inscrit.\r\r" +
                "Vous ne pouvez faire que cela. Il est impossible de modifier une autre information.");
        }

        //Empêche que l'utilisateur edite une case si elle n'est pas celle de la note
        private void dataGridView1_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            if (e.ColumnIndex != 5)
            {
                MessageBox.Show("Vous ne pouvez que modifier la note !");
            }
        }
    }
}
