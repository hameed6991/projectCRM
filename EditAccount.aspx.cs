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
    public partial class EditAccount : System.Web.UI.Page
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


            hdnAccCode.Value = Request.QueryString["AccCode"];

            //Response.Write(hdnAccCode.Value);
            //Response.End();
            



            if (!IsPostBack)
            {
                //RadAjax_PanelAjax is the class name of the master page
                //MasterPage master = Page.Master as MasterPage;
                //master.Visible = false;

                FillDada();
                DropDownBind();
            }
            
            




        }


        protected void DropDownBind()
        {


            string strSql = "";
            con.Open();

            strSql = " select Name as 'ID',Name as 'Name' from DropDownMast where [key] ='CustomerType' order by Name asc  ";

            SqlDataAdapter da = new SqlDataAdapter(strSql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DDCustomerType.DataSource = dt;
            DDCustomerType.DataTextField = "Name";
            DDCustomerType.DataValueField = "Name";
            DDCustomerType.DataBind();
            //DDCustomerType.DataValueField = "Name";
            DDCustomerType.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();





            string strSql1 = "";
            con.Open();

            strSql1 = " select Name from DropDownMast where [key] ='Industries' order by Name asc ";

            SqlDataAdapter da1 = new SqlDataAdapter(strSql1, con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            DDIndustry.DataSource = dt1;
            DDIndustry.DataTextField = "Name";
            DDIndustry.DataValueField = "Name";
            DDIndustry.DataBind();
            DDIndustry.Items.Insert(0, new ListItem("<-Select->", ""));
            con.Close();



            string strSq2 = "";
            con.Open();
            strSq2 = " select Name as 'ID',Name as 'Name' from DropDownMast where [key] ='AccountType' order by Name asc ";
            SqlDataAdapter da2 = new SqlDataAdapter(strSq2, con);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            DDAccountType.DataSource = dt2;
            DDAccountType.DataTextField = "ID";
            DDAccountType.DataValueField = "Name";
            DDAccountType.DataBind();
            DDAccountType.Items.Insert(0, new ListItem("<-Select->", ""));
            con.Close();



            string strSq3 = "";
            con.Open();
            strSq3 = " select Name from DropDownMast where [key] ='State' order by Name asc ";
            SqlDataAdapter da3 = new SqlDataAdapter(strSq3, con);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);
            DDState.DataSource = dt3;
            DDState.DataTextField = "Name";
            DDState.DataValueField = "Name";
            DDState.DataBind();
            DDState.Items.Insert(0, new ListItem("<-Select->", ""));
            con.Close();

        }


        protected void FillDada()
        {


            con.Open();
            string selectSQL = @"  select Account,Site,SiteID,AccType,Industry,GSTIN,Comments,CustomerType,Synonyms,Contact_Number,
                                   Address,Pincode,City,State,CustomerArea,AccessibilityType,AccessibilityTimeFrom,AccessibilityTimeTo 
                                   from AccMast where AccCode='"+ hdnAccCode.Value + "' ";
 

            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader = cmd.ExecuteReader(); ;
            while (reader.Read())
            {
                //Account Info
                txtAccount.Value = reader["Account"].ToString();
                txtSite.Value = reader["Site"].ToString();
                txtSiteID.Value = reader["SiteID"].ToString();
                DDAccountType.SelectedValue = reader["AccType"].ToString();
                DDIndustry.SelectedValue = reader["Industry"].ToString();
                txtSGSTIN.Value = reader["GSTIN"].ToString();
                txtAComments.Value = reader["Comments"].ToString();
                DDCustomerType.SelectedValue = reader["CustomerType"].ToString();
                txtSynonyms.Value = reader["Synonyms"].ToString();
                txtStartDate.Value = "";
                txtContactNo.Value = reader["Contact_Number"].ToString();

                //Address Info
                txtAddress.Value = reader["Address"].ToString();
                txtPincode.Value = reader["Pincode"].ToString();
                txtCity.Value = reader["City"].ToString();
                DDState.SelectedValue = reader["State"].ToString();
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

 

        protected void btnSave_ServerClick(object sender, EventArgs e)
        {
 
            try
            {


                con.Open();
                //Response.Write(hdnAccCode.Value.ToString() + "..............");
                //Response.Write(DDIndustry.SelectedValue.ToString() + "..............");
                //Response.Write(txtContactNo.Value + "..............");
                //Response.Write(DDCustomerType.SelectedValue);

                //Response.End();

                
                SqlCommand cmd = new SqlCommand("Sp_Account_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@AccCode", hdnAccCode.Value.ToString().Trim()));
                cmd.Parameters.Add(new SqlParameter("@Account", txtAccount.Value.ToString()));
                cmd.Parameters.Add(new SqlParameter("@Site", txtSite.Value.ToString().Trim()));
                if (txtSiteID.Value == "Auto")
                {
                    cmd.Parameters.Add(new SqlParameter("@SiteID", ""));
                }

                else
                {
                    cmd.Parameters.Add(new SqlParameter("@SiteID", txtSiteID.Value.ToString().Trim()));
                }
                cmd.Parameters.Add(new SqlParameter("@AccountType", DDAccountType.SelectedValue.ToString().Trim()));
                //cmd.Parameters.Add(new SqlParameter("@Industry", cmbIndustry.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@Industry", DDIndustry.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@GSTIN", txtSGSTIN.Value));
                cmd.Parameters.Add(new SqlParameter("@comments", txtAComments.Value.ToString().Trim()));
                //cmd.Parameters.Add(new SqlParameter("@CustomerType", cmbcustomertype.SelectedValue));
                    cmd.Parameters.Add(new SqlParameter("@CustomerType", DDCustomerType.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@Synonyms", txtSynonyms.Value));
                cmd.Parameters.Add(new SqlParameter("@Contact_Number", txtContactNo.Value));
                
                
                 
                cmd.Parameters.Add(new SqlParameter("@Address", txtAddress.Value.ToString().Trim()));
                cmd.Parameters.Add(new SqlParameter("@Pincode", txtPincode.Value.ToString().Trim()));
                cmd.Parameters.Add(new SqlParameter("@City", txtCity.Value.ToString().Trim()));
                cmd.Parameters.Add(new SqlParameter("@State", DDState.SelectedValue));
                //cmd.Parameters.Add(new SqlParameter("@State", cmbState.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@Area", txtArea.Value.ToString()));
                   

                cmd.Parameters.Add(new SqlParameter("@AccessibilityType", txtAccessibility.Value));
                cmd.Parameters.Add(new SqlParameter("@AccessTimeFrom", txtAccessibilityTimeFrom.Value));
                cmd.Parameters.Add(new SqlParameter("@AccessTimeTo", txtAccessibilityTimeTo.Value));

                //if (txtAccessibilityFrom.Value != "00:00")
                //{
                //    AccFrom = txtAccessibilityFrom.Value.Split(':');
                //    AccFromHrs = AccFrom[0];
                //    AccFrommins = Convert.ToString(Convert.ToInt32(AccFromHrs) * 60);
                //    // AccTotalFrom = Convert.ToString(Convert.ToInt32(AccFrom[1] + AccFrommins));
                //    AccTotalFrom = Convert.ToString(Convert.ToInt32(AccFrom[1]) + Convert.ToInt32(AccFrommins));

                //    cmd.Parameters.Add(new SqlParameter("@AccessTimeFrom", AccTotalFrom));

                //}
                //else
                //{
                //    cmd.Parameters.Add(new SqlParameter("@AccessTimeFrom", DBNull.Value));
                //}
                //if (txtAccessibilityTo.Value != "00:00")
                //{
                //    AccTo = txtAccessibilityTo.Value.Split(':');
                //    AccToHrs = AccTo[0];
                //    AccTomins = Convert.ToString(Convert.ToInt32(AccToHrs) * 60);
                //    AccTotalTo = Convert.ToString(Convert.ToInt32(AccTo[1]) + Convert.ToInt32(AccTomins));

                //    cmd.Parameters.Add(new SqlParameter("@AccessTimeTo", AccTotalTo));

                //}
                //else
                //{
                //    cmd.Parameters.Add(new SqlParameter("@AccessTimeTo", DBNull.Value));
                //}

 
                cmd.Parameters.Add(new SqlParameter("@Account_Modifiedby", Session["s_student_name"].ToString()));
               
                 
                 
                cmd.ExecuteNonQuery();
 
                con.Close();
  
                Page.RegisterClientScriptBlock("", "<script>Closefun('Updated Successfully');</script>");

 


            }
            catch (Exception ex)
            {
                // MessageBox(ex.Message);
                Response.Write("Exception: " + ex.Message);
                Response.End();

            }

        }





    }
}