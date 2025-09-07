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
            string pass_match = "SELECT COUNT(*) FROM Logmast WHERE student_name='"+ txtun.Text + "' AND password='"+ txtpass.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(pass_match, con);
            DataTable dt = new DataTable(); 
            da.Fill(dt);
            if (dt.Rows[0][0].ToString() == "1") 
            {
                Session["s_student_name"] = txtun.Text;
                Response.Redirect("home.aspx");   
            }
            else
            {
                error.Text = "Invalid Login please check username and password";
                txtpass.Focus();
                //Response.Write("<script language='javascript'>alert('Invalid Login please check username and password');</script>");
            }

        }
    
    }
}