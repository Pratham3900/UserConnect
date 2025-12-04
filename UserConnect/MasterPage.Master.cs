using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserConnect
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateNavbar();
            }
        }

        private void UpdateNavbar()
        {
            if (Session["Username"] != null)
            {
                // When user is logged in
                hlLogin.Visible = false;
                hlRegister.Visible = false;
                hlHome1.Visible = false;
                hlHome.Visible = true;
                hlLogout.Visible = true;
                hlProfile.Visible = true;
                hlUpdateProfile.Visible = true;
                hlAddAchievements.Visible = true;
                hlUpdateAchievements.Visible = true;
                hlViewAchievements.Visible = true;
            }
            else
            {
                // When user is not logged in
                hlLogin.Visible = true;
                hlRegister.Visible = true;
                hlHome1.Visible = true;
                hlHome.Visible = false;
                hlLogout.Visible = false;
                hlProfile.Visible = false;
                hlUpdateProfile.Visible = false;
                hlAddAchievements.Visible = false;
                hlUpdateAchievements.Visible = false;
                hlViewAchievements.Visible = false;
            }
        }
    }
}