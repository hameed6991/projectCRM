using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace apa_pack
{
    public partial class ServiceRequestSummary : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["Connect"].ConnectionString;
        // Add <connectionStrings> Conn in Web.config

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var docketNo = (Request.QueryString["docketNo"] ?? "").Trim();
                if (string.IsNullOrEmpty(docketNo))
                {
                    // For quick testing fallback to a known docket
                    // docketNo = "2025-05-JOB-OA-0073";
                }

                LoadSummary(docketNo);
                LoadActivity(docketNo);
            }
        }

        private void LoadSummary(string docketNo)
        {
            using (var con = new SqlConnection(conStr))
            using (var cmd = new SqlCommand(@"
SELECT TOP 1
    SR.DocketNo,
    SR.CallDate,
    SR.SerialNo,
    PM.Product,
    SR.NatureOfProblem,
    SR.CallType,
    SR.SubCallType,
    SR.ServiceCode,
    SR.Status,
    SR.SubStatus,
    SR.Source,
    CASE WHEN SR.Billable = 1 THEN 'Yes' ELSE 'No' END AS Billable,
    A.Account,
    A.Address,
    ISNULL(C.Name,'') ContactName,
    ISNULL(C.MobileNo,'') ContactPhone,
    ISNULL(C.Email,'') ContactEmail,
    ISNULL(SR.StepIndex,1) AS StepIndex
FROM ServiceRequest SR
LEFT JOIN ProdMast PM ON PM.ProdCode = SR.ProdCode
LEFT JOIN AccMast  A  ON A.AccCode = SR.AccCode
LEFT JOIN ContMast C  ON C.AccCode = SR.AccCode AND C.IsPrimary = 1
WHERE (@DocketNo='' OR SR.DocketNo = @DocketNo);
", con))
            {
                cmd.Parameters.Add("@DocketNo", SqlDbType.NVarChar, 50).Value = (object)docketNo ?? "";
                con.Open();
                using (var rdr = cmd.ExecuteReader())
                {
                    if (rdr.Read())
                    {
                        lblDocketNo.Text = Safe(rdr, "DocketNo");
                        lblCallDate.Text = SafeDateTime(rdr, "CallDate");
                        lblSerialNo.Text = Safe(rdr, "SerialNo");
                        lblProduct.Text = Safe(rdr, "Product");
                        lblNature.Text = Safe(rdr, "NatureOfProblem");
                        lblCallType.Text = Safe(rdr, "CallType");
                        lblSubCallType.Text = Safe(rdr, "SubCallType");
                        lblServiceCode.Text = Safe(rdr, "ServiceCode");
                        lblStatus.Text = Safe(rdr, "Status");
                        lblSubStatus.Text = Safe(rdr, "SubStatus");
                        lblSource.Text = Safe(rdr, "Source");
                        lblBillable.Text = Safe(rdr, "Billable");
                        lblAccount.Text = Safe(rdr, "Account");
                        lblAddress.Text = Safe(rdr, "Address");

                        lblContactName.Text = Safe(rdr, "ContactName");
                        lblContactPhone.Text = Safe(rdr, "ContactPhone");
                        lblContactEmail.Text = Safe(rdr, "ContactEmail");

                        hfStepIndex.Value = SafeInt(rdr, "StepIndex", 1).ToString();

                        // Example for right-hand KPI section (set what you have):
                        lblLastActivityDays.Text = "";   // fill from activity table if available
                        lblLastSubStatus.Text = lblSubStatus.Text;
                        lblLastComments.Text = "";   // fill as needed
                    }
                }
            }
        }

        private void LoadActivity(string docketNo)
        {
            // If you have an Activity table, bind it here. Otherwise, show empty list.
            using (var con = new SqlConnection(conStr))
            using (var cmd = new SqlCommand(@"
SELECT TOP 50
    ActivityDate,
    UserName,
    Status,
    Description
FROM ServiceRequestActivity
WHERE (@DocketNo='' OR DocketNo=@DocketNo)
ORDER BY ActivityDate DESC;", con))
            {
                cmd.Parameters.Add("@DocketNo", SqlDbType.NVarChar, 50).Value = (object)docketNo ?? "";
                var dt = new DataTable();
                new SqlDataAdapter(cmd).Fill(dt);
                rptActivity.DataSource = dt;
                rptActivity.DataBind();
            }
        }

        // ---- Helpers ------------------------------------------------------
        private static string Safe(IDataRecord r, string col)
        {
            var i = r.GetOrdinal(col);
            return r.IsDBNull(i) ? "" : Convert.ToString(r.GetValue(i));
        }
        private static string SafeDateTime(IDataRecord r, string col, string fmt = "dd/MM/yyyy HH:mm")
        {
            var i = r.GetOrdinal(col);
            return r.IsDBNull(i) ? "" : Convert.ToDateTime(r.GetValue(i)).ToString(fmt);
        }
        private static int SafeInt(IDataRecord r, string col, int def = 0)
        {
            var i = r.GetOrdinal(col);
            return r.IsDBNull(i) ? def : Convert.ToInt32(r.GetValue(i));
        }

        // ---- Button handlers (wire to your flows as needed) ---------------
        protected void btnEdit_Click(object sender, EventArgs e) { /* navigate/edit */ }
        protected void btnAllocate_Click(object sender, EventArgs e) { /* allocate */ }
        protected void btnFollowUp_Click(object sender, EventArgs e) { /* follow up */ }
        protected void btnClosure_Click(object sender, EventArgs e) { /* closure */ }
        protected void btnRma_Click(object sender, EventArgs e) { /* RMA */ }
        protected void btnBill_Click(object sender, EventArgs e) { /* billing */ }
        protected void btnQuote_Click(object sender, EventArgs e) { /* quotation */ }
        protected void btnEngineerComments_Click(object sender, EventArgs e) { /* comments */ }
    }
}