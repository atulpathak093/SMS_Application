using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SMS_Application
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source = DESKTOP-VOBAN0O\\SQLEXPRESS ;Initial Catalog = db_SMS ;Integrated Security = true");

        protected void Page_Load(object sender, EventArgs e)
        {
            txtAmount.Text = Session["TotalAmount"].ToString();
        }

        protected void btnAmount_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpCart", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "DeleteCustomerRecord");
            cmd.Parameters.AddWithValue("@CustomerId", Session["CustomerId"]);
            cmd.ExecuteNonQuery();
            con.Close();
            lbl.Text = "Your Payment Has been completed successfully";
            Response.Redirect("BillingInProgress.aspx");
        }
    }
}