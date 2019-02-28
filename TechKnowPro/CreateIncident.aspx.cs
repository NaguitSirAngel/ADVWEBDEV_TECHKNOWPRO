﻿using System;
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

        private Customer selectedCustomer;

        private DataView count;

        private DataRowView row;

        private int counter;

        protected void Page_Load(object sender, EventArgs e)
        {

            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            count = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            row = count[0];

            //bind drop-down list on first load   
            if (!IsPostBack)
            {
                ddlCustomers.DataBind();
                txtIncidentNum.Text = row["count"].ToString();
            }
            //get and show customer on every load
            selectedCustomer = this.GetSelectedCustomer();
            txtDateTime.Text = DateTime.Now.ToString("MM/dd/yyyy:  hh:mm");
            txtCustomerId.Text = selectedCustomer.customer_id;


        }

        //gets selected customer from the dropdownlist
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
            return c;
        }

        //button that inserts into the database
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["datetime"].DefaultValue = DateTime.Now.ToString();
            SqlDataSource1.Insert();
        }

        //reverts the fields to their default values
        private void Clear()
        {
            counter = Convert.ToInt32(row["count"]) + 1;
            txtCustomerId.Text = "1";
            txtIncidentNum.Text = counter.ToString();
            txtDescription.Text = string.Empty;
            txtProductName.Text = string.Empty;
            ddlCustomers.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            rblContactMethod.SelectedIndex = -1;
        }
    }
}