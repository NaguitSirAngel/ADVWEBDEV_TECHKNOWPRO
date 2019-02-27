using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechKnowPro.Model;
using System.Data;
namespace TechKnowPro
{
    public partial class ProfileForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                ddlQuest.DataBind();
                Customer sample = (Customer)Session["User"];
                Session["UsId"] = sample.user_id;
                Session["CId"] = sample.cust_id;
               
                txtFirstN.Text = sample.fN;
                txtLastN.Text = sample.lN;
                txtPhone.Text = sample.phone;
                txtAddress.Text = sample.address;
                txtAnswer.Text = sample.ques_answer;
                txtUser.Text = txtEmail.Text = sample.email;
                txtPos.Text = sample.pos_title;
                sdsRetPassw.DataBind();
                DataView dV = (DataView)sdsRetPassw.Select(DataSourceSelectArguments.Empty);
                DataRowView rV = dV[0]; //retrieve password inside db 
                txtPass.Text = rV["password"].ToString();
            }
            

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            sdsUser.Update();
            Session["QId"] = ddlQuest.SelectedIndex + 1; //should be the number of the value selected
            sdsCustomer.Update();

            Customer sample = (Customer)Session["User"];

            sample.quest_id = ddlQuest.SelectedIndex +1;

            sample.fN= txtFirstN.Text;
            sample.lN= txtLastN.Text;
            sample.phone= txtPhone.Text;
            sample.address= txtAddress.Text;
            sample.ques_answer = txtAnswer.Text;
            sample.email=  txtUser.Text;
            sample.pos_title =  txtPos.Text;
            Session["User"] = sample;
            CustomerManager sampleMan = (CustomerManager)Session["custoList"];
            sampleMan.update(sample);
            Session["custoList"] = sampleMan;
            lblSucc.Text = "You updated your profile";


        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LoginForm.aspx");
        }
    }
}