using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ClientServices;
using System.Data.SqlClient;

namespace apa_pack
{
    public partial class AutoCompleteTextbox : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["s_student_name"] != null)
            {
                //Label1.Text = Session["s_student_name"].ToString();
            }
            else
            {
                Response.Redirect("apalogin.aspx");
            }


        }



        [WebMethod]
        public static List<string> GetAccountName(string pre)
        {
            string ValCon = "";
            List<string> AccountName = new List<string>();

            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");

            string sqlqry = string.Format("select AccCode,Account from Accmast where Account like '%{0}%' ", pre);
            con.Open();
            SqlCommand cmd = new SqlCommand(sqlqry,con);
            SqlDataReader dr = cmd.ExecuteReader();
            while(dr.Read())
            {
                AccountName.Add(dr.GetString(0));
                AccountName.Add("~");
                AccountName.Add(dr.GetString(1));

            }
            con.Close();

            return AccountName;
        }

        protected void txtCompanyName_TextChanged(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(txtCompanyName.Text))
            {
                
                Page.RegisterClientScriptBlock("", "<script>alert('Company name cannot be empty.');</script>");
            }
            else
            {
                Page.RegisterClientScriptBlock("", "<script>alert('"+ txtCompanyName.Text + "');</script>");
            }
 
        }


        //[WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public static List<string> GetCompanyName(string pre)
        //{
        //    List<string> allCompanyName = new List<string>();
        //    using (SystemEntities dc = new SystemEntities())
        //    {
        //        allCompanyName = (from a in dc.Printers
        //                          where a.Printer_Name.StartsWith(pre)
        //                          select a.Printer_Name).ToList();
        //    }


        //    return allCompanyName;
        //}





    }
}