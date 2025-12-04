using System;
using System.Data.SqlClient;
using System.Security.Policy;
using System.Web.UI;

namespace UserConnect
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            conn = new SqlConnection();
            conn.ConnectionString ="Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\MCA SEM 1\\ASP.NET\\UserConnect\\UserConnect\\App_Data\\UserConnectDB.mdf;Integrated Security=True";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtUsername.Text;
            string password = txtPassword.Text;

            if (email == "" || password == "")
            {
                lblMessage.Text = "Please enter both email and password.";
                return;
            }

            conn.Open();

            // Select query to verify credentials
            string sel = "SELECT COUNT(*) FROM Users WHERE Email='" + email + "' AND PasswordHash='" + password + "'";
            SqlCommand cmd = new SqlCommand(sel, conn);

            int count = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();

            if (count == 1)
            {
                // Successful login
                Session["Username"] = email;
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Login successful! Redirecting...";
               
                Response.Redirect("Home.aspx");
            }
            else
            {
                // Invalid credentials
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Invalid email or password.";
            }
        }
    }
}
