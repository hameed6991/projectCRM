using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.SessionState;

namespace apa_pack
{
    public partial class apalogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login_submit_Click(object sender, EventArgs e)
        {
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["StudentDb"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand(
                "SELECT COUNT(*) FROM dbo.Logmast WHERE student_name = @u AND [password] = @p", con))
            {
                cmd.Parameters.AddWithValue("@u", txtun.Text.Trim());
                cmd.Parameters.AddWithValue("@p", txtpass.Text); // later: store hashes instead

                con.Open();
                int matches = (int)cmd.ExecuteScalar();

                if (matches == 1)
                {
                    Session["s_student_name"] = txtun.Text.Trim();
                    Response.Redirect("home.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    error.Text = "Invalid Login. Please check username and password.";
                    txtpass.Focus();
                }
            }
        }


    }
}