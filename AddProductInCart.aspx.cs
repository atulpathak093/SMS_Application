using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMS_Application
{
    public partial class AddProductInCart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source = DESKTOP-VOBAN0O\\SQLEXPRESS ;Initial Catalog = db_SMS ;Integrated Security = true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
            }
        }
        public void BindCategory()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "GetCategory");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataSource = dt;
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindDescription()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "GetDescription");
            cmd.Parameters.AddWithValue("@ProductCategory", ddlCategory.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            ddlDescription.DataValueField = "DescriptionId";
            ddlDescription.DataTextField = "DescriptionName";
            ddlDescription.DataSource = dt;
            ddlDescription.DataBind();
            ddlDescription.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDescription();
        }

        protected void btnForBilling_Click(object sender, EventArgs e)
        {
            Response.Redirect("Billing.aspx");
        }
    }
}