using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace SMS_Application
{
    public partial class PersonRegistrationForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source = DESKTOP-VOBAN0O\\SQLEXPRESS; Initial Catalog = db_SMS ; Integrated Security = true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindRole();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtPersonpassword.Text == txtConfirmPassword.Text)
            {
                if (txtPersonName.Text != "" && txtPersonEmail.Text != "" && txtConfirmPassword.Text != "" && txtPersonpassword.Text != "" && txtPersonMobile.Text != "" && ddlRole.SelectedValue != "0")
                {
                    con.Open();
                    SqlCommand dmd = new SqlCommand("SpPerson", con);
                    dmd.CommandType = CommandType.StoredProcedure;
                    dmd.Parameters.AddWithValue("@Action", "AlreadyPerson");
                    dmd.Parameters.AddWithValue("@PersonEmail", txtPersonEmail.Text);
                    dmd.Parameters.AddWithValue("@PersonMobile", txtPersonMobile.Text);
                    SqlDataAdapter sda = new SqlDataAdapter(dmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    //con.Close();
                    if (dt.Rows.Count>0)
                    {
                        lbl.Text = "Person Already exist";
                    }

                    else
                    {
                        //con.Open();
                        SqlCommand cmd = new SqlCommand("SpPerson", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Action", "PersonInsert");
                        cmd.Parameters.AddWithValue("@PersonName", txtPersonName.Text);
                        cmd.Parameters.AddWithValue("@PersonEmail", txtPersonEmail.Text);
                        cmd.Parameters.AddWithValue("@PersonPassword", txtPersonpassword.Text);
                        cmd.Parameters.AddWithValue("@PersonMobile", txtPersonMobile.Text);
                        cmd.Parameters.AddWithValue("@PersonRole", ddlRole.SelectedValue);
                        cmd.ExecuteNonQuery();
                        Clear();
                        Response.Redirect("SignIn.aspx");
                    }
                    con.Close();


                }
                else
                {
                    lbl.Text = "All Field should be Filled!";
                }
            }
            else
            {
                lbl.Text = "Password Mismatched";
            }

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Clear();
        }

        public void BindRole()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpPerson", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "PersonRole");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            ddlRole.DataValueField = "RoleId";
            ddlRole.DataTextField = "RoleName";
            ddlRole.DataSource = dt;
            ddlRole.DataBind();
            ddlRole.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void Clear()
        {
            txtConfirmPassword.Text = "";
            txtPersonEmail.Text = "";
            txtPersonMobile.Text = "";
            txtPersonName.Text = "";
            txtPersonpassword.Text = "";
            ddlRole.SelectedValue = "0";
            lbl.Text = "";

        }
    }
}