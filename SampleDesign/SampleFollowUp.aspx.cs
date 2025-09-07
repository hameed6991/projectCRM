using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace apa_pack.SampleDesign
{
    public partial class SampleFollowUp : System.Web.UI.Page
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


            hdnSampleCode.Value = Request.QueryString["SampleCode"];
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

            strSql = " select Name from DropDownMast where [key] ='SampleFollowUpActivityType' order by Name asc ";

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
            strSql1 = " select Name from DropDownMast where [key] ='SampleFollowUp-JoinType' order by Name asc ";

            SqlDataAdapter da1 = new SqlDataAdapter(strSql1, con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            DDJoinType.DataSource = dt1;
            DDJoinType.DataTextField = "Name";
            DDJoinType.DataValueField = "Name";
            DDJoinType.DataBind();
            DDJoinType.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();



        }



        protected void FillDada()
        {


            con.Open();
            string selectSQL = @"  select CustomerName,RequestDate,SampleCode,ContactPerson,EngineerMaster.EngineerName,SampleRequestType,Priority,RequestQuantity,DesignType,Comments
                                    from SampleRequestMaster inner join EngineerMaster on EngineerMaster.EngineerCode=SampleRequestMaster.SalesExecutive where SampleCode='" + hdnSampleCode.Value + "' ";


            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader = cmd.ExecuteReader(); ;
            while (reader.Read())
            {
                //Install Info
                txtCustomerName.Value = reader["CustomerName"].ToString();
                txtRequestDate.Value = reader["RequestDate"].ToString();
                txtSampleCode.Value = reader["SampleCode"].ToString();
                txtContactPerson.Value = reader["ContactPerson"].ToString();
                txtSalesExecutive.Value = reader["EngineerName"].ToString();
                texSampleRequestType.Value = reader["SampleRequestType"].ToString();
                txtPriority.Value = reader["Priority"].ToString();
                txtSampleRequestedQuantity.Value = reader["RequestQuantity"].ToString();
                txtBoxType.Value = reader["DesignType"].ToString();
                txtComments.Value = reader["Comments"].ToString();
            }
            reader.Close();
            reader.Dispose();

            cmd.Dispose();
            con.Close();



        }
 

        protected void btnsubmitSam_Click(object sender, EventArgs e)
        {




            //------------------------------------------------------------- Add Follow Up Details



            string ReturnValue = string.Empty, strReturnValue = string.Empty, Geolocation = string.Empty, InstallCode = string.Empty, Alert = string.Empty; string OutActivityCode = "";

            try
            {

                SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");

                if (con.State != ConnectionState.Open)
                    con.Open();
                SqlCommand scmd = new SqlCommand("SP_SampleFollowUp_Insert", con);
                scmd.Connection = con;
                scmd.CommandTimeout = 0;

                scmd.CommandType = CommandType.StoredProcedure;


                // Parameters mapped to your SP
                scmd.Parameters.AddWithValue("@SampleCode", Convert.ToString(hdnSampleCode.Value));
                //scmd.Parameters.AddWithValue("@ActivityDate", Convert.ToDateTime(texActivityDate.Value));
                scmd.Parameters.Add(new SqlParameter("@ActivityDate", SqlDbType.DateTime, 50, "ActivityDate"));
                if (texActivityDate.Value != "")
                {
                    //strSalesOrderDate = datecnv.ConvertDateTime(txtSODate.Value, true);
                    //strSalesOrderDate = Convert.ToDateTime(strSalesOrderDate).ToString("MMM dd, yyyy HH:mm");
                    //scmd.Parameters["@SalesOrderDate"].Value = strSalesOrderDate;

                    //scmd.Parameters["@ActivityDate"].Value = texActivityDate.Value;
                    scmd.Parameters["@ActivityDate"].Value = DBNull.Value;
                }
                else
                {
                    scmd.Parameters["@ActivityDate"].Value = DBNull.Value;
                }
                scmd.Parameters.AddWithValue("@ActivityType", DDActivityType.SelectedValue);
                scmd.Parameters.AddWithValue("@SampleBoardQuantity", Convert.ToInt32(txtSampleBoardQuantity.Value));
                scmd.Parameters.AddWithValue("@JoinType", DDJoinType.SelectedValue);
                scmd.Parameters.AddWithValue("@SuccessQuantity", Convert.ToInt32(txtSuccessQuantity.Value));
                scmd.Parameters.AddWithValue("@RejectionQuantity", Convert.ToInt32(txtRejectionQuantity.Value));

                // Start & End Time (store as text, SP is VARCHAR(20))
                scmd.Parameters.AddWithValue("@StartTime", txtStartTime.Value);
                scmd.Parameters.AddWithValue("@EndTime", txtEndTime.Value);

                // Optional comments
                scmd.Parameters.AddWithValue("@Comments", txtComments1.Value);

                // Created by (from session)
                scmd.Parameters.AddWithValue("@CreatedBy", Convert.ToString(Session["s_student_name"]));

                // Output parameter
                SqlParameter outParam = new SqlParameter("@OutActivityCode", SqlDbType.VarChar, 50);
                outParam.Direction = ParameterDirection.Output;
                scmd.Parameters.Add(outParam);

                // Execute
                scmd.ExecuteNonQuery();
                scmd.Dispose();



                // Get output value
                OutActivityCode = Convert.ToString(outParam.Value);

                  
                 

                if (con.State != ConnectionState.Closed)
                    con.Close();
            }
            catch (Exception ex)
            {

                Response.Write("Exception: " + ex.ToString());
                //ReturnValue = ex.Message.Replace("'", " ");
                if (con.State != ConnectionState.Closed)
                    con.Close();
            }


            Page.RegisterClientScriptBlock("", "<script>Closefun('" + OutActivityCode + "');</script>");






        }







    }
}