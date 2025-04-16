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
                BindCategory();
                BindGrid();
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
           if(btnSave.Text == "Save")
           {
                //for insert data in tblProduct table
                con.Open();
                SqlCommand cmd = new SqlCommand("SpProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "ProductInsert");
                cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text);
                cmd.Parameters.AddWithValue("@ProductQuantity", txtProductQuantity.Text);
                cmd.Parameters.AddWithValue("@ProductPrice", txtProductPrice.Text);
                cmd.Parameters.AddWithValue("@ProductCategory", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@ProductDescription", ddlDescription.SelectedValue);
                cmd.ExecuteNonQuery();

                //for Retrieving the ProductId from tblProduct table 
                SqlCommand dmd = new SqlCommand("SpProduct", con);
                dmd.CommandType = CommandType.StoredProcedure;
                dmd.Parameters.AddWithValue("@Action", "GetProductId");
                SqlDataAdapter sda = new SqlDataAdapter(dmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                int productId = Convert.ToInt32(dt.Rows[0]["ProductId"]);

                //for insert data into tblEvent table 
                SqlCommand bmd = new SqlCommand("SpEvent", con);
                bmd.CommandType = CommandType.StoredProcedure;
                bmd.Parameters.AddWithValue("@Action", "AddEvent");
                bmd.Parameters.AddWithValue("@ProductId", productId);
                bmd.Parameters.AddWithValue("@PersonEmail", Session["PersonEmail"]);
                bmd.ExecuteNonQuery();
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
                cmd.Parameters.AddWithValue("@ProductQuantity", txtProductQuantity.Text);
                cmd.Parameters.AddWithValue("@ProductPrice", txtProductPrice.Text);
                cmd.Parameters.AddWithValue("@ProductCategory", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@ProductDescription", ddlDescription.SelectedValue);
                cmd.ExecuteNonQuery();

                //for insert into tblEvent for acknowledge who is updating the Product
                SqlCommand dmd = new SqlCommand("SpEvent", con);
                dmd.CommandType = CommandType.StoredProcedure;
                dmd.Parameters.AddWithValue("@Action", "UpdateEvent");
                dmd.Parameters.AddWithValue("@ProductId", ViewState["ProductId"]);
                dmd.Parameters.AddWithValue("@PersonEmail", Session["PersonEmail"]);
                dmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
                Clear();
                Response.Redirect("ShowEventActivity.aspx");

            }
        }
        public void Clear()
        {
            txtProductName.Text = "";
            txtProductPrice.Text = "";
            ddlCategory.SelectedValue = "0";
            ddlDescription.SelectedValue = "0";
            txtProductQuantity.Text = "";
            btnSave.Text = "Save";
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
                

                //for insert into tblEvent for acknowledge who deleted the data
                SqlCommand dmd = new SqlCommand("SpEvent", con);
                dmd.CommandType = CommandType.StoredProcedure;
                dmd.Parameters.AddWithValue("@Action", "DeleteEvent");
                dmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                dmd.Parameters.AddWithValue("@PersonEmail", Session["PersonEmail"]);
                dmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
                Response.Redirect("ShowEventActivity.aspx");

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
                txtProductQuantity.Text = dt.Rows[0]["ProductQuantity"].ToString();
                ddlCategory.SelectedValue = dt.Rows[0]["ProductCategory"].ToString();
                BindDescription();
                ddlDescription.SelectedValue = dt.Rows[0]["ProductDescription"].ToString();
                ViewState["ProductId"] = e.CommandArgument;
                btnSave.Text = "Update";
            }
        }
    }
}