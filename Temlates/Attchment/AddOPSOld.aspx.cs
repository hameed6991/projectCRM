using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using DevExpress.Web;
using DevExpress.Utils;
using Prizm.UtilService;
using SalesCRM.Utility;
using System.Web.Services;
using System.Web.Script.Services;

using System.Collections.Generic;
using System.Linq;
using System.IO;

namespace SalesCRM
{
    public partial class AddOPSOld : System.Web.UI.Page
    {

        string RowType = "";
        int count = 0;
        int count1 = 0;
        string ReloadPage = "";

        string CheckCondition = string.Empty;

        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strserviceCon"]);
        SqlConnection Salescon = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strCon"]);
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {

            //ClientScript.RegisterStartupScript(this.GetType(), "script234", "alert('test');", true);
            

            if (Request.QueryString["TrackNo"].ToString() != "")
            {
                hdnTrackNo.Value = Request.QueryString["TrackNo"].ToString();
                RowType = Request.QueryString["Type"].ToString();
            }
            
            filldata();
            fillInvoicedata();
            fillPaymentdata();

            if (!IsPostBack)
            {
                ConfigureEditModeCommandLayoutItem();
                int commandColumnIndex = 0; // Adjust this index based on your column order
                                            //grdsearch.Columns[commandColumnIndex].Visible = false;


                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strCon"]);


                //-------------------------  Validation POInfo New Button Hide
                string SqlQueryED = " select * from POInfo where ReferenceNo = '" + hdnTrackNo.Value + "' ";
                con.Open();
                SqlCommand cmdED = new SqlCommand(SqlQueryED, con);
                SqlDataReader dr = cmdED.ExecuteReader();

                while (dr.Read())
                {
                    count++;
                }
                if (count != 0)
                {
                    ////Find the GridViewCommandColumn by its Name
                    GridViewCommandColumn commandColumn = (GridViewCommandColumn)grdsearch.Columns["CommandColumn"];
                    if (commandColumn != null)
                    {
                        commandColumn.ShowNewButtonInHeader = false;
                         
                    }
                }
                con.Close();
                //--------------------------  End


                //--------------------------  Validation Invoiceinfo New Button Hide
                string SqlQueryIv = " select * from Invoiceinfo where ReferenceNo = '" + hdnTrackNo.Value + "' ";
                con.Open();
                SqlCommand cmdIv = new SqlCommand(SqlQueryIv, con);
                SqlDataReader drIv = cmdIv.ExecuteReader();

                while (drIv.Read())
                {
                    count1++;
                }
                if (count1 != 0)
                {
                    ////Find the GridViewCommandColumn by its Name
                    GridViewCommandColumn commandColumn1 = (GridViewCommandColumn)ASPxGridView1.Columns["CommandColumn1"];
                    if (commandColumn1 != null)
                    {
                        commandColumn1.ShowNewButtonInHeader = false;
                         
                    }
                }
                con.Close();
                //--------------------------  End






                //--------------------------  Validation Paymentinfo New Button Hide
                
                int varInvoiceValueBH = 0;
                con.Open();
                string sqlV = "select InvoiceValue from Invoiceinfo where ReferenceNo='" + hdnTrackNo.Value + "' ";
                SqlCommand cmdV = new SqlCommand(sqlV, con);
                SqlDataReader drV = cmdV.ExecuteReader();
                if (drV.Read())
                {
                    varInvoiceValueBH = Convert.ToInt32(drV["InvoiceValue"]);
                }
                drV.Close();
                cmdV.Cancel();
                con.Close();


                int varPayValueBH = 0;
                string SqlQueryPED = " select Amount from PaymentInfo where ReferenceNo = '" + hdnTrackNo.Value + "' ";
                con.Open();
                SqlCommand cmdPED = new SqlCommand(SqlQueryPED, con);
                SqlDataReader drP = cmdPED.ExecuteReader();

                while (drP.Read())
                {
                    varPayValueBH += Convert.ToInt32(drP["Amount"]);
                }
                con.Close();

                if(varInvoiceValueBH == varPayValueBH)
                {

                    GridViewCommandColumn CommendColumn2 = (GridViewCommandColumn)ASPxGridView2.Columns["CommendColumn2"];
                    if (CommendColumn2 != null)
                    {
                        CommendColumn2.ShowNewButtonInHeader = false;
                         
                    }

                }

                //--------------------------  Validation Paymentinfo New Button Hide


                filldata();

            }
           

        }

 
        // No Use This function only for checking
        private void ConfigureEditModeCommandLayoutItem()
        {
            //Find the EditModeCommandLayoutItem within the ASPxGridView
            //EditModeCommandLayoutItem editModeCommandLayoutItem = grdsearch.FindEditFormTemplateControl("grdsearch") as EditModeCommandLayoutItem;

            ASPxPageControl editModeCommandLayoutItem = grdsearch.FindEditFormTemplateControl("PONo") as ASPxPageControl;

            //EditModeCommandLayoutItem editModeCommandLayoutItem = grdsearch.FindEditRowCellTemplateControl("EditModeCommandLayoutItem") as EditModeCommandLayoutItem;
             
            if (editModeCommandLayoutItem != null)
            {
                // Example: Setting some properties
                //editModeCommandLayoutItem.ShowTabs = true;

                editModeCommandLayoutItem.ScrollButtonStyle.BackColor = System.Drawing.Color.LightBlue;
                //editModeCommandLayoutItem.ShowCancelButton = true;

                // You can set more properties or add custom buttons as needed
            }
        }

