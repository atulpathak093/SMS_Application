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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source = DESKTOP-VOBAN0O\\SQLEXPRESS ;Initial Catalog = db_SMS ;Integrated Security = true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        public void BindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SpPerson", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "PersonShow");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            gvPerson.DataSource = dt;
            gvPerson.DataBind();
        }
    }
}