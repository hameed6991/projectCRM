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
    public partial class InstallFollowUp : System.Web.UI.Page
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
                Response.Redirect("apalogin.aspx");
            }


            hdnInstallCode.Value = Request.QueryString["InstallCode"];
            //hdnFrom.Value = Request.QueryString["From"];

            if (!IsPostBack)
            {

                FillDada();
                DropDownBind();
            }

           
        }



        protected void DropDownBind()
        {


            string strSql = "";
            con.Open();

            strSql = " select Name from DropDownMast where [key] ='InstallationFollow-Up' order by Name asc ";

            SqlDataAdapter da = new SqlDataAdapter(strSql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DDActivityType.DataSource = dt;
            DDActivityType.DataTextField = "Name";
            DDActivityType.DataValueField = "Name";
            DDActivityType.DataBind();
            //DDCustomerType.DataValueField = "Name";
            DDActivityType.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();





            string strSql1 = "";
            con.Open();
            strSql1 = " select Name from DropDownMast where [key] ='InstallationSub-Status' order by Name asc ";

            SqlDataAdapter da1 = new SqlDataAdapter(strSql1, con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            DDSubStatus.DataSource = dt1;
            DDSubStatus.DataTextField = "Name";
            DDSubStatus.DataValueField = "Name";
            DDSubStatus.DataBind();
            DDSubStatus.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();



        }



        protected void FillDada()
        {


            con.Open();
            string selectSQL = @"  select ModleNo,ProdDesc,SerialNo,SalesOrderNo,SalesOrderDate,PONo,PODate,Invoice,InvoiceDate,Purchase.PScode,DistanseFromServiceLocation,Comments
                                   from Purchase  inner join ProdMast on Purchase.ProdCode=ProdMast.ProdCode where InstallCode='" + hdnInstallCode.Value + "' ";


            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader = cmd.ExecuteReader(); ;
            while (reader.Read())
            {
                //Install Info
                txtModelNo.Value = reader["ModleNo"].ToString();
                txtProductDec.Value = reader["ProdDesc"].ToString();
                txtSerialNo.Value = reader["SerialNo"].ToString();
                txtSalesOrder.Value = reader["SalesOrderNo"].ToString();
                txtSalesOrderDate.Value = reader["SalesOrderDate"].ToString();
                txtPN.Value = reader["PONo"].ToString();
                txtPDate.Value = reader["PODate"].ToString();
                txtInvoiceNo.Value = reader["Invoice"].ToString();
                txtInvoicDate.Value = reader["InvoiceDate"].ToString();
                txtPrincipal.Value = reader["PSCode"].ToString();
                txtDistentService.Value = reader["DistanseFromServiceLocation"].ToString();
                txtComments.Value = reader["Comments"].ToString();
            }
            reader.Close();
            reader.Dispose();

            cmd.Dispose();
            con.Close();



        }

        protected void btnsubmitIns_Click(object sender, EventArgs e)
        {



            //------------------------------------------------------------- Add Follow Up Details



            //string ReturnValue = string.Empty, strReturnValue = string.Empty, Geolocation = string.Empty, InstallCode = string.Empty, Alert = string.Empty; string serialNo = ""; string OutSerialNo = "";

            //try
            //{

            //    SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");

            //    if (con.State != ConnectionState.Open)
            //        con.Open();
            //    SqlCommand scmd = new SqlCommand("SP_Installation_Insert", con);
            //    scmd.Connection = con;
            //    scmd.CommandTimeout = 0;

            //    scmd.CommandType = CommandType.StoredProcedure;


            //    scmd.Parameters.Add(new SqlParameter("@SerialNo", SqlDbType.VarChar, 50, "TicketNo"));
            //    scmd.Parameters.Add(new SqlParameter("@ProdCode", SqlDbType.Char, 10, "ProdCode"));
            //    scmd.Parameters.Add(new SqlParameter("@AccCode", SqlDbType.VarChar, 10, "AccCode"));
            //    scmd.Parameters.Add(new SqlParameter("@SalesOrderNo", SqlDbType.VarChar, 30, "SalesOrderNo"));
            //    scmd.Parameters.Add(new SqlParameter("@SalesOrderDate", SqlDbType.DateTime, 50, "SalesOrderDate"));
            //    scmd.Parameters.Add(new SqlParameter("@PONo", SqlDbType.VarChar, 50, "PONo"));
            //    scmd.Parameters.Add(new SqlParameter("@PODate", SqlDbType.DateTime, 30, "PODate"));
            //    scmd.Parameters.Add(new SqlParameter("@Invoice", SqlDbType.VarChar, 50, "Invoice"));
            //    scmd.Parameters.Add(new SqlParameter("@InvoiceDate", SqlDbType.DateTime, 30, "InvoiceDate"));
            //    scmd.Parameters.Add(new SqlParameter("@PSCode", SqlDbType.VarChar, 10, "PSCode"));
            //    scmd.Parameters.Add(new SqlParameter("@DistanseFromServiceLocation", SqlDbType.VarChar, 13, "DistanseFromServiceLocation"));
            //    scmd.Parameters.Add(new SqlParameter("@Comments", SqlDbType.VarChar, 255, "Comments"));



            //    scmd.Parameters.Add(new SqlParameter("@InstallCode", SqlDbType.VarChar, 30, "InstallCode"));
            //    scmd.Parameters.Add(new SqlParameter("@InstallDate", SqlDbType.DateTime, 50, "InstallDate"));
            //    scmd.Parameters.Add(new SqlParameter("@InstallCallDate", SqlDbType.DateTime, 50, "InstallCallDate"));
            //    scmd.Parameters.Add(new SqlParameter("@WarrantyType", SqlDbType.VarChar, 50, "WarrantyType"));
            //    scmd.Parameters.Add(new SqlParameter("@WAR_Type", SqlDbType.VarChar, 50, "WAR_Type"));
            //    scmd.Parameters.Add(new SqlParameter("@WarrStartDate", SqlDbType.DateTime, 50, "WarrStartDate"));
            //    scmd.Parameters.Add(new SqlParameter("@WarrEndDate", SqlDbType.DateTime, 50, "WarrEndDate"));


            //    scmd.Parameters.Add(new SqlParameter("@ContCode", SqlDbType.VarChar, 10, "ContCode"));
            //    scmd.Parameters.Add(new SqlParameter("@EngCode", SqlDbType.VarChar, 50, "engcode"));
            //    scmd.Parameters.Add(new SqlParameter("@EngCode2", SqlDbType.VarChar, 50, "engcode2"));
            //    scmd.Parameters.Add(new SqlParameter("@SubStatus", SqlDbType.VarChar, 50, "SubStatus"));
            //    scmd.Parameters.Add(new SqlParameter("@Status", SqlDbType.VarChar, 10, "Status"));
            //    scmd.Parameters.Add(new SqlParameter("@CreatedBy", SqlDbType.VarChar, 50, "CreatedBy"));
            //    scmd.Parameters.Add(new SqlParameter("@DispatchRefNo", SqlDbType.VarChar, 50, "DispatchRefNo"));
            //    scmd.Parameters.Add(new SqlParameter("@Module", SqlDbType.VarChar, 30, "Module"));

                 

            //    if (txtSerialNo.Value == "Auto")
            //    {
            //        scmd.Parameters["@SerialNo"].Value = "";
            //    }
            //    else
            //    {
            //        scmd.Parameters["@SerialNo"].Value = Convert.ToString(txtSerialNo.Value);
            //    }


            //    scmd.Parameters["@ProdCode"].Value = Convert.ToString(DDProduct.SelectedValue);
            //    scmd.Parameters["@InstallCode"].Value = "";
            //    scmd.Parameters["@AccCode"].Value = Convert.ToString(DDAccount.Text);
            //    scmd.Parameters["@SalesOrderNo"].Value = Convert.ToString(txtSalesOrder.Value);

            //    if (txtSODate.Value != "")
            //    {
            //        //strSalesOrderDate = datecnv.ConvertDateTime(txtSODate.Value, true);
            //        //strSalesOrderDate = Convert.ToDateTime(strSalesOrderDate).ToString("MMM dd, yyyy HH:mm");
            //        //scmd.Parameters["@SalesOrderDate"].Value = strSalesOrderDate;

            //        scmd.Parameters["@SalesOrderDate"].Value = txtSODate.Value;

            //    }
            //    else
            //    {
            //        scmd.Parameters["@SalesOrderDate"].Value = DBNull.Value;
            //    }

            //    scmd.Parameters["@PONo"].Value = Convert.ToString(txtPo.Value);

            //    if (txtPODate.Value != "")
            //    {

            //        //strPODate = datecnv.ConvertDateTime(txtPuchaseOrderDate.Value, true);
            //        //strPODate = Convert.ToDateTime(strPODate).ToString("MMM dd, yyyy HH:mm");
            //        //scmd.Parameters["@PODate"].Value = strPODate;

            //        scmd.Parameters["@PODate"].Value = txtPODate.Value;

            //    }
            //    else
            //    {
            //        scmd.Parameters["@PODate"].Value = DBNull.Value;
            //    }

            //    scmd.Parameters["@Invoice"].Value = Convert.ToString(txtInvoiceNo.Value);
            //    if (txtInvoiceDate.Value != "")
            //    {

            //        //strInvoicedate = datecnv.ConvertDateTime(txtInvoiceDate.Value, true);
            //        //strInvoicedate = Convert.ToDateTime(strInvoicedate).ToString("MMM dd, yyyy HH:mm");
            //        //scmd.Parameters["@InvoiceDate"].Value = strInvoicedate;

            //        scmd.Parameters["@InvoiceDate"].Value = txtInvoiceDate.Value;
            //    }
            //    else
            //    {
            //        scmd.Parameters["@InvoiceDate"].Value = DBNull.Value;
            //    }

            //    //string commands = Utility.FnCheckStringRemove(txtComments.Value);
            //    //scmd.Parameters["@Comments"].Value = commands;

            //    scmd.Parameters["@Comments"].Value = txtComments.Value;
            //    scmd.Parameters["@PSCode"].Value = Convert.ToString(txtPrincipal.Value);
            //    scmd.Parameters["@DistanseFromServiceLocation"].Value = Convert.ToString(txtDistentService.Value);


            //    if (txtInstallDsate.Value != "")
            //    {

            //        //strInstalldate = datecnv.ConvertDateTime(txtInstallDate.Value, true);
            //        //strInstalldate = Convert.ToDateTime(strInstalldate).ToString("MMM dd, yyyy HH:mm");
            //        //scmd.Parameters["@InstallDate"].Value = strInstalldate;

            //        scmd.Parameters["@InstallDate"].Value = txtInstallDsate.Value;
            //    }
            //    else
            //    {
            //        scmd.Parameters["@InstallDate"].Value = DBNull.Value;
            //    }

            //    scmd.Parameters["@InstallCallDate"].Value = DBNull.Value;


            //    scmd.Parameters["@WarrantyType"].Value = "Standerd";
            //    scmd.Parameters["@WAR_Type"].Value = DBNull.Value;


            //    if (txtWSD.Value != "")
            //    {
            //        //strWarrStartDate = datecnv.ConvertDateTime(txtWarrantyStart.Value, true);
            //        //strWarrStartDate = Convert.ToDateTime(strWarrStartDate).ToString("MMM dd, yyyy HH:mm");
            //        //scmd.Parameters["@WarrStartDate"].Value = strWarrStartDate;

            //        scmd.Parameters["@WarrStartDate"].Value = DBNull.Value;

            //    }
            //    else
            //    {
            //        scmd.Parameters["@WarrStartDate"].Value = DBNull.Value;
            //    }

            //    if (txtWED.Value != "")
            //    {

            //        //strwarrEndDate = datecnv.ConvertDateTime(txtWarrantyEnd.Value, true);
            //        //strwarrEndDate = Convert.ToDateTime(strwarrEndDate).ToString("MMM dd, yyyy HH:mm");
            //        //scmd.Parameters["@WarrEndDate"].Value = strwarrEndDate;

            //        scmd.Parameters["@WarrEndDate"].Value = txtWED.Value;
            //    }
            //    else
            //    {
            //        scmd.Parameters["@WarrEndDate"].Value = DBNull.Value;
            //    }



            //    scmd.Parameters["@ContCode"].Value = Convert.ToString(hdnContcode.Value);
            //    scmd.Parameters["@EngCode"].Value = Convert.ToString(DDEngineer1.SelectedItem.Value);
            //    scmd.Parameters["@EngCode2"].Value = Convert.ToString(DDEngineer2.SelectedItem.Value);
            //    scmd.Parameters["@SubStatus"].Value = Convert.ToString(DDSubStatus.SelectedItem.Value);
            //    scmd.Parameters["@Status"].Value = "Open";

            //    scmd.Parameters["@CreatedBy"].Value = Convert.ToString(Session["s_student_name"]);



            //    scmd.Parameters["@DispatchRefNo"].Value = DBNull.Value;
            //    scmd.Parameters["@Module"].Value = "Insert";


            //    //scmd.UpdatedRowSource = UpdateRowSource.OutputParameters;


            //    //strReturnValue = Convert.ToString(scmd.Parameters["@Message"].Value);

            //    //OutSerialNo = Convert.ToString(scmd.Parameters["@OutSerialNo"].Value);

            //    InstallCode = strReturnValue.Replace("Successful | ", "");


            //    scmd.ExecuteNonQuery();
            //    scmd.Dispose();



 

            //    // Install Key Update
            //    string KQry = " ";
            //    KQry += " Update keygeneration Set  InstallCode=InstallCode+1 ";

            //    scmd = new SqlCommand(KQry, con);
            //    scmd.ExecuteNonQuery();
            //    scmd.Dispose();


                 
            //    if (con.State != ConnectionState.Closed)
            //        con.Close();
            //}
            //catch (Exception ex)
            //{

            //    //ReturnValue = ex.Message.Replace("'", " ");
            //    if (con.State != ConnectionState.Closed)
            //        con.Close();
            //}


            //Page.RegisterClientScriptBlock("", "<script>Closefun('" + OutSerialNo + "');</script>");




        }




    }
}