        public void FillDropdown()
        {

            //string strSql = "";
            //con.Open();


            //GridViewDataComboBoxColumn col = ASPxGridView1.Columns["PaymentTerms"] as GridViewDataComboBoxColumn;
            //col.PropertiesComboBox.DataSource = GetDataSource();
            //col.PropertiesComboBox.ValueField = "Name";
            //col.PropertiesComboBox.TextField = "Name";

            //strSql = " select Subval as 'ID',Subval as 'Name' from submaster where  [key]='PaymentTerms' ";



            //SqlDataAdapter da = new SqlDataAdapter(strSql, con);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //DDpaymentterms.DataSource = dt;
            //DDpaymentterms.TextField = "Name";
            //DDpaymentterms.ValueField = "Name";
            //DDpaymentterms.DataBind();
            //DDpaymentterms.ValueField = "Name";
            //DDpaymentterms.Items.Insert(0, new DevExpress.Web.ListEditItem("<-Select->", ""));
            ////paymentid.Items.Insert(0, new ListItem("All", ""));

            //con.Close();
        }

        void filldata()
        {


            string sqlqry1 = string.Empty;
        
            string sqlqry3 = string.Empty;
            string SqlCondition = string.Empty;
            string SqlQuery = string.Empty;


            string  totqry = "";
            

            totqry = " select POCode,ReferenceNo,PONo,PODate,POValue from POInfo where Type='"+ RowType + "' and ReferenceNo='" + hdnTrackNo.Value + "' ";

            grdsearch.SettingsPager.PageSize = Convert.ToInt32(Session["PageSize"].ToString());
            try
            {

                SqlDataAdapter da = new SqlDataAdapter(totqry, Salescon);
                DataSet ds = new DataSet();
                da.Fill(ds);

                dt = new DataTable();
                dt = ds.Tables[0];

                grdsearch.DataSource = dt;
                grdsearch.DataBind();
                grdsearch.KeyFieldName = "POCode";
                da.Dispose();
                Salescon.Close();

            }
            catch (Exception er)
            {
                Page.RegisterClientScriptBlock("Alert", "<script>alert('" + er.Message + "')</script>");
            }


        }


        void fillInvoicedata()
        {


            string sqlqry1 = string.Empty;

            string sqlqry3 = string.Empty;
            string SqlCondition = string.Empty;
            string SqlQuery = string.Empty;


            string sqlqry = " ", sqlqry2 = "", totqry = "";
 
            totqry = " select InvoiceCode,ReferenceNo,InvoiceNo,InvoiceDate,InvoiceValue,Remark,PaymentTerms from InvoiceInfo where Type='"+ RowType + "' and ReferenceNo='" + hdnTrackNo.Value + "' ";

            ASPxGridView1.SettingsPager.PageSize = Convert.ToInt32(Session["PageSize"].ToString());
            try
            {

                SqlDataAdapter da = new SqlDataAdapter(totqry, Salescon);
                DataSet ds = new DataSet();
                da.Fill(ds);

                dt = new DataTable();
                dt = ds.Tables[0];

                ASPxGridView1.DataSource = dt;
                ASPxGridView1.DataBind();
                ASPxGridView1.KeyFieldName = "InvoiceCode";
                da.Dispose();
                Salescon.Close();

            }
            catch (Exception er)
            {
                Page.RegisterClientScriptBlock("Alert", "<script>alert('" + er.Message + "')</script>");
            }


        }


        void fillPaymentdata()
        {


            string sqlqry1 = string.Empty;

            string sqlqry3 = string.Empty;
            string SqlCondition = string.Empty;
            string SqlQuery = string.Empty;


            string sqlqry = " ", sqlqry2 = "", totqry = "";

            totqry = " select PaymentCode,ReferenceNo,PaymentRefNo,PaymentDate,Amount,Remark from PaymentInfo where Type='"+ RowType + "' and ReferenceNo='" + hdnTrackNo.Value + "' ";

            ASPxGridView2.SettingsPager.PageSize = Convert.ToInt32(Session["PageSize"].ToString());
            try
            {

                SqlDataAdapter da = new SqlDataAdapter(totqry, Salescon);
                DataSet ds = new DataSet();
                da.Fill(ds);

                dt = new DataTable();
                dt = ds.Tables[0];

                ASPxGridView2.DataSource = dt;
                ASPxGridView2.DataBind();
                ASPxGridView2.KeyFieldName = "PaymentCode";
                da.Dispose();
                Salescon.Close();

            }
            catch (Exception er)
            {
                Page.RegisterClientScriptBlock("Alert", "<script>alert('" + er.Message + "')</script>");
            }


        }

