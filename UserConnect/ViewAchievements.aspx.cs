using System;
using System.Data;
using System.Data.SqlClient;

namespace UserConnect
{
    public partial class ViewAchievements : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\MCA SEM 1\ASP.NET\UserConnect\UserConnect\App_Data\UserConnectDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAchievements();
            }
        }

        private void LoadAchievements()
        {
            string email = GetLoggedInEmail();
            if (string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "Please log in to view your achievements.";
                return;
            }

            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sel = "SELECT AchievementID, AchievementType, Institution, Course, Grade, CompletionDate, Description FROM Achievements WHERE Email = @Email ORDER BY CompletionDate DESC";
                using (SqlCommand cmd = new SqlCommand(sel, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            if (dt.Rows.Count > 0)
            {
                gvAchievements.DataSource = dt;
                gvAchievements.DataBind();
                lblMessage.Text = "";
            }
            else
            {
                gvAchievements.DataSource = null;
                gvAchievements.DataBind();
                lblMessage.Text = "No achievements found for your account.";
            }
        }

        private string GetLoggedInEmail()
        {
            if (Session["Username"] != null) return Session["Username"].ToString();
                      return null;
        }

       protected void gvAchievements_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteItem")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                DeleteAchievement(id);
            }
        }

        private void DeleteAchievement(int achievementId)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string del = "DELETE FROM Achievements WHERE AchievementID = @ID";
                using (SqlCommand cmd = new SqlCommand(del, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", achievementId);
                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();
                    conn.Close();

                    if (rows > 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Achievement deleted.";
                        LoadAchievements();
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Delete failed.";
                    }
                }
            }
        }
    }
}
