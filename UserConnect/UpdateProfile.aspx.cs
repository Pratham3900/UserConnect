using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace UserConnect
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\MCA SEM 1\\ASP.NET\\UserConnect\\UserConnect\\App_Data\\UserConnectDB.mdf;Integrated Security=True";

            if (!IsPostBack)
            {
                // Get current user email from session or cookie
                string email = "";
                if (Session["Username"] != null)
                    email = Session["Username"].ToString();
                else if (Request.Cookies["UserEmail"] != null)
                    email = Request.Cookies["UserEmail"].Value;

                if (email != "")
                    LoadProfile(email);
                else
                    Response.Redirect("Login.aspx");
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
                txtFirstName.Text = dr["FirstName"].ToString();
                txtLastName.Text = dr["LastName"].ToString();
                ddlGender.SelectedValue = dr["Gender"].ToString();
                txtBirthdate.Text = Convert.ToDateTime(dr["Birthdate"]).ToString("yyyy-MM-dd");
                txtEmail.Text = dr["Email"].ToString();
                txtPhone.Text = dr["Phone"].ToString();
                txtAddress.Text = dr["Address"].ToString();
                txtCity.Text = dr["City"].ToString();
                ddlState.SelectedValue = dr["State"].ToString();
                txtPincode.Text = dr["Pincode"].ToString();

                string photo = dr["PhotoFileName"].ToString();
                if (!string.IsNullOrEmpty(photo))
                {
                    imgCurrent.ImageUrl = "~/Uploads/" + photo;
                }
                else
                {
                    imgCurrent.ImageUrl = ResolveUrl("~/Uploads/user.jpg");
                }
            }

            dr.Close();
            conn.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;

            string newPhoto = "";
            if (fuPhoto.HasFile)
            {
                newPhoto = Path.GetFileName(fuPhoto.FileName);
                string path = Server.MapPath("~/Uploads/" + newPhoto);
                fuPhoto.SaveAs(path);
            }

            conn.Open();

            string upd = "UPDATE Users SET FirstName='" + txtFirstName.Text + "', LastName='" + txtLastName.Text + "', " +
                         "Gender='" + ddlGender.SelectedValue + "', Birthdate='" + txtBirthdate.Text + "', " +
                         "Phone='" + txtPhone.Text + "', Address='" + txtAddress.Text + "', City='" + txtCity.Text + "', " +
                         "State='" + ddlState.SelectedValue + "', Pincode='" + txtPincode.Text + "'";

            if (!string.IsNullOrEmpty(newPhoto))
                upd += ", PhotoFileName='" + newPhoto + "'";

            upd += " WHERE Email='" + email + "'";

            SqlCommand com = new SqlCommand(upd, conn);
            com.ExecuteNonQuery();
            conn.Close();

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Profile updated successfully!";
            Response.AddHeader("REFRESH", "1;URL=Profile.aspx");
        }
    }
}
