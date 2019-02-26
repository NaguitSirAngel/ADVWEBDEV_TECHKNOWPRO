using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TechKnowPro
{
    public partial class CreateIncident : System.Web.UI.Page
    {
        Random rand = new Random();

        private Customer selectedCustomer;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            //bind drop-down list on first load   
            if (!IsPostBack)
            {
                ddlCustomers.DataBind();
                txtIncidentNum.Text = rand.Next(10000).ToString();
            }
            //get and show customer on every load
            selectedCustomer = this.GetSelectedCustomer();
            txtDateTime.Text = DateTime.Now.ToString("MM/dd/yyyy:  hh:mm");
            txtCustomerId.Text = selectedCustomer.customer_id;
        }

        private Customer GetSelectedCustomer()
        {
            //get row from SqlDataSource based on value in drop-down list
            DataView customerTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            customerTable.RowFilter =
                "customer_id = '" + ddlCustomers.SelectedValue + "'";
            DataRowView row = customerTable[0];

            //create a new customer object and load with data from row
            Customer c = new Customer();
            c.customer_id = row["customer_id"].ToString();
            c.user_id = row["user_id"].ToString();
            return c;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {

            SqlDataSource1.InsertParameters["user_id"].DefaultValue = selectedCustomer.user_id;
            SqlDataSource1.InsertParameters["datetime"].DefaultValue = DateTime.Now.ToString();
            SqlDataSource1.Insert();
            clear();
        }



        private void clear()
        {
            txtDescription.Text = string.Empty;
            ddlCustomers.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            rblContactMethod.SelectedIndex = -1;
            txtCustomerId.Text = "1";
            txtIncidentNum.Text = rand.Next(10000).ToString();
        }
  
    }
   
}