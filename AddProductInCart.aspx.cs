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

        protected void ddlDescription_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "GetProductNameAndQuantity");
            cmd.Parameters.AddWithValue("@ProductCategory", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@ProductDescription", ddlDescription.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            txtProductName.Text = dt.Rows[0]["ProductName"].ToString();
            txtAvailableQuantity.Text = dt.Rows[0]["ProductQuantity"].ToString();


        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {

            //Getting CustomerId from Procedure SpCustomer

            con.Open();
            SqlCommand dmd = new SqlCommand("SpCustomer", con);
            dmd.CommandType = CommandType.StoredProcedure;
            dmd.Parameters.AddWithValue("@Action", "GetCustomer");
            SqlDataAdapter sda = new SqlDataAdapter(dmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ViewState["CustomerId"] = dt.Rows[0]["CustomerId"].ToString();



            //Getting ProductId from procedure SpProduct 

            SqlCommand bmd = new SqlCommand("SpProduct", con);
            bmd.CommandType = CommandType.StoredProcedure;
            bmd.Parameters.AddWithValue("@Action", "GetProductId");
            SqlDataAdapter da = new SqlDataAdapter(bmd);
            DataTable bt = new DataTable();
            da.Fill(bt);

            if (bt.Rows.Count > 0 && bt.Columns.Contains("ProductId"))
            {
                ViewState["ProductId"] = bt.Rows[0]["ProductId"].ToString();
            }
            else
            {
                // Handle the case when data is missing
                lbl.Text = "Product ID not found or data missing.";
            }

            //Insert record into tblCart 

            SqlCommand cmd = new SqlCommand("SpCart", con);
            cmd.CommandType= CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "CartInsert");
            cmd.Parameters.AddWithValue("@CustomerId", ViewState["CustomerId"]);
            cmd.Parameters.AddWithValue("@ProductId", ViewState["ProductId"]);
            cmd.Parameters.AddWithValue("@PurchaseQuantity", txtPurchaseQuantity.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}