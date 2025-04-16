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
    public partial class AddCustomer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source = DESKTOP-VOBAN0O\\SQLEXPRESS ;Initial Catalog = db_SMS ;Integrated Security = true");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddCustomer_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpCustomer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "CustomerInsert");
            cmd.Parameters.AddWithValue("@CustomerName", txtCustomerName.Text);
            cmd.Parameters.AddWithValue("@CustomerMobile", txtCustomerMobile.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("AddProductInCart.aspx");
        }
    }
}