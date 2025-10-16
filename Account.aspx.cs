using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace apa_pack
{
    public partial class Account : Page
    {
        // Read the connection string named "StudentDb" from web.config
        private readonly string _cs = ConfigurationManager
            .ConnectionStrings["StudentDb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        // === matches OnInit="GridviewAccountSummary_Init" in the ASPX ===
        protected void GridviewAccountSummary_Init(object sender, EventArgs e)
        {
            // ensure paging is configured even if markup changes
            GridviewAccountSummary.AllowPaging = true;
            GridviewAccountSummary.PageSize = 20;
        }

        // === matches OnPageIndexChanging="Gridincomeviewdetails_PageIndexChanging" ===
        protected void Gridincomeviewdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridviewAccountSummary.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        // Centralized data binding
        private void BindGrid()
        {
            using (var con = new SqlConnection(_cs))
            using (var cmd = new SqlCommand(@"
                SELECT
                    AccCode,
                    Account,
                    AccType,
                    CustomerType,
                    Industry,
                    Synonyms,
                    Address,
                    site,
                    siteID,
                    City,
                    Contact_Number
                FROM dbo.AccMast
                ORDER BY Account ASC;", con))
            using (var da = new SqlDataAdapter(cmd))
            {
                var dt = new DataTable();
                con.Open();
                da.Fill(dt);

                GridviewAccountSummary.DataSource = dt;
                GridviewAccountSummary.DataBind();
            }
        }
    }
}
