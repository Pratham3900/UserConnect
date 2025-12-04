using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace UserConnect
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\MCA SEM 1\\ASP.NET\\UserConnect\\UserConnect\\App_Data\\UserConnectDB.mdf;Integrated Security=True";

            if (!IsPostBack)
            {
                string email = "";

              
                if (Session["Username"] != null)
                    email = Session["Username"].ToString();
               
                if (!string.IsNullOrEmpty(email))
                {
                    LoadProfile(email);
                }
                else
                {
                    // No login, redirect to Login
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadProfile(string email)
        {
            conn.Open();
            string sel = "SELECT * FROM Users WHERE Email='" + email + "'";
            SqlCommand cmd = new SqlCommand(sel, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblFirstName.Text = dr["FirstName"].ToString();
                lblLastName.Text = dr["LastName"].ToString();
                lblGender.Text = dr["Gender"].ToString();
                lblBirthdate.Text = Convert.ToDateTime(dr["Birthdate"]).ToShortDateString();
                lblEmail.Text = dr["Email"].ToString();
                lblPhone.Text = dr["Phone"].ToString();
                lblAddress.Text = dr["Address"].ToString();
                lblCity.Text = dr["City"].ToString();
                lblState.Text = dr["State"].ToString();
                lblPincode.Text = dr["Pincode"].ToString();

                string photoName = dr["PhotoFileName"].ToString();
                if (!string.IsNullOrEmpty(photoName))
                {
                    imgProfile.ImageUrl = "~/Uploads/" + photoName;
                }
                else
                {
                    // Default image if no upload found
                    imgProfile.ImageUrl = "~/Uploads/user.jpg";
                }
            }
            dr.Close();
            conn.Close();
        }

        protected void btnDelete_Click1(object sender, EventArgs e)
        {
            string email = "";
            if (Session["Username"] != null)
                email = Session["Username"].ToString();
           

            if (!string.IsNullOrEmpty(email))
            {
                conn.Open();
                string del = "DELETE FROM Users WHERE Email='" + email + "'";
                SqlCommand cmd = new SqlCommand(del, conn);
                cmd.ExecuteNonQuery();
                conn.Close();

             
                Session.Clear();
           

                Response.Redirect("Login.aspx");
            }
        }

     

      
    }
}
