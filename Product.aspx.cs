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
                BindGrid();
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

        public void BindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "ProductShow");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            gvProduct.DataSource = dt;
            gvProduct.DataBind();
        }
       
        protected void btnSave_Click(object sender, EventArgs e)
        {
           if(btnSave.Text == "Submit")
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
                BindGrid();
                Clear();
            }
           else if(btnSave.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SpProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "ProductUpdate");
                cmd.Parameters.AddWithValue("@ProductId", ViewState["ProductId"]);
                cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text);
                cmd.Parameters.AddWithValue("@ProductQuantity", ddlQuantity.SelectedValue);
                cmd.Parameters.AddWithValue("@ProductPrice", txtProductPrice.Text);
                cmd.Parameters.AddWithValue("@ProductCategory", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@ProductDescription", ddlDescription.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
                Clear();
            }
        }
        public void Clear()
        {
            txtProductName.Text = "";
            txtProductPrice.Text = "";
            ddlCategory.SelectedValue = "0";
            ddlDescription.SelectedValue = "0";
            ddlQuantity.SelectedValue = "0";
            btnSave.Text = "Submit";
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDescription();
        }

        protected void gvProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SpProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "ProductDelete");
                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
            }
            else if(e.CommandName == "Upd")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SpProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "ProductEdit");
                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                txtProductName.Text = dt.Rows[0]["ProductName"].ToString();
                txtProductPrice.Text = dt.Rows[0]["ProductPrice"].ToString();
                ddlQuantity.SelectedValue = dt.Rows[0]["ProductQuantity"].ToString();
                ddlCategory.SelectedValue = dt.Rows[0]["ProductCategory"].ToString();
                BindDescription();
                ddlDescription.SelectedValue = dt.Rows[0]["ProductDescription"].ToString();
                ViewState["ProductId"] = e.CommandArgument;
                btnSave.Text = "Update";
            }
        }
    }
}