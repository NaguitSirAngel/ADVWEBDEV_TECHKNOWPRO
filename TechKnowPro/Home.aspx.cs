using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechKnowPro.Model;

namespace TechKnowPro
{
    public partial class Home : System.Web.UI.Page
    {
        User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            //no login info
            if (Session["user"] == null) { Response.Redirect("~/Login.aspx"); }
            //get user information
            user = (User)Session["user"];

            lblContent1.Text = "";
            lblContent2.Text = "";

            //load details for admin
            if (user.role == "admin")
            {
                lblGetStarted.Text = "Go to <a href =\"\">Customers</a> section to search customer information";
            }
            //load details for technician
            if (user.role == "technician")
            {
                lblGetStarted.Text = "Go to <a href =\"\">Incidents</a> to serch and review client incident reports";
            }
            //load details for customer
            if (user.role == "customer")
            {
                lblGetStarted.Text = "Go to <a href =\"ProfileForm.aspx\">Profile</a> to update your profile and/or customer information";
                lblContent1.Text = "What do you think about our service?";
                lblContent2.Text = "<a href =\"\">Submit a survey</a> to provide your feedback for any support we have provided to you recently";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}