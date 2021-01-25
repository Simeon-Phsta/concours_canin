
namespace WindowsFormsCanin
{
    partial class FormCanin
    {
        /// <summary>
        /// Variable nécessaire au concepteur.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Nettoyage des ressources utilisées.
        /// </summary>
        /// <param name="disposing">true si les ressources managées doivent être supprimées ; sinon, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Code généré par le Concepteur Windows Form

        /// <summary>
        /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
        /// le contenu de cette méthode avec l'éditeur de code.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.bdgSourceConcours = new System.Windows.Forms.BindingSource(this.components);
            this.btnMenu = new System.Windows.Forms.Button();
            this.btnQuitter = new System.Windows.Forms.Button();
            this.codeconcoursDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.adresseconcoursDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cpconcoursDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dateconcoursDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.salleconcoursDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.villeconcoursDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cONCOURBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.btnAide = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdgSourceConcours)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cONCOURBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.codeconcoursDataGridViewTextBoxColumn,
            this.adresseconcoursDataGridViewTextBoxColumn,
            this.cpconcoursDataGridViewTextBoxColumn,
            this.dateconcoursDataGridViewTextBoxColumn,
            this.salleconcoursDataGridViewTextBoxColumn,
            this.villeconcoursDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.cONCOURBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(0, -1);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(644, 299);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellEndEdit);
            this.dataGridView1.UserAddedRow += new System.Windows.Forms.DataGridViewRowEventHandler(this.dgv_concours_UserAddedRow);
            this.dataGridView1.UserDeletingRow += new System.Windows.Forms.DataGridViewRowCancelEventHandler(this.dgv_concours_UserDeletingRow);
            // 
            // btnMenu
            // 
            this.btnMenu.Location = new System.Drawing.Point(651, 12);
            this.btnMenu.Name = "btnMenu";
            this.btnMenu.Size = new System.Drawing.Size(75, 23);
            this.btnMenu.TabIndex = 1;
            this.btnMenu.Text = "Menu";
            this.btnMenu.UseVisualStyleBackColor = true;
            this.btnMenu.Click += new System.EventHandler(this.btnMenu_Click);
            // 
            // btnQuitter
            // 
            this.btnQuitter.Location = new System.Drawing.Point(651, 70);
            this.btnQuitter.Name = "btnQuitter";
            this.btnQuitter.Size = new System.Drawing.Size(75, 23);
            this.btnQuitter.TabIndex = 2;
            this.btnQuitter.Text = "Quitter";
            this.btnQuitter.UseVisualStyleBackColor = true;
            this.btnQuitter.Click += new System.EventHandler(this.btnQuitter_Click);
            // 
            // codeconcoursDataGridViewTextBoxColumn
            // 
            this.codeconcoursDataGridViewTextBoxColumn.DataPropertyName = "codeconcours";
            this.codeconcoursDataGridViewTextBoxColumn.HeaderText = "codeconcours";
            this.codeconcoursDataGridViewTextBoxColumn.Name = "codeconcoursDataGridViewTextBoxColumn";
            // 
            // adresseconcoursDataGridViewTextBoxColumn
            // 
            this.adresseconcoursDataGridViewTextBoxColumn.DataPropertyName = "adresseconcours";
            this.adresseconcoursDataGridViewTextBoxColumn.HeaderText = "adresseconcours";
            this.adresseconcoursDataGridViewTextBoxColumn.Name = "adresseconcoursDataGridViewTextBoxColumn";
            // 
            // cpconcoursDataGridViewTextBoxColumn
            // 
            this.cpconcoursDataGridViewTextBoxColumn.DataPropertyName = "cpconcours";
            this.cpconcoursDataGridViewTextBoxColumn.HeaderText = "cpconcours";
            this.cpconcoursDataGridViewTextBoxColumn.Name = "cpconcoursDataGridViewTextBoxColumn";
            // 
            // dateconcoursDataGridViewTextBoxColumn
            // 
            this.dateconcoursDataGridViewTextBoxColumn.DataPropertyName = "dateconcours";
            this.dateconcoursDataGridViewTextBoxColumn.HeaderText = "dateconcours";
            this.dateconcoursDataGridViewTextBoxColumn.Name = "dateconcoursDataGridViewTextBoxColumn";
            // 
            // salleconcoursDataGridViewTextBoxColumn
            // 
            this.salleconcoursDataGridViewTextBoxColumn.DataPropertyName = "salleconcours";
            this.salleconcoursDataGridViewTextBoxColumn.HeaderText = "salleconcours";
            this.salleconcoursDataGridViewTextBoxColumn.Name = "salleconcoursDataGridViewTextBoxColumn";
            // 
            // villeconcoursDataGridViewTextBoxColumn
            // 
            this.villeconcoursDataGridViewTextBoxColumn.DataPropertyName = "villeconcours";
            this.villeconcoursDataGridViewTextBoxColumn.HeaderText = "villeconcours";
            this.villeconcoursDataGridViewTextBoxColumn.Name = "villeconcoursDataGridViewTextBoxColumn";
            // 
            // cONCOURBindingSource
            // 
            this.cONCOURBindingSource.DataSource = typeof(WindowsFormsCanin.CONCOUR);
            // 
            // btnAide
            // 
            this.btnAide.Location = new System.Drawing.Point(651, 41);
            this.btnAide.Name = "btnAide";
            this.btnAide.Size = new System.Drawing.Size(75, 23);
            this.btnAide.TabIndex = 3;
            this.btnAide.Text = "Aide";
            this.btnAide.UseVisualStyleBackColor = true;
            this.btnAide.Click += new System.EventHandler(this.btnAide_Click);
            // 
            // FormCanin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(738, 306);
            this.Controls.Add(this.btnAide);
            this.Controls.Add(this.btnQuitter);
            this.Controls.Add(this.btnMenu);
            this.Controls.Add(this.dataGridView1);
            this.Name = "FormCanin";
            this.Text = "Formulaire Concours";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bdgSourceConcours)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cONCOURBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.BindingSource cONCOURBindingSource;
        private System.Windows.Forms.BindingSource bdgSourceConcours;
        private System.Windows.Forms.DataGridViewTextBoxColumn codeconcoursDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn adresseconcoursDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn cpconcoursDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn dateconcoursDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn salleconcoursDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn villeconcoursDataGridViewTextBoxColumn;
        private System.Windows.Forms.Button btnMenu;
        private System.Windows.Forms.Button btnQuitter;
        private System.Windows.Forms.Button btnAide;
    }
}

