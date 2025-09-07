using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

namespace apa_pack.Master
{
    public partial class MasterList : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["s_student_name"] != null)
            {
                //Label1.Text = Session["s_student_name"].ToString();
            }
            else
            {
                Response.Redirect("../apalogin.aspx");
            }


            FillData();
        }


        protected void FillData()
        {
            
        }
 


    }
}