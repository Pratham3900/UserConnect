using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace UserConnect
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\MCA SEM 1\\ASP.NET\\UserConnect\\UserConnect\\App_Data\\UserConnectDB.mdf;Integrated Security=True";
        }

        protected void btnRegister_Click1(object sender, EventArgs e)
        {
                conn.Open();

                string gender = "";
                if (rblGender.SelectedItem != null)
                {
                    gender = rblGender.SelectedItem.Value;
                }

               
                string photoName = "";
                if (fuPhoto.HasFile)
                {
                    photoName = fuPhoto.FileName;
                    string path = Server.MapPath("~/Uploads/" + photoName);
                    fuPhoto.SaveAs(path);
                }

          
                string ins = "INSERT INTO Users (FirstName, LastName, Gender, Birthdate, PhotoFileName, Email, PasswordHash, Phone, Address, Pincode, City, State) " +
                             "VALUES ('" + txtFirstName.Text + "', '" + txtLastName.Text + "', '" + gender + "', '" + txtBirthdate.Text + "', '" + photoName + "', '" +
                             txtEmail.Text + "', '" + txtPassword.Text + "', '" + txtPhone.Text + "', '" + txtAddress.Text + "', '" + txtPincode.Text + "', '" +
                             txtCity.Text + "', '" + ddlState.SelectedValue + "')";

                SqlCommand com = new SqlCommand(ins, conn);
                com.ExecuteNonQuery();

                conn.Close();

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Registration successful! Redirecting to login...";
            Response.AddHeader("REFRESH", "1;URL=Login.aspx");
            ClearFields();
        }

        private void ClearFields()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            rblGender.ClearSelection();
            txtBirthdate.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            txtPincode.Text = "";
            txtCity.Text = "";
            ddlState.SelectedIndex = 0;
        }

       
    }
}
