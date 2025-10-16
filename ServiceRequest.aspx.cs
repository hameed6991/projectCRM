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
    public partial class ServiceRequest : System.Web.UI.Page
    {


        SqlConnection con = new SqlConnection(@"Data Source=HAMEED\SQLEXPRESS; Initial Catalog=studentmanagemant;   User ID=sa;Password=shahul1234;   Encrypt=True;TrustServerCertificate=True;
      MultipleActiveResultSets=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            FillData();
        }


        protected void FillData()
        {
            using (SqlConnection con = new SqlConnection(
                @"Data Source=HAMEED\SQLEXPRESS; Initial Catalog=studentmanagemant;
          User ID=sa;Password=shahul1234; Encrypt=True;TrustServerCertificate=True;MultipleActiveResultSets=True"))
            {
                con.Open();

                // Service Request list by Docket No
                string sql = @"
            SELECT
                SR.DocketNo,
                CONVERT(varchar(10), SR.CallDate, 103) AS CallDate,
                SR.SerialNo,
                PM.Product,
                SR.Status,
                SR.SubStatus,
                A.Account,
                A.Address,
                A.Site
            FROM ServiceRequest SR
            LEFT JOIN AccMast  A  ON A.AccCode  = SR.AccCode
            LEFT JOIN ProdMast PM ON PM.ProdCode = SR.ProdCode
            ORDER BY SR.CallDate DESC, SR.DocketNo DESC;";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridviewInstallSummary.DataSource = dt;
                GridviewInstallSummary.DataBind();
            }
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