        //--------------------------------------------- PO info

        protected void grdsearch_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {



            try
            {

                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strCon"]);


                // Get POCode Start

                con.Open();
                string sqlQry1 = " select Right('0000000000'+cast(Right('0000000000'+cast(POCode as varchar),10)   as varchar),10) as 'POCode'  from keygeneration  ";
                SqlCommand cmd1 = new SqlCommand(sqlQry1, con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read())
                {
                    hdnPOCode.Value = dr1["POCode"].ToString();
                }

                con.Close();
                // Get POCode End



                string VarPONo = (string)e.NewValues["PONo"].ToString();
                string VarPODate = (string)e.NewValues["PODate"].ToString();
                string VarPOValue = (string)e.NewValues["POValue"].ToString();


                int ConvertedPOValue = Int32.Parse(VarPOValue);


                string StrSQL = "";
                con.Open();


                StrSQL = " Insert into POInfo (POCode,ReferenceNo,PONo,PODate,POValue,Type,CreatedBy,CreatedDate)   ";
                StrSQL += " values('" + hdnPOCode.Value + "','" + hdnTrackNo.Value + "','" + VarPONo + "','" + VarPODate + "'," + ConvertedPOValue + ",'" + RowType + "',  ";
                StrSQL += " '" + Session["username"].ToString() + "',GetDate() ) ";
                if (con.State == ConnectionState.Open)
                {
                    SqlCommand SqlCommand = new SqlCommand(StrSQL, con);
                    SqlCommand.ExecuteNonQuery();
                    // this cancels the edit which we don’t need coz the are handling the edit  
                    e.Cancel = true;
                    grdsearch.CancelEdit();
                    grdsearch.DataBind();
                    //filldata();

                }


                string StrSQLM = "";
                StrSQLM = "  Update OPSTracker SET PO_Update=1  where  OPSReferenceNo='" + hdnTrackNo.Value + "'";
                if (con.State == ConnectionState.Open)
                {
                    SqlCommand SqlCommandM = new SqlCommand(StrSQLM, con);
                    SqlCommandM.ExecuteNonQuery();

                }



                string StrSQLK = "";
                StrSQLK = "  Update KeyGeneration SET POCode=POCode+1  ";
                if (con.State == ConnectionState.Open)
                {
                    SqlCommand SqlCommandK = new SqlCommand(StrSQLK, con);
                    SqlCommandK.ExecuteNonQuery();

                    filldata();
                }


                con.Close();


                // Call Clind Side -- For Reload Page
                grdsearch.JSProperties["cpReloadPage"] = true;

            }

            catch (NullReferenceException ex)
            {
                // Handle the exception
                e.Cancel = true;
            }
        }


        protected void grdsearch_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            try
            { 

            string VarPONo = (string)e.NewValues["PONo"].ToString();
            string VarPODate = (string)e.NewValues["PODate"].ToString();
            string VarPOValue = (string)e.NewValues["POValue"].ToString();
 


            int ConvertedPOValue = 0;

            if (VarPOValue != "")
            {
                ConvertedPOValue = Int32.Parse(VarPOValue);
            }
             
            

            string StrSQL = "";
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strCon"]);
            con.Open();

            StrSQL = " update POInfo set PONo = '" + VarPONo.ToString() + "',PODate = '" + VarPODate.ToString() + "',POValue=" + ConvertedPOValue + ", ";
            StrSQL += " ModifiedBy='"+ Session["username"].ToString() + "',ModifiedDate=GetDate() ";
            StrSQL += " WHERE ReferenceNo = '" + hdnTrackNo.Value + "'  ";
            if (con.State == ConnectionState.Open)
            {
                SqlCommand SqlCommand = new SqlCommand(StrSQL, con);
                int rowcount = SqlCommand.ExecuteNonQuery();
                if (rowcount > 0)
                {
                    // this cancels the edit which we don’t need coz the are handling the edit  
                    e.Cancel = true;
                    grdsearch.CancelEdit();
                    grdsearch.DataBind();
                    filldata();
                }
            }
       
            con.Close();



            }

            catch (NullReferenceException ex)
            {
                // Handle the exception
                e.Cancel = true;
            }



        }


