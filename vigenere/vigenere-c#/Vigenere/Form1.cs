using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Text.RegularExpressions;


namespace Vigenere
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Label encryptLabel = new Label();
            encryptLabel.Location = new Point(5, 5);
            encryptLabel.Text = "Įrašykite norimą užšifruoti tekstą:";
            encryptLabel.Width = 200;
            TextBox encrypt = new TextBox();
            encrypt.Location = new Point(5, 30);
            encrypt.Multiline = true;
            encrypt.Width = 200;
            encrypt.Height = 120;

            Label encryptedLabel = new Label();
            encryptedLabel.Location = new Point(350, 5);
            encryptedLabel.Text = "Užšifruotas tekstas:";
            encryptedLabel.Width = 200;
            TextBox encrypted = new TextBox();
            encrypted.Location = new Point(350, 30);
            encrypted.Multiline = true;
            encrypted.Width = 200;
            encrypted.Height = 120;

            TextBox encryptKey = new TextBox();
            encryptKey.Location = new Point(227, 45);
            encryptKey.Width = 100;
            encryptKey.Text = "Raktas..";
            encryptKey.ForeColor = Color.Gray;
            encryptKey.GotFocus += encryptKey_GotFocus;
            encryptKey.LostFocus += encryptKey_LostFocus;
            Button encryptButton = new Button();
            encryptButton.Location = new Point(227, 75);
            encryptButton.Width = 100;
            encryptButton.Height = 30;
            encryptButton.Text = "Ūžšifruoti";
            encryptButton.Tag = new { Key = encryptKey, Text = encrypt, EncryptedText = encrypted };
            encryptButton.Click += encryptButton_Click;

            panel1.Controls.Add(encryptLabel);
            panel1.Controls.Add(encrypt);
            panel1.Controls.Add(encryptButton);
            panel1.Controls.Add(encryptedLabel);
            panel1.Controls.Add(encrypted);
            panel1.Controls.Add(encryptKey);

            Label decipherLabel = new Label();
            decipherLabel.Location = new Point(5, 5);
            decipherLabel.Text = "Įrašykite norimą dešifruoti tekstą:";
            decipherLabel.Width = 200;
            TextBox decipher = new TextBox();
            decipher.Location = new Point(5, 30);
            decipher.Multiline = true;
            decipher.Width = 200;
            decipher.Height = 120;

            Label decipheredLabel = new Label();
            decipheredLabel.Location = new Point(350, 5);
            decipheredLabel.Text = "Dešifruotas tekstas:";
            decipheredLabel.Width = 200;
            TextBox deciphered = new TextBox();
            deciphered.Location = new Point(350, 30);
            deciphered.Multiline = true;
            deciphered.Width = 200;
            deciphered.Height = 120;

            TextBox decipherKey = new TextBox();
            decipherKey.Location = new Point(227, 45);
            decipherKey.Width = 100;
            decipherKey.Text = "Raktas..";
            decipherKey.ForeColor = Color.Gray;
            decipherKey.GotFocus += decipherKey_GotFocus;
            decipherKey.LostFocus += decipherKey_LostFocus;
            Button decipherButton = new Button();
            decipherButton.Location = new Point(227, 75);
            decipherButton.Width = 100;
            decipherButton.Height = 30;
            decipherButton.Text = "Dešifruoti";
            decipherButton.Tag = new { Key = decipherKey, Text = decipher, DecipheredText = deciphered };
            decipherButton.Click += decipherButton_Click;

            panel2.Controls.Add(decipherLabel);
            panel2.Controls.Add(decipher);
            panel2.Controls.Add(decipherButton);
            panel2.Controls.Add(decipheredLabel);
            panel2.Controls.Add(deciphered);
            panel2.Controls.Add(decipherKey);
        }

        void decipherButton_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            TextBox key = ((dynamic)b.Tag).Key;
            TextBox text = ((dynamic)b.Tag).Text;
            TextBox encryptedTextBox = ((dynamic)b.Tag).DecipheredText;
            if(Regex.IsMatch(text.Text, @"^[a-zA-Z\s\.]+$"))
            {
                if(key.Text != "Raktas..")
                {
                    string encryptedString = Encryption.EncryptDecipher(text.Text, key.Text, "decipher");
                    encryptedTextBox.Text = encryptedString;
                }
            }
            else
            {
                MessageBox.Show("Įrašyti galite tik tekstą");
            }
            if (key.Text == "Raktas..")
            {
                MessageBox.Show("Įrašykite raktą");
            }
        }

        void encryptButton_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            TextBox key = ((dynamic)b.Tag).Key;
            TextBox text = ((dynamic)b.Tag).Text;
            TextBox encryptedTextBox = ((dynamic)b.Tag).EncryptedText;
            if (Regex.IsMatch(text.Text, @"^[a-zA-Z\s\.]+$"))
            {
                if (key.Text != "Raktas..")
                {
                    string encryptedString = Encryption.EncryptDecipher(text.Text, key.Text, "encrypt");
                    encryptedTextBox.Text = encryptedString;
                }
            }
            else
            {
                MessageBox.Show("Įrašyti galite tik tekstą");
            }
            if (key.Text == "Raktas..")
            {
                MessageBox.Show("Įrašykite raktą");
            }
        }

        void decipherKey_LostFocus(object sender, EventArgs e)
        {
            TextBox lostFocus = (TextBox)sender;
            if (lostFocus.Text == "")
            {
                lostFocus.Text = "Raktas..";
                lostFocus.ForeColor = Color.Gray;
            }
        }

        void decipherKey_GotFocus(object sender, EventArgs e)
        {
            TextBox gotFocus = (TextBox)sender;
            gotFocus.Text = "";
            gotFocus.ForeColor = Color.Black;
        }

        void encryptKey_LostFocus(object sender, EventArgs e)
        {
            TextBox lostFocus = (TextBox)sender;
            if (lostFocus.Text == "")
            {
                lostFocus.Text = "Raktas..";
                lostFocus.ForeColor = Color.Gray;
            }
        }

        void encryptKey_GotFocus(object sender, EventArgs e)
        {
            TextBox gotFocus = (TextBox)sender;
            gotFocus.Text = "";
            gotFocus.ForeColor = Color.Black;
        }
    }
}
