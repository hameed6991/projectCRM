using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

namespace apa_pack
{
    public partial class Site : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            if (Session["s_student_name"] != null)
            {
                Label1.Text = Session["s_student_name"].ToString();
            }
            else
            {
                Response.Redirect("apalogin.aspx");
            }




            // ---------------------------------------------------------------------------------------    Get Price Discount Value for Tesing

            //string originalPrice = "10000"; // The original price of the product.
            //string discountPercentage = "10"; // The discount percentage.

            //// Calculate the discount value.

            //decimal discountValueper = Convert.ToInt16(discountPercentage);
            //decimal dividvalue = Math.Round(discountValueper) / 100;

            //decimal originalpricevalue = Convert.ToInt32(originalPrice);
            //originalpricevalue = Math.Round(originalpricevalue) * dividvalue;


            //Response.Write(Math.Round(originalpricevalue));

            // ---------------------------------------------------------------------------------------    End
            //bhavakarthick


        }

        protected void but_Logout_Click(object sender, EventArgs e)
        {
            if (Session["s_student_name"] != null)
            {
                Session.Abandon();
                Response.Redirect("apalogin.aspx");
            }
        }
      


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        

      

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }



    }
}