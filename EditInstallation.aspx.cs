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
    public partial class EditInstallation : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");


        protected void Page_Init(object sender, EventArgs e)
        {
            //FillDada();
        }


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
             

            hdnFrom.Value = Request.QueryString["From"];
            hdnInstallCode.Value = Request.QueryString["InstallCode"];



            if (!IsPostBack)
            {

                DropDownBind();
                FillDada();
                FillWarrantyDeatils();
            }
            
            


        }



        protected void DropDownBind()
        {
            //Response.Write("DropDownBind" + "..." + hdnAccCode.Value);



            string SqlProd = "";
            con.Open();

            SqlProd = " select prodcode as [ID], product as [Name] from prodmast order by Name asc ";

            SqlDataAdapter daprod = new SqlDataAdapter(SqlProd, con);
            DataTable dtprod = new DataTable();
            daprod.Fill(dtprod);
            DDProduct.DataSource = dtprod;
            DDProduct.DataTextField = "Name";
            DDProduct.DataValueField = "ID";
            DDProduct.DataBind();
            //DDProduct.DataValueField = "Name";
            DDProduct.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();




            string strSql = "";
            con.Open();

            strSql = " select Name from DropDownMast where [key] ='Field_Update' order by Name asc ";

            SqlDataAdapter da = new SqlDataAdapter(strSql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DDFieldUpdate.DataSource = dt;
            DDFieldUpdate.DataTextField = "Name";
            DDFieldUpdate.DataValueField = "Name";
            DDFieldUpdate.DataBind();
            //DDFieldUpdate.DataValueField = "Name";
            DDFieldUpdate.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();




            string strSql1 = "";
            con.Open();

            strSql1 = " select Name from DropDownMast where [key] ='' order by Name asc ";

            SqlDataAdapter da1 = new SqlDataAdapter(strSql1, con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            DDSoftware.DataSource = dt1;
            DDSoftware.DataTextField = "Name";
            DDSoftware.DataValueField = "Name";
            DDSoftware.DataBind();
            //DDSoftware.DataValueField = "Name";
            DDSoftware.Items.Insert(0, new ListItem("None", ""));

            con.Close();



            con.Open();
            string strSql2 = " select Name from DropDownMast where [key] ='Ins_Warranty_Type' order by Name asc ";

            SqlDataAdapter da2 = new SqlDataAdapter(strSql2, con);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            DDWarrantyType.DataSource = dt2;
            DDWarrantyType.DataTextField = "Name";
            DDWarrantyType.DataValueField = "Name";
            DDWarrantyType.DataBind();
            //DDWarrantyType.DataValueField = "Name";
            DDWarrantyType.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();



            con.Open();
            string strSql3 = " select EngineerCode as [ID], EngineerName as [Name] from EngineerMaster ";

            SqlDataAdapter da3 = new SqlDataAdapter(strSql3, con);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);
            DDEngineer1.DataSource = dt3;
            DDEngineer1.DataTextField = "Name";
            DDEngineer1.DataValueField = "ID";
            DDEngineer1.DataBind();
            //DDEngineer1.DataValueField = "Name";
            DDEngineer1.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();


            con.Open();
            string strSql4 = " select EngineerCode as [ID], EngineerName as [Name] from EngineerMaster ";

            SqlDataAdapter da4 = new SqlDataAdapter(strSql4, con);
            DataTable dt4 = new DataTable();
            da4.Fill(dt4);
            DDEngineer2.DataSource = dt4;
            DDEngineer2.DataTextField = "Name";
            DDEngineer2.DataValueField = "ID";
            DDEngineer2.DataBind();
            //DDEngineer2.DataValueField = "Name";
            DDEngineer2.Items.Insert(0, new ListItem("None", ""));

            con.Close();


            con.Open();
            string strSql5 = " select Name from DropDownMast where [key] ='Ins_Sub_Status' order by Name asc ";

            SqlDataAdapter da5 = new SqlDataAdapter(strSql5, con);
            DataTable dt5 = new DataTable();
            da5.Fill(dt5);
            DDSubStatus.DataSource = dt5;
            DDSubStatus.DataTextField = "Name";
            DDSubStatus.DataValueField = "Name";
            DDSubStatus.DataBind();
            //DDSubStatus.DataValueField = "Name";
            DDSubStatus.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();



            con.Open();
            string strSql6 = " select ContCode as [ID], Name from ContMast where AccCode='" + hdnAccCode.Value + "' ";
            SqlDataAdapter da6 = new SqlDataAdapter(strSql6, con);
            DataTable dt6 = new DataTable();
            da6.Fill(dt6);
            DDContact.DataSource = dt6;
            DDContact.DataTextField = "Name";
            DDContact.DataValueField = "ID";
            DDContact.DataBind();
            //DDContact.DataValueField = "Name";
            DDContact.Items.Insert(0, new ListItem("<-Select->", ""));
            con.Close();



            con.Open();
            string strSql7 = " select Name from DropDownMast where [key] ='State' order by Name asc ";

            SqlDataAdapter da7 = new SqlDataAdapter(strSql7, con);
            DataTable dt7 = new DataTable();
            da7.Fill(dt7);
            DDState.DataSource = dt7;
            DDState.DataTextField = "Name";
            DDState.DataValueField = "Name";
            DDState.DataBind();
            //DDState.DataValueField = "Name";
            DDState.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();



            con.Open();
            string strSql8 = " select Acccode as [ID], Account as [Name] from Accmast  Order by Account asc ";

            SqlDataAdapter da8 = new SqlDataAdapter(strSql8, con);
            DataTable dt8 = new DataTable();
            da8.Fill(dt8);
            DDAccount.DataSource = dt8;
            DDAccount.DataTextField = "Name";
            DDAccount.DataValueField = "ID";
            DDAccount.DataBind();
            DDAccount.Items.Insert(0, new ListItem("None", ""));

            con.Close();


        }


        public static string ConvertDateTime(string dtVal, bool flag)
        {
            string dtNew = string.Empty;
            if (dtVal != "" && dtVal != null)
            {
                string[] tempArr = dtVal.Split(' ');
                string[] dtPart = tempArr[0].Split('/');
                if (flag)
                {
                    if (tempArr.Length > 1)
                    {
                        if (tempArr.Length > 2)
                        {
                            dtNew = dtPart[1] + "/" + dtPart[0] + "/" + dtPart[2] + " " + tempArr[1] + " " + tempArr[2];
                        }
                        else
                        {
                            dtNew = dtPart[1] + "/" + dtPart[0] + "/" + dtPart[2] + " " + tempArr[1];
                        }
                    }
                    else
                    {
                        dtNew = dtPart[1] + "/" + dtPart[0] + "/" + dtPart[2] + " 00:00";
                    }
                }
                else
                {
                    dtNew = dtPart[1] + "/" + dtPart[0] + "/" + dtPart[2] + " 00:00";
                }
                return dtNew;
            }
            else
            {
                return dtNew;
            }
        }



        protected void FillDada()
        {

            con.Open();
            string selectSQL = @"  select Purchase.InstallCode,SerialNo,PM.Prodcode,PM.Product,PM.ProdDesc,SalesOrderNo,convert(varchar(20),SalesOrderDate,103) as [SalesOrderDate],WAR_Type,PONo,convert(varchar(20),PODate,103) as [PODate],
                                    Application,Invoice,convert(varchar(20),InvoiceDate,103) as [InvoiceDate],Purchase.PScode,DistanseFromServiceLocation,Purchase.Comments,
                                    convert(varchar(20),InstallDate,103) as [InstallDate],convert(varchar(20),IWD.WarStart,103) as [WarStart],convert(varchar(20),IWD.WarEnd,103) as [WarEnd],IWD.WarrantyType,IWD.Month,IWD.NoOfVisit,
                                    Purchase.Acccode,AM.Account,AM.Industry,AM.Address,AM.Site,AM.City,AM.State,AM.Pincode,
                                    CM.ContCode,CM.Name,CM.MobileNo,CM.Department,
                                    Substatus,EngCode,EngCode2
                                    from Purchase 
                                    inner join ProdMast PM ON Purchase.ProdCode=PM.ProdCode
                                    inner join Install_WarrantyDetails IWD ON Purchase.InstallCode=IWD.InstallCode
                                    inner join AccMast AM ON Purchase.AccCode=AM.AccCode
                                    inner join ContMast CM ON AM.AccCode=CM.AccCode
                                    where  Purchase.InstallCode='" + hdnInstallCode.Value + "' ";


            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader = cmd.ExecuteReader(); ;
            while (reader.Read())
            {
                //Install Info
                txtSerialNo.Value = reader["SerialNo"].ToString(); 
                DDProduct.SelectedValue = reader["Prodcode"].ToString();
                txtProductDec.Value = reader["ProdDesc"].ToString();
                txtSalesOrder.Value = reader["SalesOrderNo"].ToString();
                txtSODate.Value = reader["SalesOrderDate"].ToString();
                DDFieldUpdate.SelectedValue = "";
                txtPo.Value = reader["PONo"].ToString();
                txtPODate.Value = reader["PODate"].ToString();
                DDSoftware.SelectedValue = reader["Application"].ToString();
                txtInvoiceNo.Value = reader["Invoice"].ToString();
                txtInvoiceDate.Value = reader["InvoiceDate"].ToString();
                //txtTradeUpSID.Value = reader["Contact_Number"].ToString();
                txtPrincipal.Value = reader["PScode"].ToString();
                txtDistentService.Value = reader["DistanseFromServiceLocation"].ToString();
                txtComments.Value = reader["Comments"].ToString();

                //Warranty Info
                txtInstallDsate.Value = reader["InstallDate"].ToString();
                txtWSD.Value = reader["WarStart"].ToString();
                txtWEDa.Value = reader["WarEnd"].ToString();
                DDWarrantyType.SelectedValue = reader["WarrantyType"].ToString();
                txtMonth.Value = reader["Month"].ToString();
                txtNumberOfVisit.Value = reader["NoOfVisit"].ToString();

                //Account Info
                DDAccount.SelectedValue = reader["Acccode"].ToString();
                hdnAccCode.Value = reader["Acccode"].ToString();
                txtIndustry.Value = reader["Industry"].ToString();
                txtAddress.Value = reader["Address"].ToString();
                txtSite.Value = reader["Site"].ToString();
                txtCity.Value = reader["City"].ToString();
                DDState.SelectedValue = reader["State"].ToString();
                txtPinCode.Value = reader["Pincode"].ToString();
                //DDContact.SelectedValue = reader["ContCode"].ToString();
                hdnContcode.Value = reader["ContCode"].ToString();
                txtMobile.Value = reader["MobileNo"].ToString();
                txtDepartment.Value = reader["Department"].ToString();

                //Allocation Info
                DDEngineer1.SelectedValue = reader["EngCode"].ToString();
                DDEngineer2.SelectedValue = reader["EngCode2"].ToString();
                DDSubStatus.SelectedValue = reader["Substatus"].ToString();

                 


            }
            reader.Close();
            reader.Dispose();

            cmd.Dispose();
            con.Close();
        }


        public void FillWarrantyDeatils()
        {

            string stQry = "", strTemp = "";
            int count = 0;
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();

                stQry = " select WarrantyType,Month,NoOfVisit,Convert(varchar(20),WarStart,103) as [WarStart],Convert(varchar(20),WarEnd,103) as [WarEnd] From  Install_WarrantyDetails where installCode= '" + hdnInstallCode.Value + "' ";

                SqlCommand cmd1 = new SqlCommand(stQry, con);
                SqlDataReader dr = cmd1.ExecuteReader();
                while (dr.Read())
                {

                    count++;
                    if (strTemp.Length > 1)
                    {
                        strTemp += "#" + dr["WarrantyType"].ToString() + "~" + dr["Month"].ToString() + "~" + dr["NoOfVisit"].ToString() + "~" + "Update" + "~" + dr["WarStart"].ToString() + "~" + dr["WarEnd"].ToString() + "";
                    }
                    else
                    {
                        strTemp = dr["WarrantyType"].ToString() + "~" + dr["Month"].ToString() + "~" + dr["NoOfVisit"].ToString() + "~" + "Update" + "~" + dr["WarStart"].ToString() + "~" + dr["WarEnd"].ToString() + "";
                    }

                }
                hdnWarrantyInfo.Value = strTemp;

                if (con.State != ConnectionState.Closed)
                    con.Close();

            }

            catch (Exception ex)
            {
                //Response.Write("exception" + ex.Message);
                //Response.End();
            }
            finally
            {
                // con.Close();
            }


        }

   

        protected void btnSaveIns_Click(object sender, EventArgs e)
        {




            //------------------------------------------------------------- Edit Install Details



            string ReturnValue = string.Empty, strReturnValue = string.Empty, Geolocation = string.Empty, InstallCode = string.Empty, Alert = string.Empty;

            try
            {


                string strPODate = "";
                string strSalesOrderDate = "";
                string strInstalldate = "";
                string strInvoicedate = "";
                string strWarrStartDate = "";
                string strwarrEndDate = "";



                SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");

                if (con.State != ConnectionState.Open)
                    con.Open();
                SqlCommand scmd = new SqlCommand("SP_Installation_Insert", con);
                scmd.Connection = con;
                scmd.CommandTimeout = 0;

                scmd.CommandType = CommandType.StoredProcedure;


                scmd.Parameters.Add(new SqlParameter("@SerialNo", SqlDbType.VarChar, 50, "TicketNo"));
                scmd.Parameters.Add(new SqlParameter("@ProdCode", SqlDbType.Char, 10, "ProdCode"));
                scmd.Parameters.Add(new SqlParameter("@AccCode", SqlDbType.VarChar, 10, "AccCode"));
                scmd.Parameters.Add(new SqlParameter("@SalesOrderNo", SqlDbType.VarChar, 30, "SalesOrderNo"));
                scmd.Parameters.Add(new SqlParameter("@SalesOrderDate", SqlDbType.DateTime, 50, "SalesOrderDate"));
                scmd.Parameters.Add(new SqlParameter("@PONo", SqlDbType.VarChar, 50, "PONo"));
                scmd.Parameters.Add(new SqlParameter("@PODate", SqlDbType.DateTime, 30, "PODate"));
                scmd.Parameters.Add(new SqlParameter("@Invoice", SqlDbType.VarChar, 50, "Invoice"));
                scmd.Parameters.Add(new SqlParameter("@InvoiceDate", SqlDbType.DateTime, 30, "InvoiceDate"));
                scmd.Parameters.Add(new SqlParameter("@PSCode", SqlDbType.VarChar, 10, "PSCode"));
                scmd.Parameters.Add(new SqlParameter("@DistanseFromServiceLocation", SqlDbType.VarChar, 13, "DistanseFromServiceLocation"));
                scmd.Parameters.Add(new SqlParameter("@Comments", SqlDbType.VarChar, 255, "Comments"));



                scmd.Parameters.Add(new SqlParameter("@InstallCode", SqlDbType.VarChar, 30, "InstallCode"));
                scmd.Parameters.Add(new SqlParameter("@InstallDate", SqlDbType.DateTime, 50, "InstallDate"));
                scmd.Parameters.Add(new SqlParameter("@InstallCallDate", SqlDbType.DateTime, 50, "InstallCallDate"));
                scmd.Parameters.Add(new SqlParameter("@WarrantyType", SqlDbType.VarChar, 50, "WarrantyType"));
                scmd.Parameters.Add(new SqlParameter("@WAR_Type", SqlDbType.VarChar, 50, "WAR_Type"));
                scmd.Parameters.Add(new SqlParameter("@WarrStartDate", SqlDbType.DateTime, 50, "WarrStartDate"));
                scmd.Parameters.Add(new SqlParameter("@WarrEndDate", SqlDbType.DateTime, 50, "WarrEndDate"));


                scmd.Parameters.Add(new SqlParameter("@ContCode", SqlDbType.VarChar, 10, "ContCode"));
                scmd.Parameters.Add(new SqlParameter("@EngCode", SqlDbType.VarChar, 50, "engcode"));
                scmd.Parameters.Add(new SqlParameter("@EngCode2", SqlDbType.VarChar, 50, "engcode2"));
                scmd.Parameters.Add(new SqlParameter("@SubStatus", SqlDbType.VarChar, 50, "SubStatus"));
                scmd.Parameters.Add(new SqlParameter("@Status", SqlDbType.VarChar, 10, "Status"));
                scmd.Parameters.Add(new SqlParameter("@CreatedBy", SqlDbType.VarChar, 50, "CreatedBy"));
                scmd.Parameters.Add(new SqlParameter("@DispatchRefNo", SqlDbType.VarChar, 50, "DispatchRefNo"));
                scmd.Parameters.Add(new SqlParameter("@Module", SqlDbType.VarChar, 30, "Module"));




                //scmd.Parameters.Add(new SqlParameter("@Message", SqlDbType.VarChar, 250, ParameterDirection.Output, false, 0, 10, "Message", DataRowVersion.Default, null));




                if (txtSerialNo.Value == "Auto")
                {
                    scmd.Parameters["@SerialNo"].Value = "";
                }
                else
                {
                    scmd.Parameters["@SerialNo"].Value = Convert.ToString(txtSerialNo.Value);
                }


                scmd.Parameters["@ProdCode"].Value = Convert.ToString(DDProduct.SelectedValue);
                scmd.Parameters["@InstallCode"].Value = Convert.ToString(hdnInstallCode.Value);
                scmd.Parameters["@AccCode"].Value = Convert.ToString(DDAccount.Text);
                scmd.Parameters["@SalesOrderNo"].Value = Convert.ToString(txtSalesOrder.Value);

                if (txtSODate.Value != "")
                {
                    strSalesOrderDate = ConvertDateTime(txtSODate.Value, true);
                    strSalesOrderDate = Convert.ToDateTime(strSalesOrderDate).ToString("MMM dd, yyyy HH:mm");
                    scmd.Parameters["@SalesOrderDate"].Value = strSalesOrderDate;
                     

                }
                else
                {
                    scmd.Parameters["@SalesOrderDate"].Value = DBNull.Value;
                }

                scmd.Parameters["@PONo"].Value = Convert.ToString(txtPo.Value);

                if (txtPODate.Value != "")
                {

                    strPODate = ConvertDateTime(txtPODate.Value, true);
                    strPODate = Convert.ToDateTime(strPODate).ToString("MMM dd, yyyy HH:mm");
                    scmd.Parameters["@PODate"].Value = strPODate;
                    
                }
                else
                {
                    scmd.Parameters["@PODate"].Value = DBNull.Value;
                }

                scmd.Parameters["@Invoice"].Value = Convert.ToString(txtInvoiceNo.Value);
                if (txtInvoiceDate.Value != "")
                {

                    strInvoicedate = ConvertDateTime(txtInvoiceDate.Value, true);
                    strInvoicedate = Convert.ToDateTime(strInvoicedate).ToString("MMM dd, yyyy HH:mm");
                    scmd.Parameters["@InvoiceDate"].Value = strInvoicedate;
                     
                }
                else
                {
                    scmd.Parameters["@InvoiceDate"].Value = DBNull.Value;
                }

                //string commands = Utility.FnCheckStringRemove(txtComments.Value);
                //scmd.Parameters["@Comments"].Value = commands;

                scmd.Parameters["@Comments"].Value = txtComments.Value;
                scmd.Parameters["@PSCode"].Value = Convert.ToString(txtPrincipal.Value);
                scmd.Parameters["@DistanseFromServiceLocation"].Value = Convert.ToString(txtDistentService.Value);


                if (txtInstallDsate.Value != "")
                {

                    strInstalldate = ConvertDateTime(txtInstallDsate.Value, true);
                    strInstalldate = Convert.ToDateTime(strInstalldate).ToString("MMM dd, yyyy HH:mm");
                    scmd.Parameters["@InstallDate"].Value = strInstalldate;
                     
                }
                else
                {
                    scmd.Parameters["@InstallDate"].Value = DBNull.Value;
                }

                scmd.Parameters["@InstallCallDate"].Value = DBNull.Value;


                scmd.Parameters["@WarrantyType"].Value = "Standerd";
                scmd.Parameters["@WAR_Type"].Value = DBNull.Value;


                if (txtWSD.Value != "")
                {
                    strWarrStartDate = ConvertDateTime(txtWSD.Value, true);
                    strWarrStartDate = Convert.ToDateTime(strWarrStartDate).ToString("MMM dd, yyyy HH:mm");
                    scmd.Parameters["@WarrStartDate"].Value = strWarrStartDate;
                     
                }
                else
                {
                    scmd.Parameters["@WarrStartDate"].Value = DBNull.Value;
                }

                if (txtWEDa.Value != "")
                {

                    strwarrEndDate = ConvertDateTime(txtWEDa.Value, true);
                    strwarrEndDate = Convert.ToDateTime(strwarrEndDate).ToString("MMM dd, yyyy HH:mm");
                    scmd.Parameters["@WarrEndDate"].Value = strwarrEndDate;
                     
                }
                else
                {
                    scmd.Parameters["@WarrEndDate"].Value = DBNull.Value;
                }



                scmd.Parameters["@ContCode"].Value = Convert.ToString(hdnContcode.Value);
                scmd.Parameters["@EngCode"].Value = Convert.ToString(DDEngineer1.SelectedItem.Value);
                scmd.Parameters["@EngCode2"].Value = Convert.ToString(DDEngineer2.SelectedItem.Value);
                scmd.Parameters["@SubStatus"].Value = Convert.ToString(DDSubStatus.SelectedItem.Value);
                scmd.Parameters["@Status"].Value = "Open";

                scmd.Parameters["@CreatedBy"].Value = Convert.ToString(Session["s_student_name"]);



                scmd.Parameters["@DispatchRefNo"].Value = DBNull.Value;
                scmd.Parameters["@Module"].Value = "Update";


                scmd.UpdatedRowSource = UpdateRowSource.OutputParameters;


                //strReturnValue = Convert.ToString(scmd.Parameters["@Message"].Value);

                InstallCode = strReturnValue.Replace("Successful | ", "");


                scmd.ExecuteNonQuery();
                scmd.Dispose();




                //------------------------------------------------------------- Add Warranty Details


                string WarrantyDetails = string.Empty;
                WarrantyDetails = hdnWarrantyInfo.Value;


                if (WarrantyDetails != "")
                {
                    //string delQry = " ";
                    //delQry += " Delete from Install_WarrantyDetails where InstallCode='" + InstallCode + "' ";

                    //scmd = new SqlCommand(delQry, con);
                    //scmd.ExecuteNonQuery();
                    //scmd.Dispose();


                    string[] Lists;
                    Lists = WarrantyDetails.Split('#');

                    foreach (string items in Lists)
                    {
                        if (items != "")
                        {
                            string[] Columns = new string[4];
                            Columns = items.Split('~');

                            scmd.Parameters.Clear();
                            scmd.CommandText = "SP_WarrantyDetails_Insert";
                            scmd.CommandType = CommandType.StoredProcedure;

                            scmd.Connection = con;
                            scmd.CommandTimeout = 0;

                            scmd.Parameters.Add(new SqlParameter("@InstallCode", SqlDbType.VarChar, 30, "WorkCode"));
                            scmd.Parameters.Add(new SqlParameter("@WarrantyType", SqlDbType.VarChar, 30, "TaskCode"));
                            scmd.Parameters.Add(new SqlParameter("@Month", SqlDbType.Int, 50, "Cost"));
                            scmd.Parameters.Add(new SqlParameter("@NoOfVisit", SqlDbType.Int, 50, "WorkType"));
                            scmd.Parameters.Add(new SqlParameter("@InsWardate", SqlDbType.DateTime, 50, "InsWardate"));
                            scmd.Parameters.Add(new SqlParameter("@InEWardate", SqlDbType.DateTime, 50, "InEWardate"));
                            scmd.Parameters.Add(new SqlParameter("@Module", SqlDbType.VarChar, 30, "Module"));
                            scmd.Parameters.Add(new SqlParameter("@Createdby", SqlDbType.VarChar, 50, "Createdby"));

                            scmd.Parameters["@InstallCode"].Value = hdnInstallCode.Value;
                            scmd.Parameters["@WarrantyType"].Value = Columns[0];
                            scmd.Parameters["@Month"].Value = Columns[1];

                            if (Columns[2] != "")
                            {
                                scmd.Parameters["@NoOfVisit"].Value = Columns[2];
                            }
                            else
                            {
                                scmd.Parameters["@NoOfVisit"].Value = DBNull.Value;
                            }



                            //scmd.Parameters["@InsWardate"].Value = Convert.ToDateTime(Columns[4]).ToString("MMM dd, yyyy HH:mm");// Convert.ToDateTime(txtWarrantyEnd.Value);
                            //scmd.Parameters["@InEWardate"].Value = Convert.ToDateTime(Columns[5]).ToString("MMM dd, yyyy HH:mm");// Convert.ToDateTime(txtWarrantyEnd.Value);
                            //scmd.Parameters["@InsWardate"].Value = Columns[4];
                            //scmd.Parameters["@InEWardate"].Value = Columns[5];

                            if (Columns[4] != "")
                            {

                                strwarrEndDate = ConvertDateTime(Columns[4], true);
                                strwarrEndDate = Convert.ToDateTime(strwarrEndDate).ToString("MMM dd, yyyy HH:mm");
                                scmd.Parameters["@InsWardate"].Value = strwarrEndDate;

                            }
                            else
                            {
                                scmd.Parameters["@InsWardate"].Value = DBNull.Value;
                            }

                            if (Columns[5] != "")
                            {

                                strwarrEndDate = ConvertDateTime(Columns[5], true);
                                strwarrEndDate = Convert.ToDateTime(strwarrEndDate).ToString("MMM dd, yyyy HH:mm");
                                scmd.Parameters["@InEWardate"].Value = strwarrEndDate;

                            }
                            else
                            {
                                scmd.Parameters["@InEWardate"].Value = DBNull.Value;
                            }

                            scmd.Parameters["@Module"].Value = "Update";
                            scmd.Parameters["@Createdby"].Value = Convert.ToString(Session["s_student_name"]);

                            scmd.CommandType = CommandType.StoredProcedure;
                            scmd.ExecuteNonQuery();
                            scmd.Dispose();
                        }
                    }
                }

                 






                string componentDetails = string.Empty;
                componentDetails = hdnComponentInfo.Value;

 

                if (con.State != ConnectionState.Closed)
                    con.Close();


                Page.RegisterClientScriptBlock("", "<script>Closefun('Updated Successfully');</script>");

            }
            catch (Exception ex)
            {
                if (con.State != ConnectionState.Closed)
                    con.Close();


                Response.Write("exception" + ex.Message);
                Response.End();
                //ReturnValue = ex.Message.Replace("'", " ");
                
            }


           



        }
    }
}