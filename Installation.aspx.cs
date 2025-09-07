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
    public partial class Installation : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            FillData();
        }


        protected void FillData()
        {
            con.Open();
            string Inssql = @"Select InstallCode,A.Account,A.Address,SerialNo,PM.Product,Convert(varchar(20),InstallDate,103) as 'InstallDate',WarrantyType,WarrStartDate,WarrEndDate,NoOfVisit,A.Site,SubStatus 
                            from Purchase 
                            inner join AccMast A on A.AccCode=Purchase.AccCode 
                            inner Join ProdMast PM ON Purchase.prodcode=PM.Prodcode
                            where Purchase.Status='Open'
                            order by SerialNo Desc";


            SqlCommand cmd = new SqlCommand(Inssql, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);


            GridviewInstallSummary.DataSource = ds;
            GridviewInstallSummary.DataBind();

            //Get perticular value from gridview
            //dnAccCode.Value = GridviewAccountSummary.Rows[1].Cells[2].Text;
            con.Close();
        }

        protected void Gridincomeviewdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridviewInstallSummary.PageIndex = e.NewPageIndex;
            FillData();


        }

        protected void GridviewAccountSummary_Init(object sender, EventArgs e)
        {

        }

        protected void GridviewAccountSummary_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "onMouseOver('" + (e.Row.RowIndex + 1) + "')";
                e.Row.Attributes["onmouseout"] = "onMouseOut('" + (e.Row.RowIndex + 1) + "')";
            }
        }
    }
}