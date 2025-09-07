using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace apa_pack.SampleDesign
{



    public partial class SampleSummary : System.Web.UI.Page
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


            
            hdnsampleCode.Value = Request.QueryString["SampleCode"];


            if (!IsPostBack)
            {
                LoadSampleDetails();
                BindSampleStatus();
                BindActivityHistory();

            }



        }



        public void BindSampleStatus()
        {


            string SampleStatus = "";
            string query = " select top 1 RequestDate,Activity.ActivityDate,SampleRequestMaster.SubStatus,'' as 'Opportunity'  from SampleRequestMaster left join Activity on  SampleRequestMaster.SampleCode=Activity.SampleCode   " +
                              " where SampleRequestMaster.SampleCode= '" + hdnsampleCode.Value + "' order by Activity.CreatedDate desc ";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);

            
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {

                // --- Requested Date ---
                if (dr["RequestDate"] != DBNull.Value)
                    lblRequested.InnerText = Convert.ToDateTime(dr["RequestDate"]).ToString("dd-MM-yyyy");
                else
                    lblRequested.InnerText = "-";   // show dash if no value

                // --- Sample Completed ---
                if (dr["ActivityDate"] != DBNull.Value)
                    lblCompleted.InnerText = Convert.ToDateTime(dr["ActivityDate"]).ToString("dd-MM-yyyy");
                else
                    lblCompleted.InnerText = "-";

                // --- Opportunity Completed ---
                if (dr["Opportunity"] != DBNull.Value && !string.IsNullOrEmpty(dr["Opportunity"].ToString()))
                    lblOpportunity.InnerText = dr["Opportunity"] != DBNull.Value ? dr["Opportunity"].ToString() : "";
                else
                    lblOpportunity.InnerText = "-";

                // --- Sub Status ---
                SampleStatus = dr["SubStatus"] != DBNull.Value ? dr["SubStatus"].ToString() : "";


            }
            else
            {
                // If no rows
                lblRequested.InnerText = "-";
                lblCompleted.InnerText = "-";
                lblOpportunity.InnerText = "-";
                SampleStatus = "";
            }


            con.Close();
             
            

            // Example: Current stage is "Opportunity Completed"
            string currentStage = SampleStatus;

            // Apply CSS dynamically
            dot1.Attributes["class"] = "dot " + (currentStage == "Sample Requested" || currentStage == "Sample Created" || currentStage == "Opportunity" ? "active-dot" : "");
            line1.Attributes["class"] = "flex-fill " + (currentStage == "Sample Created" || currentStage == "Opportunity" ? "track-line-active" : "track-line");

            dot2.Attributes["class"] = "dot " + (currentStage == "Sample Created" || currentStage == "Opportunity" ? "active-dot" : "");
            line2.Attributes["class"] = "flex-fill " + (currentStage == "Opportunity" ? "track-line-active" : "track-line");

            dot3.Attributes["class"] = "d-flex justify-content-center align-items-center big-dot dot " + (currentStage == "Opportunity" ? "active-dot" : "");


        }

        private void BindActivityHistory()
        {
            string connStr = @"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                                SELECT 
                                    ISNULL(CONVERT(VARCHAR(20), ActivityDate, 103) + ' ' + CONVERT(VARCHAR(10), ActivityDate, 108), '-') AS ActivityDate,
                                    ISNULL(ActivityType, '-') AS ActivityType,
                                    ISNULL(SuccessQuantity, '-') AS SuccessQuantity,
                                    ISNULL(CreatedBy, '-') AS UserName,
                                    ISNULL(Remarks, '-') AS ActivityDescription
                                FROM Activity 
                                WHERE SampleCode = '" + hdnsampleCode.Value + @"'

                                UNION ALL

                                SELECT '-', '-', '-', '-', '-'
                                WHERE NOT EXISTS (
                                    SELECT 1 FROM Activity WHERE SampleCode = '" + hdnsampleCode.Value + @"'
                                )
                                ORDER BY ActivityDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    rptActivity.DataSource = dr;
                    rptActivity.DataBind();
                }
            }
        }

        protected string GetDuration(object startDate)
        {
            //DateTime start = Convert.ToDateTime(startDate);
            //TimeSpan diff = DateTime.Now - start;

            //if (diff.Days > 0)
            //    return diff.Days + " day(s)";
            //else if (diff.Hours > 0)
            //    return diff.Hours + " hour(s)";
            //else
            //    return diff.Minutes + " minute(s)";

            if (startDate == null || startDate.ToString() == "-" || string.IsNullOrWhiteSpace(startDate.ToString()))
            {
                return "-";
            }

            DateTime parsedDate;
            if (DateTime.TryParse(startDate.ToString(), out parsedDate))
            {
                TimeSpan diff = DateTime.Now - parsedDate;

                if (diff.Days > 0)
                    return diff.Days + " day(s)";
                else if (diff.Hours > 0)
                    return diff.Hours + " hour(s)";
                else
                    return diff.Minutes + " minute(s)";
            }

            return "-"; // fallback if parsing fails

        }




        private void LoadSampleDetails()
        {
            string connStr = @"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connStr))
            {


            

                string query = "SELECT SampleCode, CustomerName, RequestDate, ContactPerson, SalesExecutive, " +
                               "SampleRequestType, Priority, SampleDescription, SampleStatus, Comments, ExpectedOrderWonDate,DesignType,ReelSizeMM,CuttingSizeMM,PaperCombination " +
                               "FROM SampleRequestMaster WHERE SampleCode = '"+ hdnsampleCode.Value + "' ";

                SqlCommand cmd = new SqlCommand(query, con);
                 
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblSampleCode.Text = dr["SampleCode"].ToString();
                    lblCustomerName.Text = dr["CustomerName"].ToString();
                    lblRequestDate.Text = Convert.ToDateTime(dr["RequestDate"]).ToString("dd-MM-yyyy");
                    lblContactPerson.Text = dr["ContactPerson"].ToString();
                    lblSalesExecutive.Text = dr["SalesExecutive"].ToString();
                    lblSampleRequestType.Text = dr["SampleRequestType"].ToString();
                    lblPriority.Text = dr["Priority"].ToString();
                    lblSampleDescription.Text = dr["SampleDescription"].ToString();
                    lblStatus.Text = dr["SampleStatus"].ToString();
                    lblComments.Text = dr["Comments"].ToString();
                    lblExpectedOrderDate.Text = Convert.ToDateTime(dr["ExpectedOrderWonDate"]).ToString("dd-MM-yyyy");

                    //lblBoxSize.Text = dr["BoxSize"].ToString();
                    lblBoxType.Text = dr["DesignType"].ToString();
                    lblReelSize.Text = dr["ReelSizeMM"].ToString();
                    lblCuttingSize.Text = dr["CuttingSizeMM"].ToString();
                    //lblBoxWeight.Text = dr["BoxWeight"].ToString();
                    lblPaperCombination.Text = dr["PaperCombination"].ToString();
                    //lblFlute.Text = dr["Flute"].ToString();

                }
            }
        }
    







}
}