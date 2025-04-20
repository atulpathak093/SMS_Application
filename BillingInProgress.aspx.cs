using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMS_Application
{
    public partial class BillingInProgress : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source = DESKTOP-VOBAN0O\\SQLEXPRESS ;Initial Catalog = db_SMS ;Integrated Security = true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCustomerDetails_Click(object sender, EventArgs e)
        {
            if (txtCustomerMobile.Text != "")
            {
                Session["CustomerMobile"] = txtCustomerMobile.Text;

                con.Open();
                SqlCommand cmd = new SqlCommand("SpCustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "GetCustomer");
                cmd.Parameters.AddWithValue("@CustomerMobile", txtCustomerMobile.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    txtCustomerName.Text = dt.Rows[0]["CustomerName"].ToString();                   
                }
                else
                {
                    lbl.Text = "Customer not Found";
                    Response.Redirect("AddCustomer.aspx");
                }
            }
            else
            {
                lbl.Text = "Please Enter Mobile Number";
            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            if (txtCustomerName.Text != "")
            {
                Response.Redirect("AddProductInCart.aspx");
            }
            else
            {
                Response.Redirect("AddCustomer.aspx");
            }

        }
    }
}