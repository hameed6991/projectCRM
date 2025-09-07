using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace apa_pack
{
    public partial class InstallSummary : System.Web.UI.Page
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

            //UserControl head_right_div = (UserControl)Master.FindControl("food");
            //((Site)Master).FindControl("food").Visible = false;
            //head_right_div.Visible = false;
            //Master.ToString();
            //((Site)Master).Visible = false;



            hdnFrom.Value = Request.QueryString["From"];
            hdnInstallCode.Value = Request.QueryString["InstallCode"];
            hdnUname.Value = Session["s_student_name"].ToString();





            if (!IsPostBack)
            {
                //RadAjax_PanelAjax is the class name of the master page
                //MasterPage master = Page.Master as MasterPage;
                //master.Visible = false;

                DropDownBind();
                FillDada();
                FillWarrantyDeatils();
                fillAttachments();
            }



        }



        protected void DropDownBind()
        {
             
             


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

 

             
 

        }


        protected void FillDada()
        {

            con.Open();
            string selectSQL = @"  select Purchase.InstallCode,SerialNo,PM.Prodcode,PM.Product,PM.ProdDesc,SalesOrderNo,convert(varchar(20),SalesOrderDate,103) as [SalesOrderDate],WAR_Type,PONo,convert(varchar(20),PODate,103) as [PODate],
                                    Application,Invoice,convert(varchar(20),InvoiceDate,103) as [InvoiceDate],Purchase.PScode,DistanseFromServiceLocation,Purchase.Comments,
                                    convert(varchar(20),InstallDate,103) as [InstallDate],convert(varchar(20),IWD.WarStart,103) as [WarStart],convert(varchar(20),IWD.WarEnd,103) as [WarEnd],IWD.WarrantyType,IWD.Month,IWD.NoOfVisit,
                                    Purchase.Acccode,AM.Account,AM.Industry,AM.Address,AM.Site,AM.City,AM.State,AM.Pincode,
                                    CM.Name,CM.MobileNo,CM.Department,
                                    Substatus,Eng.EngineerName,Eng1.EngineerName as [EngineerName1],
                                    convert(varchar(20),GETDATE(),103) as [Today Date]
                                    from Purchase 
                                    inner join ProdMast PM ON Purchase.ProdCode=PM.ProdCode
                                    inner join Install_WarrantyDetails IWD ON Purchase.InstallCode=IWD.InstallCode
                                    inner join AccMast AM ON Purchase.AccCode=AM.AccCode
                                    inner join ContMast CM ON AM.AccCode=CM.AccCode
                                    left join EngineerMaster Eng ON Purchase.EngCode=Eng.EngineerCode
                                    left join EngineerMaster Eng1 ON Purchase.EngCode2=Eng.EngineerCode
                                    where  Purchase.InstallCode='" + hdnInstallCode.Value + "' ";


            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader = cmd.ExecuteReader(); ;
            while (reader.Read())
            {
                //Install Info
                txtProduct.Value = reader["Product"].ToString();
                txtProductDec.Value = reader["ProdDesc"].ToString();
                txtSalesOrder.Value = reader["SalesOrderNo"].ToString();
                txtSODate.Value = reader["SalesOrderDate"].ToString();
                txtFieldUpdate.Value = "";
                txtPo.Value = reader["PONo"].ToString();
                txtPODate1.Value = reader["PODate"].ToString();
                DDSoftware.SelectedValue = reader["Application"].ToString();
                txtInvoiceNo.Value = reader["Invoice"].ToString();
                txtInDate.Value = reader["InvoiceDate"].ToString(); 
                //txtTradeUpSID.Value = reader["Contact_Number"].ToString();
                txtPrincipal.Value = reader["PScode"].ToString();
                txtDistentService.Value = reader["DistanseFromServiceLocation"].ToString();
                txtComments.Value = reader["Comments"].ToString();

                //Warranty Info
                txtInstallDate.Value = reader["InstallDate"].ToString();
                txtWSDate.Value = reader["WarStart"].ToString();
                txtWEDate.Value = reader["WarEnd"].ToString();
                txtWarrantyType.Value = reader["WarrantyType"].ToString();
                txtMonth.Value = reader["Month"].ToString();
                txtNumberOfVisit.Value = reader["NoOfVisit"].ToString();

                //Account Info
                txtAccount.Value = reader["Acccode"].ToString();
                txtIndustry.Value = reader["Industry"].ToString();
                txtAddress.Value = reader["Address"].ToString();
                txtSite.Value = reader["Site"].ToString();
                txtCity.Value = reader["City"].ToString();
                txtstate.Value = reader["State"].ToString();
                txtPinCode.Value = reader["Pincode"].ToString();
                DDContact1.Value = reader["Name"].ToString();
                txtMobile.Value = reader["MobileNo"].ToString();
                txtDepartment.Value = reader["Department"].ToString();

                //Allocation Info
                TexEngineer1.Value = reader["EngineerName"].ToString();
                TexEngineer2.Value = reader["EngineerName1"].ToString();
                txtsubstatus.Value = reader["Substatus"].ToString();

                //For Attachment

                txtUserName.Value = Session["s_student_name"].ToString();
                txtDate.Value = reader["Today Date"].ToString();


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
                        strTemp += "#" + dr["WarrantyType"].ToString() + "~" + dr["Month"].ToString() + "~" + dr["NoOfVisit"].ToString() + "~" + dr["WarStart"].ToString() + "~" + dr["WarEnd"].ToString() + "";
                    }
                    else
                    {
                        strTemp = dr["WarrantyType"].ToString() + "~" + dr["Month"].ToString() + "~" + dr["NoOfVisit"].ToString() + "~" + dr["WarStart"].ToString() + "~" + dr["WarEnd"].ToString() + "";
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





        private void fillAttachments()
        {


            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");


            try
            {
                if (hdnInstallCode.Value.ToString() != "")
                {

                    string strQry = "";


                    strQry = " SELECT (SELECT count(AttachCode) FROM attachment where InstallCode = '" + hdnInstallCode.Value.ToString() + "') as 'AttachCount', ROW_NUMBER()  OVER (ORDER BY  AttachCode) As Srno,clientfile as 'Attached File',AttachCode,Comments,Size,Convert(Varchar(10),CreatedDate,103) as 'Attached Date',";
                    strQry += " rtrim(ltrim(FilePath)) as 'FilePath' from attachment where InstallCode = '" + hdnInstallCode.Value.ToString() + "'";




                    if (con.State != ConnectionState.Open)
                        con.Open();
                    //  Response.Write(strQry);
                    SqlCommand dbCommand = new SqlCommand(strQry, con);
                    SqlDataReader dr6 = dbCommand.ExecuteReader();

                    SRAttachments.InnerHtml = "";

                    int i = 1;
                    // Response.Write("test1");
                    if (dr6.HasRows)

                        while (dr6.Read())
                        {
                            //   Response.Write("test2");
                            string filename = dr6["Attached File"].ToString();

                              

                            SRAttachments.InnerHtml += "<li style='width:318px;height: 95.4px;'>";

                            string filenameext = Path.GetExtension(filename);


                            if (filenameext == ".png" || filenameext == ".jpg" || filenameext == ".PNG" || filenameext == ".JPG")
                            {

                                SRAttachments.InnerHtml += "<img id='attachimg' src= " + dr6["FilePath"].ToString() + " style='width:150px;height:150px;margin:5px 5px 5px 5px;' ><br/>";
                            }


                            else if (filenameext == ".pdf")
                            {
                                SRAttachments.InnerHtml += "<img id='attachimg' src='images/pdficon.png' style='width:150px;height:150px;margin:5px 5px 5px 5px;' ><br/>";
                            }


                            else if (filenameext == ".xls" || filenameext == ".xlsx")
                            {
                                SRAttachments.InnerHtml += "<img id='attachimg' src= 'images/xlsicon.png' style='width:150px;height:150px;margin:5px 5px 5px 5px;' ><br/>";
                            }

                            else if (filenameext == ".txt" || filenameext == ".doc" || filenameext == ".docx")
                            {
                                SRAttachments.InnerHtml += "<img id='attachimg' src= 'images/texticon.png' style='width:150px;height:150px;margin:5px 5px 5px 5px;' ><br/>";
                            }

                            else if (filenameext == ".zip" || filenameext == ".tar" || filenameext == ".rar")
                            {
                                SRAttachments.InnerHtml += "<img id='attachimg' src= 'images/Zip_icon.png' style='width:150px;height:150px;margin:5px 5px 5px 5px;' ><br/>";
                            }

                            else
                            {
                                SRAttachments.InnerHtml += "<img id='attachimg' src= 'images/Attachicon.png' style='width:150px;height:150px;'margin:5px 5px 5px 5px; ><br/>";
                            }

                            SRAttachments.InnerHtml += "<input name='hdnFileName" + dr6["Srno"].ToString() + "' type ='hidden' value = '" + dr6["FilePath"].ToString() + "'><input name='hdnActFileName" + dr6["Srno"].ToString() + "' type ='hidden' value = '"+ dr6["Attached File"].ToString() + "'><a href='#' class='downloadbtn' onclick='javascript:Attachfile(" + dr6["Srno"].ToString() + ")' target='_self' >Download</a><br/>";

                            if (dr6["Comments"].ToString().Length > 40)
                            {

                                SRAttachments.InnerHtml += "<input type='hidden' name='hdnattachcomments" + dr6["Srno"].ToString() + "' value= '" + dr6["Comments"].ToString() + "'>";

                                SRAttachments.InnerHtml += "<p id='attachcomments" + dr6["Srno"].ToString() + "'  style='margin-top:10px;padding-left:7px;padding-right:7px;text-align:center;margin-bottom:2px;color:#000;font-size:14px;font-family:calibri;word-wrap: break-word;'>" + dr6["Comments"].ToString().Substring(0, 40) + "<a id='dotcomments' href='#' onclick='fetchAttachData(" + dr6["Srno"].ToString() + ");'>...</a></p>";

                            }

                            else
                            {
                                SRAttachments.InnerHtml += "<p readonly style='margin-top:10px;padding-left:7px;padding-right:7px;text-align:center;margin-bottom:2px;color:#000;font-size:14px;font-family:calibri;word-wrap: break-word;'>" + dr6["Comments"].ToString() + "</p>";
                            }

                            SRAttachments.InnerHtml += "</li>";

                            i++;

                            LabAttachCount.Text = dr6["AttachCount"].ToString(); 

                        }

                    dr6.Close();
                    dbCommand.Dispose();
                }

                else
                {
                    //SRAttachments.InnerHtml += "<span style='color:red;'>There are no Attachments to display</span>";
                }

            }

            catch (Exception ex)
            {
                // Response.Write(ex.Message.ToString());
            }


        }




        protected void btnAttach_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");


            //Attachment Save

            con.Open();
            if (FileAttach.HasFile)
            {
                string imgName = Path.GetFileName(FileAttach.PostedFile.FileName);

                string dy = DateTime.Now.Day.ToString();
                string mon = DateTime.Now.Month.ToString();
                string yr = DateTime.Now.Year.ToString();
                string hr = DateTime.Now.TimeOfDay.Hours.ToString();
                string min = DateTime.Now.TimeOfDay.Minutes.ToString();
                string sec = DateTime.Now.TimeOfDay.Milliseconds.ToString();
                string con1 = dy + mon + yr + hr + min + sec;
                string ext = System.IO.Path.GetExtension(this.FileAttach.PostedFile.FileName);
                string strdate = con1 + ext;

                string imgPath = "Attach/" + strdate;//imgName;
                long size_img = FileAttach.PostedFile.InputStream.Length;
                FileAttach.SaveAs(Server.MapPath("Attach/" + strdate));//imgName

                string Attachsql = "insert into Attachment(AttachCode,filepath,Size,InstallCode,CreatedBy,CreatedDate,Clientfile,Comments) select AttachmentCode,'" + imgPath.ToString() + "'," + size_img.ToString() + ",'" + hdnInstallCode.Value + "','" + Session["s_student_name"].ToString() + "','" + DateTime.Now + "','" + imgName.ToString() + "','" + txtComment.Value.ToString() + "' from keygeneration;update keygeneration set AttachmentCode=AttachmentCode+1";
                SqlCommand cmd = new SqlCommand(Attachsql, con); 
                cmd.ExecuteNonQuery();
                cmd.Dispose();


            }
            con.Close();




            Page.RegisterClientScriptBlock("", "<script>attachclose('Saved Successfully','"+ hdnInstallCode.Value + "');</script>");


        }
    }
}