        //--------------------------------------------- Invoice info
        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {


            try
            {

            
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strCon"]);


            // Get InvoiceCode Start

            con.Open();
            string sqlQry1 = " select Right('0000000000'+cast(Right('0000000000'+cast(InvoiceCode as varchar),10)   as varchar),10) as 'InvoiceCode'  from keygeneration  ";
            SqlCommand cmd1 = new SqlCommand(sqlQry1, con);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.Read())
            {
                hdnInvoiceCode.Value = dr1["InvoiceCode"].ToString();
            }

            con.Close();
            // Get InvoiceCode End


            string VarInvoiceNo = (string)e.NewValues["InvoiceNo"].ToString();
            string VarInvoiceDate = (string)e.NewValues["InvoiceDate"].ToString();
            string VarInvoiceValue = (string)e.NewValues["InvoiceValue"].ToString();
            string VarRemark = (string)e.NewValues["Remark"].ToString();
            string VarPaymentTerms = (string)e.NewValues["PaymentTerms"].ToString();

            int ConvertedInvoiceValue = Int32.Parse(VarInvoiceValue);


            string StrSQL = "";
            con.Open();


            StrSQL = " Insert into InvoiceInfo (InvoiceCode,ReferenceNo,InvoiceNo,InvoiceDate,InvoiceValue,Type,Remark,PaymentTerms,CreatedBy,CreatedDate)   ";
            StrSQL += " values('"+ hdnInvoiceCode.Value + "','" + hdnTrackNo.Value + "','" + VarInvoiceNo + "','" + VarInvoiceDate + "'," + ConvertedInvoiceValue + ",'"+ RowType + "','"+ VarRemark + "','"+ VarPaymentTerms + "',  ";
            StrSQL += " '"+ Session["username"].ToString() + "',GetDate() )";
            if (con.State == ConnectionState.Open)
            {
                SqlCommand SqlCommand = new SqlCommand(StrSQL, con);
                SqlCommand.ExecuteNonQuery();
                // this cancels the edit which we don’t need coz the are handling the edit  
                e.Cancel = true;
                ASPxGridView1.CancelEdit();
                ASPxGridView1.DataBind();
                //fillInvoicedata();

            }



            string StrSQLM = "";
            StrSQLM = "  Update OPSTracker SET Invoice_Update=1  where  OPSReferenceNo='" + hdnTrackNo.Value + "'";
            if (con.State == ConnectionState.Open)
            {
                SqlCommand SqlCommandM = new SqlCommand(StrSQLM, con);
                SqlCommandM.ExecuteNonQuery();

            }


            string StrSQLK1 = "";
            StrSQLK1 = "  Update KeyGeneration SET InvoiceCode=InvoiceCode+1  ";
            if (con.State == ConnectionState.Open)
            {
                SqlCommand SqlCommandK1 = new SqlCommand(StrSQLK1, con);
                SqlCommandK1.ExecuteNonQuery();
                fillInvoicedata();
            }

            con.Close();

           
            // Call Clind Side -- For Reload Page
            ASPxGridView1.JSProperties["cpReloadPage"] = true;




            }

            catch (NullReferenceException ex)
            {
                // Handle the exception
                e.Cancel = true;
            }



        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            try
            {

             
            string VarInvoiceNo = (string)e.NewValues["InvoiceNo"].ToString();
            string VarInvoiceDate = (string)e.NewValues["InvoiceDate"].ToString();
            string VarInvoiceValue = (string)e.NewValues["InvoiceValue"].ToString();
            string VarRemark = (string)e.NewValues["Remark"].ToString();
            string VarPaymentTerms = (string)e.NewValues["PaymentTerms"].ToString();



            int ConvertedInvoiceValue = 0;

            if (VarInvoiceValue != "")
            {
                ConvertedInvoiceValue = Int32.Parse(VarInvoiceValue);
            }



            string StrSQL = "";
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strCon"]);
            con.Open();

            StrSQL = " update InvoiceInfo set InvoiceNo = '" + VarInvoiceNo.ToString() + "',InvoiceDate = '" + VarInvoiceDate.ToString() + "',InvoiceValue=" + ConvertedInvoiceValue + ",Remark='"+ VarRemark + "',PaymentTerms='"+ VarPaymentTerms + "', ";
            StrSQL += " ModifiedBy='"+ Session["username"].ToString() + "',ModifiedDate=GetDate() ";
            StrSQL += " WHERE ReferenceNo = '" + hdnTrackNo.Value + "'  ";
            if (con.State == ConnectionState.Open)
            {
                SqlCommand SqlCommand = new SqlCommand(StrSQL, con);
                int rowcount = SqlCommand.ExecuteNonQuery();
                if (rowcount > 0)
                {
                    // this cancels the edit which we don’t need coz the are handling the edit  
                    e.Cancel = true;
                    ASPxGridView1.CancelEdit();
                    ASPxGridView1.DataBind();
                    fillInvoicedata();
                }
            }

            con.Close();


            }

