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
    public partial class ForgetPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source = DESKTOP-VOBAN0O\\SQLEXPRESS; Initial Catalog = db_SMS ; Integrated Security = true");

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpPerson", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "ForgetPassword");
            cmd.Parameters.AddWithValue("@PersonEmail", Session["Email"]);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if(dt.Rows.Count > 0 )
            {
                string fullMobile = dt.Rows[0]["PersonMobile"].ToString();
                ViewState["Mobile"] = fullMobile;
                string maskedMobile = fullMobile.Length > 4
                ? new string('*', fullMobile.Length - 4) + fullMobile.Substring(fullMobile.Length - 4) : fullMobile;
                lblMobile.Text = maskedMobile;
            }
            else
            {
                lblMsg.Text = "User Name Doesn't Exist";
            }
           
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtPersonMobile.Text != "" && txtPersonNewPassword.Text != "" && txtConfirmPassword.Text != "")
            {
                if(txtPersonMobile.Text == ViewState["Mobile"].ToString())
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SpPerson", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "ChangePassword");
                    cmd.Parameters.AddWithValue("@PersonPassword", txtPersonNewPassword.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblMsg.Text = "Password has been changed successfully";
                    Response.Redirect("SignIn.aspx");
                }
                else
                {
                    lblMsg.Text = "Invalid Mobile Number";
                }
            }
            else
            {
                lblMsg.Text = "All Fields should be filled"; 
            }
        }
    }
}