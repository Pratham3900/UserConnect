using System;
using System.Data.SqlClient;

namespace UserConnect
{
    public partial class UpdateAchievement : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\MCA SEM 1\ASP.NET\UserConnect\UserConnect\App_Data\UserConnectDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string idStr = Request.QueryString["id"];
                if (string.IsNullOrEmpty(idStr))
                {
                    Response.Redirect("ViewAchievements.aspx");
                    return;
                }

                int id = Convert.ToInt32(idStr);
                LoadAchievement(id);
            }
        }

        private void LoadAchievement(int id)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sel = "SELECT * FROM Achievements WHERE AchievementID = @ID";
                using (SqlCommand cmd = new SqlCommand(sel, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    conn.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            ddlType.SelectedValue = dr["AchievementType"].ToString();
                            txtInstitution.Text = dr["Institution"].ToString();
                            txtCourse.Text = dr["Course"].ToString();
                            txtGrade.Text = dr["Grade"].ToString();
                            if (dr["CompletionDate"] != DBNull.Value)
                                txtDate.Text = Convert.ToDateTime(dr["CompletionDate"]).ToString("yyyy-MM-dd");
                            txtDesc.Text = dr["Description"].ToString();
                        }
                        else
                        {
                            // Not found -> go back
                            Response.Redirect("ViewAchievements.aspx");
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string idStr = Request.QueryString["id"];
            if (string.IsNullOrEmpty(idStr)) { Response.Redirect("ViewAchievements.aspx"); return; }
            int id = Convert.ToInt32(idStr);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string upd = @"UPDATE Achievements SET
                                AchievementType = @Type,
                                Institution = @Institution,
                                Course = @Course,
                                Grade = @Grade,
                                CompletionDate = @Date,
                                Description = @Desc
                               WHERE AchievementID = @ID";

                using (SqlCommand cmd = new SqlCommand(upd, conn))
                {
                    cmd.Parameters.AddWithValue("@Type", ddlType.SelectedValue);
                    cmd.Parameters.AddWithValue("@Institution", txtInstitution.Text);
                    cmd.Parameters.AddWithValue("@Course", txtCourse.Text);
                    cmd.Parameters.AddWithValue("@Grade", txtGrade.Text);
                    if (string.IsNullOrWhiteSpace(txtDate.Text))
                        cmd.Parameters.AddWithValue("@Date", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                    cmd.Parameters.AddWithValue("@Desc", txtDesc.Text);
                    cmd.Parameters.AddWithValue("@ID", id);

                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();
                    conn.Close();

                    if (rows > 0)
                    {
                        // success: show message then redirect after 1s
                        ClientScript.RegisterStartupScript(this.GetType(), "ok",
                            "setTimeout(function(){ window.location='ViewAchievements.aspx'; }, 1000);", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "err",
                            "alert('Update failed.');", true);
                    }
                }
            }
        }

      
    }
}
