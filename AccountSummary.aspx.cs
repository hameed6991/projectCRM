using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace apa_pack
{
    public partial class AccountSummary : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=HAMEED\SQLEXPRESS; Initial Catalog=studentmanagemant;   User ID=sa;Password=shahul1234;   Encrypt=True;TrustServerCertificate=True;
      MultipleActiveResultSets=True");

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

            //UserControl head_right_div = (UserControl)Master.FindControl("food");
            //((Site)Master).FindControl("food").Visible = false;
            //head_right_div.Visible = false;
            //Master.ToString();
            //((Site)Master).Visible = false;


            hdnAccCode1.Value = Request.QueryString["AccCode"];
            hdnFrom.Value = Request.QueryString["From"];




            if (!IsPostBack)
            {
                //RadAjax_PanelAjax is the class name of the master page
                //MasterPage master = Page.Master as MasterPage;
                //master.Visible = false;

                FillDada();
                FillContactDada();
            }


 
        }


 


        protected void FillDada()
        {


            con.Open();
            string selectSQL = @"  select Account,Site,SiteID,AccType,Industry,GSTIN,Comments,CustomerType,Synonyms,Contact_Number,
                                   Address,Pincode,City,State,CustomerArea,AccessibilityType,AccessibilityTimeFrom,AccessibilityTimeTo 
                                   from AccMast where AccCode='" + hdnAccCode1.Value + "' ";


            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader = cmd.ExecuteReader(); ;
            while (reader.Read())
            {
                //Account Info
                txtAccount.Value = reader["Account"].ToString();
                txtSite.Value = reader["Site"].ToString();
                txtSiteID.Value = reader["SiteID"].ToString();
                txtAccountType.Value = reader["AccType"].ToString();
                txtIndustry.Value = reader["Industry"].ToString();
                txtSGSTIN.Value = reader["GSTIN"].ToString();
                txtAComments.Value = reader["Comments"].ToString();
                txtCustomerType.Value = reader["CustomerType"].ToString();
                txtSynonyms.Value = reader["Synonyms"].ToString();
                txtStartDate.Value = "";
                txtContactNo.Value = reader["Contact_Number"].ToString();

                //Address Info
                txtAddress.Value = reader["Address"].ToString();
                txtPincode.Value = reader["Pincode"].ToString();
                txtCity.Value = reader["City"].ToString();
                txtState.Value = reader["State"].ToString();
                txtArea.Value = reader["CustomerArea"].ToString();

                //Area Info
                txtRegion.Value = "";
                txtLocation.Value = "";
                txtGropLeader.Value = "";
                txtAccessibility.Value = reader["AccessibilityType"].ToString();
                txtAccessibilityTimeFrom.Value = reader["AccessibilityTimeFrom"].ToString();
                txtAccessibilityTimeTo.Value = reader["AccessibilityTimeFrom"].ToString();

            }
            reader.Close();
            reader.Dispose();

            cmd.Dispose();
            con.Close();



        }



        protected void FillContactDada()
        {
             
            string selectSQL = "  select ContCode,Name,MobileNo,Email,Department,Designation,City,State from ContMast where AccCode= '" + hdnAccCode1.Value + "' and Cont_lock is null Order by Name ";
   
            con.Open();
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
 
            GridViewContDetail.DataSource = ds;
            GridViewContDetail.DataBind();

            //Get perticular value from gridview
            //dnAccCode.Value = GridviewAccountSummary.Rows[1].Cells[2].Text;
            con.Close();

        }




    }
}