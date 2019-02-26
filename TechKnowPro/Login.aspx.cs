using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechKnowPro.Model;

namespace TechKnowPro
{
    public partial class Login : System.Web.UI.Page
    {
        DataView loginTable;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //generate login table which includes user_id, username(email), password and role(acces level)
            loginTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            loginTable.Sort = "username";
            int i = loginTable.Find(txtUsername.Text);
            if (i == -1)
            {
                lblResult.Text = "Username does not exist!";
            }
            else
            {
                if (loginTable[i]["password"].ToString() == txtPassword.Text)
                {
                    //if password correct, store information in a User class
                    User user = new User();
                    user.userId = Convert.ToInt32(loginTable[i]["user_id"]);
                    user.username = loginTable[i]["username"].ToString();
                    user.role = loginTable[i]["definition"].ToString();
                    Session["user"] = user;

                    Response.Redirect("~/Home.aspx");
                    //if (user.role == "admin") { Response.Redirect("~/HomeAdmin.aspx"); }
                    //if (user.role == "technician") { Response.Redirect("~/HomeTech.aspx"); }
                    //if (user.role == "customer") { Response.Redirect("~/HomeCustomer.aspx"); }
                }
                else
                {
                    lblResult.Text = "You have entered an incorrect password!";
                }
            }
        }
    }
}