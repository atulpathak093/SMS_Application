using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMS_Application
{
    public partial class Product : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source = DESKTOP-VOBAN0O\\SQLEXPRESS ;Initial Catalog = db_SMS ;Integrated Security = true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindQuantity();
                BindCategory();
            }

        }
        public void BindQuantity()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "GetQuantity");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            ddlQuantity.DataValueField = "QuantityId";
            ddlQuantity.DataTextField = "QuantityName";
            ddlQuantity.DataSource = dt;
            ddlQuantity.DataBind();
            ddlQuantity.Items.Insert(0, new ListItem("--Select--", "0"));
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
       
        protected void btnSave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "ProductInsert");
            cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text);
            cmd.Parameters.AddWithValue("@ProductQuantity", ddlQuantity.SelectedValue);
            cmd.Parameters.AddWithValue("@ProductPrice", txtProductPrice.Text);
            cmd.Parameters.AddWithValue("@ProductCategory", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@ProductDescription", ddlDescription.SelectedValue);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDescription();
        }
    }
}