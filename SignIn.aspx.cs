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
    public partial class SignIn : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source = DESKTOP-VOBAN0O\\SQLEXPRESS ;Initial Catalog = db_SMS ;Integrated Security = true");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpPerson", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "LogIn");
            cmd.Parameters.AddWithValue("@PersonEmail", txtLogInEmail.Text);
            cmd.Parameters.AddWithValue("@PersonPassword", txtLogInPassword.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if(dt.Rows.Count > 0)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                lbl.Text = "Log In Failed!!";
            }
        }

        protected void btnForget_Click(object sender, EventArgs e)
        {
            if(txtLogInEmail.Text != "")
            {
                Session["Email"] = txtLogInEmail.Text;
                Response.Redirect("ForgetPassword.aspx");
            }
            
        }
    }
}