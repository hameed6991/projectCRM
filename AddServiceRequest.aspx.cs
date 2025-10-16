using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.ClientServices;
using apa_pack;


namespace apa_pack
{
    public partial class AddServiceRequest : System.Web.UI.Page
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



            hdnFrom.Value = Request.QueryString["From"];




            if (!IsPostBack)
            {
                //RadAjax_PanelAjax is the class name of the master page
                //MasterPage master = Page.Master as MasterPage;
                //master.Visible = false;

                DropDownBind();



            }


            // CREATE OBJECT FOR TEST PURPOSE
            TestClass testClass = new TestClass();

            int GetClassValue = testClass.TestMessage();

            //Response.Write(GetClassValue);
            //Response.End();

            // CREATE OBJECT FOR TEST PURPOSE


        }



        protected void DropDownBind()
        {
            //Response.Write("DropDownBind" + "..." + hdnAccCode.Value);


             

            string strSql = "";
            con.Open();

            strSql = " Select Name from DropDownMast where [Key]='Source' order by Name asc ";

            SqlDataAdapter da = new SqlDataAdapter(strSql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DDSource.DataSource = dt;
            DDSource.DataTextField = "Name";
            DDSource.DataValueField = "Name";
            DDSource.DataBind();
            //DDFieldUpdate.DataValueField = "Name";
            DDSource.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();




            string strSql1 = "";
            con.Open();

            strSql1 = " select Name from DropDownMast where [key] ='Priority' order by Name asc ";

            SqlDataAdapter da1 = new SqlDataAdapter(strSql1, con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            DDPriority.DataSource = dt1;
            DDPriority.DataTextField = "Name";
            DDPriority.DataValueField = "Name";
            DDPriority.DataBind();
            //DDPriority.DataValueField = "Name";
            DDPriority.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();



            string strSql2 = "";
            con.Open();

            strSql2 = " select Name from DropDownMast where[Key] = 'CallType' order by Name asc ";

            SqlDataAdapter da2 = new SqlDataAdapter(strSql2, con);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            DDCallType.DataSource = dt2;
            DDCallType.DataTextField = "Name";
            DDCallType.DataValueField = "Name";
            DDCallType.DataBind();
            //DDCallType.DataValueField = "Name";
            DDCallType.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();



            string strSql3 = "";
            con.Open();

            strSql3 = " select Name from DropDownMast where[Key] = 'SubCallType' order by Name asc ";

            SqlDataAdapter da3 = new SqlDataAdapter(strSql3, con);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);
            DDSubCallType.DataSource = dt3;
            DDSubCallType.DataTextField = "Name";
            DDSubCallType.DataValueField = "Name";
            DDSubCallType.DataBind();
            //DDSubCallType.DataValueField = "Name";
            DDSubCallType.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();



            string strSql4 = "";
            con.Open();

            strSql4 = " select Name from DropDownMast where [Key]='Ticket_Substatus' order by Name asc ";

            SqlDataAdapter da4 = new SqlDataAdapter(strSql4, con);
            DataTable dt4 = new DataTable();
            da4.Fill(dt4);
            DDSubstatus.DataSource = dt4;
            DDSubstatus.DataTextField = "Name";
            DDSubstatus.DataValueField = "Name";
            DDSubstatus.DataBind();
            //DDSubstatus.DataValueField = "Name";
            DDSubstatus.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();





        }





        protected void btnsubmitIns_Click(object sender, EventArgs e)
        {





            //------------------------------------------------------------- Add Install Details



            string ReturnValue = string.Empty, strReturnValue = string.Empty, Geolocation = string.Empty, InstallCode = string.Empty, Alert = string.Empty;

            try
            {

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




               
 
                scmd.Parameters["@InstallCode"].Value = "";
   
                

                scmd.Parameters["@InstallCallDate"].Value = DBNull.Value;


                scmd.Parameters["@WarrantyType"].Value = "Standerd";
                scmd.Parameters["@WAR_Type"].Value = DBNull.Value;

 
            



                scmd.Parameters["@ContCode"].Value = Convert.ToString(hdnContcode.Value);
                
                scmd.Parameters["@Status"].Value = "Open";

                scmd.Parameters["@CreatedBy"].Value = Convert.ToString(Session["s_student_name"]);



                scmd.Parameters["@DispatchRefNo"].Value = DBNull.Value;
                scmd.Parameters["@Module"].Value = "Insert";


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

                            scmd.Parameters["@InstallCode"].Value = InstallCode;
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



                            // scmd.Parameters["@InitWardate"].Value = Convert.ToDateTime(txtWarrantyStart.Value).ToString("MMM dd, yyyy HH:mm");// Convert.ToDateTime(txtWarrantyEnd.Value);
                            scmd.Parameters["@InsWardate"].Value = Columns[4];
                            scmd.Parameters["@InEWardate"].Value = Columns[5];

                            scmd.Parameters["@Module"].Value = Columns[3];
                            scmd.Parameters["@Createdby"].Value = Convert.ToString(Session["s_student_name"]);

                            scmd.CommandType = CommandType.StoredProcedure;
                            scmd.ExecuteNonQuery();
                            scmd.Dispose();
                        }
                    }
                }

                // Install Key Update
                string KQry = " ";
                KQry += " Update keygeneration Set  InstallCode=InstallCode+1 ";

                scmd = new SqlCommand(KQry, con);
                scmd.ExecuteNonQuery();
                scmd.Dispose();






                string componentDetails = string.Empty;
                componentDetails = hdnComponentInfo.Value;





                //if (strReturnValue.StartsWith("Successful"))
                //{
                //    // Response.Write(Alert);

                //   
                //    if (componentDetails != "")
                //    {

                //        string del1qry = string.Empty;

                //        //string delQry = "Insert into His_Install_WarrantyDetails(InstallCode,WarrantyType,[Month],NoOfVisit,Createdby,Createddate,deletedby,deletddate)            ";
                //        //delQry += " select InstallCode,WarrantyType,[Month],NoOfVisit,Createdby,Createddate,'" + Convert.ToString(Session["uname"]) + "',dbo.getCountrydate() from Install_WarrantyDetails          ";
                //        //delQry += " where InstallCode='" + InstallCode + "';    ";
                //        //delQry += "  ";
                //        del1qry += " Delete from AddonProducts where InstallCode='" + InstallCode + "'; ";

                //        scmd = new SqlCommand(del1qry, con);
                //        scmd.ExecuteNonQuery();
                //        scmd.Dispose();


                //        string[] Lists;
                //        Lists = componentDetails.Split('#');
                //        foreach (string items in Lists)
                //        {
                //            if (items != "")
                //            {
                //                string[] Columns = new string[4];
                //                Columns = items.Split('~');
                //                //3     columns         

                //                scmd.Parameters.Clear();
                //                scmd.CommandText = "proc_New_ComponentDetails";
                //                scmd.CommandType = CommandType.StoredProcedure;
                //                //scmd.Transaction = Trans;
                //                scmd.Connection = con;
                //                scmd.CommandTimeout = 0;

                //                scmd.Parameters.Add(new SqlParameter("@InstallCode", SqlDbType.VarChar, 30, "cominsCode"));

                //                scmd.Parameters.Add(new SqlParameter("@compcode", SqlDbType.VarChar, 10, "comcompcode"));
                //                scmd.Parameters.Add(new SqlParameter("@Serialno", SqlDbType.VarChar, 20, "comserialno"));
                //                scmd.Parameters.Add(new SqlParameter("@Qty", SqlDbType.Int, 50, "comqty"));
                //                scmd.Parameters.Add(new SqlParameter("@VersionNo", SqlDbType.VarChar, 60, "comversionno"));
                //                scmd.Parameters.Add(new SqlParameter("@Warstdate", SqlDbType.DateTime, 50, "comstdate"));
                //                scmd.Parameters.Add(new SqlParameter("@Warenstdate", SqlDbType.DateTime, 50, "comenddate"));
                //                scmd.Parameters.Add(new SqlParameter("@Comments", SqlDbType.VarChar, 250, "comcoments"));
                //                scmd.Parameters.Add(new SqlParameter("@Createdby", SqlDbType.VarChar, 50, "Createdby"));

                //                scmd.Parameters["@InstallCode"].Value = InstallCode;
                //                scmd.Parameters["@compcode"].Value = Columns[0];
                //                scmd.Parameters["@Serialno"].Value = Columns[1];
                //                scmd.Parameters["@Qty"].Value = Columns[2];
                //                scmd.Parameters["@VersionNo"].Value = Columns[3];

                //                if (Columns[4].ToString() != "")
                //                {
                //                    string FromDt = Columns[4].ToString().Trim();
                //                    FromDt = datecnv.ConvertDateTime(FromDt, true);
                //                    FromDt = Convert.ToDateTime(FromDt).ToString("MMM dd, yyyy");

                //                    // cmd.Parameters.Add(new SqlParameter("@ActualStartDate", FromDt));
                //                    scmd.Parameters["@Warstdate"].Value = FromDt;
                //                }
                //                else
                //                {
                //                    scmd.Parameters["@Warstdate"].Value = DBNull.Value;

                //                }

                //                if (Columns[5].ToString() != "")
                //                {
                //                    string FromDt1 = Columns[5].ToString().Trim();
                //                    FromDt1 = datecnv.ConvertDateTime(FromDt1, true);
                //                    FromDt1 = Convert.ToDateTime(FromDt1).ToString("MMM dd, yyyy");

                //                    // cmd.Parameters.Add(new SqlParameter("@ActualStartDate", FromDt));
                //                    scmd.Parameters["@Warenstdate"].Value = FromDt1;
                //                }
                //                else
                //                {
                //                    scmd.Parameters["@Warenstdate"].Value = DBNull.Value;

                //                }

                //                //Added By Koripriyan and Selvaraj 2/1/2018 
                //                string Com_commands = Utility.FnCheckStringRemove(Columns[6]);
                //                scmd.Parameters["@Comments"].Value = Com_commands;


                //                scmd.Parameters["@Createdby"].Value = Convert.ToString(HttpContext.Current.Session["uname"]);

                //                scmd.CommandType = CommandType.StoredProcedure;
                //                scmd.ExecuteNonQuery();
                //                scmd.Dispose();
                //            }
                //        }
                //    }

                //}
                //else
                //{
                //    ReturnValue = strReturnValue;
                //}




                if (con.State != ConnectionState.Closed)
                    con.Close();
            }
            catch (Exception ex)
            {

                //ReturnValue = ex.Message.Replace("'", " ");
                if (con.State != ConnectionState.Closed)
                    con.Close();
            }


            Page.RegisterClientScriptBlock("", "<script>Closefun('Saved Successfully');</script>");


        }



        [WebMethod]
        public static List<string> GetSerialNo(string pre)
        {
            string ValCon = "";
            List<string> SerialNoDetail = new List<string>();

            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");

            //string sqlqry = string.Format(" select AccMast.Account,CASE WHEN GETDATE() BETWEEN WarrStartDate AND WarrEndDate THEN 'In Warranty' ELSE 'Out of Warranty' END AS[WarrantyStatus] from Purchase inner join AccMast on AccMast.AccCode = Purchase.AccCode  where SerialNo like '%{0}%' ", pre);

            string sqlqry = @"
                     SELECT SerialNo, AccMast.Account, 
                     CASE 
                     WHEN GETDATE() BETWEEN WarrStartDate AND WarrEndDate 
                    THEN 'In Warranty' 
                     ELSE 'Out of Warranty' 
                    END AS WarrantyStatus 
                     FROM Purchase 
                    INNER JOIN AccMast ON AccMast.AccCode = Purchase.AccCode 
                    WHERE SerialNo LIKE @pre OR AccMast.Account LIKE @pre";

            SqlCommand cmd = new SqlCommand(sqlqry, con);
            cmd.Parameters.AddWithValue("@pre", "%" + pre + "%");

            con.Open();
            //SqlCommand cmd = new SqlCommand(sqlqry, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                SerialNoDetail.Add(dr.GetString(0));
                SerialNoDetail.Add("~");
                SerialNoDetail.Add(dr.GetString(1));
                SerialNoDetail.Add("~");
                SerialNoDetail.Add(dr.GetString(2));

            }
            con.Close();

            return SerialNoDetail;
        }



        protected void txtSerialNo_TextChanged(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(txtSerialNo.Text))
            {

                Page.RegisterClientScriptBlock("", "<script>alert('Serial No cannot be empty.');</script>");
            }
            else
            {
                Page.RegisterClientScriptBlock("", "<script>alert('" + txtSerialNo.Text + "');</script>");
            }

        }




    }
}