            catch (NullReferenceException ex)
            {
                // Handle the exception
                e.Cancel = true;
            }


        }

        protected void ASPxGridView2_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            try
            { 
            //ClientScript.RegisterStartupScript(this.GetType(), "script234", "alert('test');", true);
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strCon"]);

            int varInvoiceValue = 0;
            con.Open();
            string sqlV = "select InvoiceValue from Invoiceinfo where ReferenceNo='" + hdnTrackNo.Value + "' ";
            SqlCommand cmdV = new SqlCommand(sqlV, con);
            SqlDataReader drV = cmdV.ExecuteReader();
            if (drV.Read())
            {
                varInvoiceValue = Convert.ToInt32(drV["InvoiceValue"]);
            }
            drV.Close();
            cmdV.Cancel();
            con.Close();


            int varPayValue = 0;
            string SqlQueryPED = " select Amount from PaymentInfo where ReferenceNo = '" + hdnTrackNo.Value + "' ";
            con.Open();
            SqlCommand cmdPED = new SqlCommand(SqlQueryPED, con);
            SqlDataReader drP = cmdPED.ExecuteReader();

            while (drP.Read())
            {
                varPayValue += Convert.ToInt32(drP["Amount"]);
            }
            con.Close();
            varPayValue = varPayValue + Convert.ToInt32(e.NewValues["Amount"]);



            // Hide New Button
            if (varInvoiceValue == varPayValue)
            {

                GridViewCommandColumn CommendColumn2 = (GridViewCommandColumn)ASPxGridView2.Columns["CommendColumn2"];
                if (CommendColumn2 != null)
                {
                    CommendColumn2.ShowNewButtonInHeader = false;


                    // Call Clind Side -- For Reload Page
                    ASPxGridView2.JSProperties["cpReloadPage"] = true;
                }

            }


            //int VAmount = Convert.ToInt32(e.NewValues["Amount"]);
            if (varInvoiceValue < varPayValue)
            {
                //hdnValidationError.Value = "Payment Amout Wrong";
                //hdnInvoiceValue.Value = varInvoiceValue.ToString();
                //ClientScript.RegisterStartupScript(this.GetType(), "script234", "alert('test');", true);
                //string script = "OnRowInserted();";
                //ScriptManager.RegisterStartupScript(this, GetType(), "OnRowInsertedScript", script, true);

                e.Cancel = true;
            }
            else
            {
 
                // Get PaymentCode Start

                con.Open();
                string sqlQry1 = " select Right('0000000000'+cast(Right('0000000000'+cast(PaymentCode as varchar),10)   as varchar),10) as 'PaymentCode'  from keygeneration  ";
                SqlCommand cmd1 = new SqlCommand(sqlQry1, con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read())
                {
                    hdnPaymentCode.Value = dr1["PaymentCode"].ToString();
                }

                con.Close();
                // Get PaymentCode End



                // Insert Paymentinfo Start
                string VarPaymentRefNo = (string)e.NewValues["PaymentRefNo"].ToString();
                string VarPaymentDate = (string)e.NewValues["PaymentDate"].ToString();
                string VarAmount = (string)e.NewValues["Amount"].ToString();
                string VarRemark = (string)e.NewValues["Remark"].ToString();



                int ConvertedAmount = Int32.Parse(VarAmount);


                string StrSQL = "";
                con.Open();


                StrSQL = " Insert into PaymentInfo (PaymentCode,ReferenceNo,PaymentRefNo,PaymentDate,Amount,Type,Remark,CreatedBy,CreatedDate)   ";
                StrSQL += " values('" + hdnPaymentCode.Value + "','" + hdnTrackNo.Value + "','" + VarPaymentRefNo + "','" + VarPaymentDate + "'," + ConvertedAmount + ",'" + RowType + "','" + VarRemark + "',  ";
                StrSQL += " '" + Session["username"].ToString() + "',GetDate() )";
                if (con.State == ConnectionState.Open)
                {
                    SqlCommand SqlCommand = new SqlCommand(StrSQL, con);
                    SqlCommand.ExecuteNonQuery();
                    // this cancels the edit which we don’t need coz the are handling the edit  
                    e.Cancel = true;
                    ASPxGridView2.CancelEdit();
                    ASPxGridView2.DataBind();
                    //fillPaymentdata();

                }



                string StrSQLM = "";
                StrSQLM = "  Update OPSTracker SET Payment_Update=1  where  OPSReferenceNo='" + hdnTrackNo.Value + "'";
                if (con.State == ConnectionState.Open)
                {
                    SqlCommand SqlCommandM = new SqlCommand(StrSQLM, con);
                    SqlCommandM.ExecuteNonQuery();

                }


                string StrSQLK2 = "";
                StrSQLK2 = "  Update KeyGeneration SET PaymentCode=PaymentCode+1  ";
                if (con.State == ConnectionState.Open)
                {
                    SqlCommand SqlCommandK2 = new SqlCommand(StrSQLK2, con);
                    SqlCommandK2.ExecuteNonQuery();
                    fillPaymentdata();
                }

                con.Close();




              
            }



            }

            catch (NullReferenceException ex)
            {
                // Handle the exception
                e.Cancel = true;
            }


        }

        protected void ASPxGridView2_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            try
            { 
            
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strCon"]);

            int varInvoiceValue = 0;
            con.Open();
            string sqlV = "select InvoiceValue from Invoiceinfo where ReferenceNo='" + hdnTrackNo.Value + "' ";
            SqlCommand cmdV = new SqlCommand(sqlV, con);
            SqlDataReader drV = cmdV.ExecuteReader();
            if (drV.Read())
            {
                varInvoiceValue = Convert.ToInt32(drV["InvoiceValue"]);
            }
            drV.Close();
            cmdV.Cancel();
            con.Close();


            int varPayValue = 0;
            string SqlQueryPED = " select Amount from PaymentInfo where ReferenceNo = '" + hdnTrackNo.Value + "' ";
            con.Open();
            SqlCommand cmdPED = new SqlCommand(SqlQueryPED, con);
            SqlDataReader drP = cmdPED.ExecuteReader();

            while (drP.Read())
            {
                varPayValue += Convert.ToInt32(drP["Amount"]);
            }
            con.Close();




            string MPayVal = (string)e.NewValues["PaymentCode"].ToString(); 


            int varMPayValue = 0;
            string SqlQueryMPED = " select Amount from PaymentInfo where PaymentCode = " + MPayVal + " ";
            con.Open();
            SqlCommand cmdMPED = new SqlCommand(SqlQueryMPED, con);
            SqlDataReader drMP = cmdMPED.ExecuteReader();

            while (drMP.Read())
            {
                varMPayValue = Convert.ToInt32(drMP["Amount"]);
            }
            con.Close();



            int FPayValue = varPayValue + ( Convert.ToInt32(e.NewValues["Amount"]) - varMPayValue );

             
            //------- Validation
            if (varInvoiceValue < FPayValue)
            {
                //hdnValidationError.Value = "Payment Amout Wrong";
                //hdnInvoiceValue.Value = varInvoiceValue.ToString();
                //ClientScript.RegisterStartupScript(this.GetType(), "script234", "alert('test');", true);
                //string script = "OnRowInserted();";
                //ScriptManager.RegisterStartupScript(this, GetType(), "OnRowInsertedScript", script, true);

                e.Cancel = true;
            }
            else
            {




                string VarPaymentRefNo = (string)e.NewValues["PaymentRefNo"].ToString();
                string VarPaymentDate = (string)e.NewValues["PaymentDate"].ToString();
                string VarAmount = (string)e.NewValues["Amount"].ToString();
                string VarRemark = (string)e.NewValues["Remark"].ToString();
                string VarPaymentCode = (string)e.NewValues["PaymentCode"].ToString();





                int ConvertedAmount = 0;

                if (VarAmount != "")
                {
                    ConvertedAmount = Int32.Parse(VarAmount);
                }



                string StrSQL = "";
                con.Open();

                StrSQL = " update PaymentInfo set PaymentRefNo = '" + VarPaymentRefNo.ToString() + "',PaymentDate='" + VarPaymentDate + "',Amount=" + ConvertedAmount + ",Remark='" + VarRemark + "', ";
                StrSQL += " ModifiedBy='" + Session["username"].ToString() + "',ModifiedDate=GetDate() ";
                StrSQL += " WHERE PaymentCode = '" + VarPaymentCode + "'  ";
                if (con.State == ConnectionState.Open)
                {
                    SqlCommand SqlCommand = new SqlCommand(StrSQL, con);
                    int rowcount = SqlCommand.ExecuteNonQuery();
                    if (rowcount > 0)
                    {
                        // this cancels the edit which we don’t need coz the are handling the edit  
                        e.Cancel = true;
                        ASPxGridView2.CancelEdit();
                        ASPxGridView2.DataBind();
                        fillPaymentdata();
                    }
                }

                con.Close();




            }




            // Hide New Button
            if (varInvoiceValue == FPayValue)
            {
                GridViewCommandColumn CommendColumn2 = (GridViewCommandColumn)ASPxGridView2.Columns["CommendColumn2"];
                if (CommendColumn2 != null)
                {
                    CommendColumn2.ShowNewButtonInHeader = false;
                    // Call Clind Side -- For Reload Page
                    ASPxGridView2.JSProperties["cpReloadPage"] = true;
                }

            }
            else if (varInvoiceValue < FPayValue)
            {
                
                ASPxGridView2.JSProperties["cpReloadPage"] = false;
                e.Cancel = true;
            }
            else
            {
                GridViewCommandColumn CommendColumn2 = (GridViewCommandColumn)ASPxGridView2.Columns["CommendColumn2"];
                if (CommendColumn2 != null)
                {
                    CommendColumn2.ShowNewButtonInHeader = true;
                    // Call Clind Side -- For Reload Page
                    ASPxGridView2.JSProperties["cpReloadPage"] = true;
                }
            }



            }

            catch (NullReferenceException ex)
            {
                // Handle the exception
                e.Cancel = true;
            }

        }


        protected void grdsearch_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            if (e.NewValues["POValue"] != null)
            {
                int result;
                if (!int.TryParse(e.NewValues["POValue"].ToString(), out result))
                {
                    e.Errors[ASPxGridView1.Columns["POValue"]] = "Only numeric values are allowed.";
                }
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strCon"]);


            int VarCBProcessComplete = 0;

            if (CBProcessComplete.Checked == true)
            {
                VarCBProcessComplete = 1;

                con.Open();
                string FLSQL = " Update OPSTracker set Process_Completed=" + VarCBProcessComplete + " where OPSReferenceNo = '" + hdnTrackNo.Value + "'  ";
                SqlCommand cmdFL = new SqlCommand(FLSQL, con);
                cmdFL.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                VarCBProcessComplete = 0;

                con.Open();
                string FLSQL = " Update OPSTracker set Process_Completed=Null where OPSReferenceNo = '" + hdnTrackNo.Value + "'  ";
                SqlCommand cmdFL = new SqlCommand(FLSQL, con);
                cmdFL.ExecuteNonQuery();
                con.Close();
            }




            //Attachment 1 Save

            con.Open();
            if (FileAttach1.HasFile)
            {
                string imgName = Path.GetFileName(FileAttach1.PostedFile.FileName);
                
                string dy = DateTime.Now.Day.ToString();
                string mon = DateTime.Now.Month.ToString();
                string yr = DateTime.Now.Year.ToString();
                string hr = DateTime.Now.TimeOfDay.Hours.ToString();
                string min = DateTime.Now.TimeOfDay.Minutes.ToString();
                string sec = DateTime.Now.TimeOfDay.Milliseconds.ToString();
                string con1 = dy + mon + yr + hr + min + sec;
                string ext = System.IO.Path.GetExtension(this.FileAttach1.PostedFile.FileName);
                string strdate = con1 + ext;

                string imgPath = "Net/Attach/" + strdate;//imgName;
                long size_img = FileAttach1.PostedFile.InputStream.Length;
                FileAttach1.SaveAs(Server.MapPath("Net/Attach/" + strdate));//imgName

                if (RowType == "Opportunity")
                {

                    SqlCommand cmd = new SqlCommand("insert into Attachment(AttachCode,filepath,Size,SentDate,TrackNo,clientfile,CreatedBy) select AttachCode,'" + imgPath.ToString() + "'," + size_img.ToString() + ",'" + DateTime.Now + "','" + Request.QueryString["TrackNo"].ToString().Trim() + "','" + imgName.ToString() + "','" + Session["uname"] + "'  from keygeneration;update keygeneration set AttachCode=AttachCode+1", con);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                else
                {

                    SqlCommand cmd = new SqlCommand("insert into Attachment(AttachCode,Comments,filepath,Size,SentDate,QuotationNo,clientfile,CreatedBy) select AttachCode,'" + imgPath.ToString() + "'," + size_img.ToString() + ",'" + DateTime.Now + "','" + Request.QueryString["TrackNo"].ToString().Trim() + "','" + imgName.ToString() + "','" + Session["uname"] + "'  from keygeneration;update keygeneration set AttachCode=AttachCode+1", con);
                    cmd.ExecuteNonQuery();
                }

            }
            con.Close();


            //Attachment 2 Save
            con.Open();
            if (FileAttach2.HasFile)
            {
                string imgName = Path.GetFileName(FileAttach2.PostedFile.FileName);

                string dy = DateTime.Now.Day.ToString();
                string mon = DateTime.Now.Month.ToString();
                string yr = DateTime.Now.Year.ToString();
                string hr = DateTime.Now.TimeOfDay.Hours.ToString();
                string min = DateTime.Now.TimeOfDay.Minutes.ToString();
                string sec = DateTime.Now.TimeOfDay.Milliseconds.ToString();
                string con1 = dy + mon + yr + hr + min + sec;
                string ext = System.IO.Path.GetExtension(this.FileAttach2.PostedFile.FileName);
                string strdate = con1 + ext;

                string imgPath = "Net/Attach/" + strdate;//imgName;
                long size_img = FileAttach2.PostedFile.InputStream.Length;
                FileAttach2.SaveAs(Server.MapPath("Net/Attach/" + strdate));//imgName

                if (RowType == "Opportunity")
                {

                    SqlCommand cmd = new SqlCommand("insert into Attachment(AttachCode,filepath,Size,SentDate,TrackNo,clientfile,CreatedBy) select AttachCode,'" + imgPath.ToString() + "'," + size_img.ToString() + ",'" + DateTime.Now + "','" + Request.QueryString["TrackNo"].ToString().Trim() + "','" + imgName.ToString() + "','" + Session["uname"] + "'  from keygeneration;update keygeneration set AttachCode=AttachCode+1", con);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                else
                {

                    SqlCommand cmd = new SqlCommand("insert into Attachment(AttachCode,Comments,filepath,Size,SentDate,QuotationNo,clientfile,CreatedBy) select AttachCode,'" + imgPath.ToString() + "'," + size_img.ToString() + ",'" + DateTime.Now + "','" + Request.QueryString["TrackNo"].ToString().Trim() + "','" + imgName.ToString() + "','" + Session["uname"] + "'  from keygeneration;update keygeneration set AttachCode=AttachCode+1", con);
                    cmd.ExecuteNonQuery();
                }

            }
            con.Close();


            //Attachment 2 Save
            con.Open();
            if (FileAttach3.HasFile)
            {
                string imgName = Path.GetFileName(FileAttach3.PostedFile.FileName);

                string dy = DateTime.Now.Day.ToString();
                string mon = DateTime.Now.Month.ToString();
                string yr = DateTime.Now.Year.ToString();
                string hr = DateTime.Now.TimeOfDay.Hours.ToString();
                string min = DateTime.Now.TimeOfDay.Minutes.ToString();
                string sec = DateTime.Now.TimeOfDay.Milliseconds.ToString();
                string con1 = dy + mon + yr + hr + min + sec;
                string ext = System.IO.Path.GetExtension(this.FileAttach3.PostedFile.FileName);
                string strdate = con1 + ext;

                string imgPath = "Net/Attach/" + strdate;//imgName;
                long size_img = FileAttach3.PostedFile.InputStream.Length;
                FileAttach3.SaveAs(Server.MapPath("Net/Attach/" + strdate));//imgName

                if (RowType == "Opportunity")
                {

                    SqlCommand cmd = new SqlCommand("insert into Attachment(AttachCode,filepath,Size,SentDate,TrackNo,clientfile,CreatedBy) select AttachCode,'" + imgPath.ToString() + "'," + size_img.ToString() + ",'" + DateTime.Now + "','" + Request.QueryString["TrackNo"].ToString().Trim() + "','" + imgName.ToString() + "','" + Session["uname"] + "'  from keygeneration;update keygeneration set AttachCode=AttachCode+1", con);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                else
                {

                    SqlCommand cmd = new SqlCommand("insert into Attachment(AttachCode,Comments,filepath,Size,SentDate,QuotationNo,clientfile,CreatedBy) select AttachCode,'" + imgPath.ToString() + "'," + size_img.ToString() + ",'" + DateTime.Now + "','" + Request.QueryString["TrackNo"].ToString().Trim() + "','" + imgName.ToString() + "','" + Session["uname"] + "'  from keygeneration;update keygeneration set AttachCode=AttachCode+1", con);
                    cmd.ExecuteNonQuery();
                }

            }
            con.Close();


            Page.RegisterClientScriptBlock("SrSave", "<script type='text/javascript'>FunClose('Saved Successfully');</script>");


        }



        //--------------------------------------------- Payment info




        //protected void grdsearch_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        //{

        //    //string qno = (string)e.Values["Qno"].ToString();
        //    //hdnDQNO.Value = qno;

        //    //string Productpartno = (string)e.Values["ProductPartNo"].ToString();
        //    //hdnDProductpartno.Value = Productpartno;


        //    //string StrSQL = "";
        //    //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strCon"]);
        //    //con.Open();

        //    //StrSQL = " Delete QuoteProductPartNo WHERE Qno = '" + hdnDQNO.Value + "' and ProductPartNo = '" + hdnDProductpartno.Value + "'  ";
        //    //if (con.State == ConnectionState.Open)
        //    //{
        //    //    SqlCommand SqlCommand = new SqlCommand(StrSQL, con);
        //    //    int rowcount = SqlCommand.ExecuteNonQuery();
        //    //    if (rowcount > 0)
        //    //    {
        //    //        // this cancels the edit which we don’t need coz the are handling the edit  
        //    //        e.Cancel = true;
        //    //        grdsearch.CancelEdit();
        //    //        grdsearch.DataBind();
        //    //        filldata();
        //    //    }
        //    //}
        //    //con.Close();
        //}






    }
}