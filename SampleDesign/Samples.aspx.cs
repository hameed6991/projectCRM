using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

namespace apa_pack.SampleDesign
{
    public partial class Samples : System.Web.UI.Page
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
            con.Open();
            string Inssql = @"Select SampleCode,CustomerName,Convert(varchar(20),RequestDate,103) as 'RequestDate',EngineerMaster.EngineerName as 'SalesExecutive',SampleRequestType,Priority,SampleDescription,DesignType
                            ,LengthMM,WidthMM,HeightMM,ExpectedOrderWonDate,SubStatus
                            from SampleRequestMaster 
                            inner Join EngineerMaster on EngineerCode=SampleRequestMaster.SalesExecutive
                            where SampleStatus='Open'
                            order by RequestDate Desc";


            SqlCommand cmd = new SqlCommand(Inssql, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);


            GridviewSampleSummary.DataSource = ds;
            GridviewSampleSummary.DataBind();

            //Get perticular value from gridview
            //dnAccCode.Value = GridviewAccountSummary.Rows[1].Cells[2].Text;
            con.Close();
        }

        protected void Gridincomeviewdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridviewSampleSummary.PageIndex = e.NewPageIndex;
            FillData();


        }

  
       

        protected void GridviewSampleSummary_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "onMouseOver('" + (e.Row.RowIndex + 1) + "')";
                e.Row.Attributes["onmouseout"] = "onMouseOut('" + (e.Row.RowIndex + 1) + "')";
            }


            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get your Expected Date value
                DateTime expectedDate;
                var lblDate = e.Row.FindControl("lblEllipsis1") as Label;
                var imgStatus = e.Row.FindControl("imgStatus") as Image;

                if (lblDate != null && imgStatus != null)
                {
                    if (DateTime.TryParse(lblDate.Text, out expectedDate))
                    {
                        if (expectedDate < DateTime.Now) // Past date
                        {
                            imgStatus.ImageUrl = "~/images/Negative.svg";
                        }
                        else if (expectedDate.Date == DateTime.Now.Date) // Today
                        {
                            imgStatus.ImageUrl = "~/images/Pasitive.svg";
                        }
                        else // Future date
                        {
                            imgStatus.ImageUrl = "~/images/Pasitive.svg";
                        }
                    }
                    else
                    {
                        // If no date, show a default
                        imgStatus.ImageUrl = "~/images/Unknown.svg";
                    }
                }
            }



        }











    }

}