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
    public partial class menu : Form
    {
        public menu()
        {
            InitializeComponent();
        }

        //Bouton pour afficher le formulaire pour les notes et cacher le menu
        private void button2_Click(object sender, EventArgs e)
        {
            note test = new note();
            test.Show();
            this.Hide();
        }

        //Bouton pour afficher le formulaire pour les concours canins et cacher le menu
        private void button1_Click(object sender, EventArgs e)
        {
            FormCanin test = new FormCanin();
            test.Show();
            this.Hide();
        }

        //Bouton pour quitter l'application
        private void button3_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        //Bouton pour avoir des informations sur l'application en général
        private void btnAide_Click(object sender, EventArgs e)
        {
            MessageBox.Show("L'application sert à enregistrer les concours canins à venir, \rainsi que les notes obtenues par les canidés. \r" +
                "Pour gérer les concours -> Gestion Concours,\r" +
                "Pour ajouter une note -> Attribuer une note.");
        }
    }
}
