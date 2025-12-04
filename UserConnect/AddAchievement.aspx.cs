using System;
using System.Data.SqlClient;

namespace UserConnect
{
    public partial class AddAchievement : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\MCA SEM 1\\ASP.NET\\UserConnect\\UserConnect\\App_Data\\UserConnectDB.mdf;Integrated Security=True";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string email = "";

           
            if (Session["Username"] != null)
                email = Session["Username"].ToString();
           

            if (email == "")
            {
                lblMessage.Text = "Session expired. Please log in again.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            conn.Open();

            string ins = "INSERT INTO Achievements (Email,AchievementType, Institution, Course, Grade, CompletionDate, Description) " +
                         "VALUES ('" + email + "', '" + ddlType.SelectedValue + "', '" + txtInstitution.Text + "', '" +
                         txtCourse.Text + "', '" + txtGrade.Text + "', '" + txtDate.Text + "', '" + txtDesc.Text + "')";

            SqlCommand cmd = new SqlCommand(ins, conn);
            cmd.ExecuteNonQuery();
            conn.Close();

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Achievement added successfully!";
            Response.AddHeader("REFRESH", "1;URL=ViewAchievements.aspx");
        }

       
    }
}
