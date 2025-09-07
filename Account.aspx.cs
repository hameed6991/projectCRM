using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

namespace apa_pack
{
    public partial class Account : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");
        
        protected void Page_Load(object sender, EventArgs e)
        {

            FillData();
        }

        protected void FillData()
        {
            con.Open();
            //SqlCommand cmd = new SqlCommand("select Outgo_id,Convert(varchar(20),Out_Date,103) as 'Out_Date',Out_To,Outgo_Amount,Totaloutgo_Amoount from outgodetails", con);
            SqlCommand cmd = new SqlCommand("Select AccCode,Account,AccType,CustomerType,Industry,Synonyms,Address,site,siteID,City,Contact_Number from AccMast order by Account Asc ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
             

            GridviewAccountSummary.DataSource = ds;
            GridviewAccountSummary.DataBind();

            //Get perticular value from gridview
           //dnAccCode.Value = GridviewAccountSummary.Rows[1].Cells[2].Text;
            con.Close();
        }

        protected void Gridincomeviewdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridviewAccountSummary.PageIndex = e.NewPageIndex;
            FillData();


        }

        protected void GridviewAccountSummary_Init(object sender, EventArgs e)
        {

        }

         
    }
}