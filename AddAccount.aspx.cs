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
    public partial class AddAccount : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                //RadAjax_PanelAjax is the class name of the master page
                //MasterPage master = Page.Master as MasterPage;
                //master.Visible = false;

                DropDownBind();
            }

            

        }

        protected void DropDownBind()
        {
            
            
            string strSql = "";
            con.Open();
 
            strSql = " select Name from DropDownMast where [key] ='CustomerType' order by Name asc ";
 
            SqlDataAdapter da = new SqlDataAdapter(strSql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DDCustomerType.DataSource = dt;
            DDCustomerType.DataTextField = "Name";
            DDCustomerType.DataValueField = "Name";
            DDCustomerType.DataBind();
            //DDCustomerType.DataValueField = "Name";
            DDCustomerType.Items.Insert(0, new ListItem("None", ""));

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
            strSq2 = " select Name from DropDownMast where [key] ='AccountType' order by Name asc ";

            SqlDataAdapter da2 = new SqlDataAdapter(strSq2, con);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            DDAccountType.DataSource = dt2;
            DDAccountType.DataTextField = "Name";
            DDAccountType.DataValueField = "Name";
            DDAccountType.DataBind();
            DDAccountType.Items.Insert(0, new ListItem("None", ""));

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
 

        protected void btnSubmit1_Click(object sender, EventArgs e)
        {
            try
            {



                con.Open();
                SqlCommand cmd = new SqlCommand("Sp_Account_Insert", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@AccCode", "A0000"));
                cmd.Parameters.Add(new SqlParameter("@Account", txtAccount.Value));
                cmd.Parameters.Add(new SqlParameter("@Site", txtSite.Value.ToString().Trim()));
                if (txtSiteID.Value == "Auto")
                {
                    cmd.Parameters.Add(new SqlParameter("@SiteID", ""));
                }

                else
                {
                    cmd.Parameters.Add(new SqlParameter("@SiteID", txtSiteID.Value.ToString().Trim()));
                }
                cmd.Parameters.Add(new SqlParameter("@AccountType", DDAccountType.SelectedValue));
                //cmd.Parameters.Add(new SqlParameter("@AccountType", txtAccountType.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@Industry", DDIndustry.SelectedValue));
                //cmd.Parameters.Add(new SqlParameter("@Industry", cmbIndustry.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@GSTIN", txtSGSTIN.Value.ToString().Trim()));
                cmd.Parameters.Add(new SqlParameter("@comments", txtComments.Value));
                cmd.Parameters.Add(new SqlParameter("@CustomerType", DDCustomerType.SelectedValue));
                //cmd.Parameters.Add(new SqlParameter("@CustomerType", cmbcustomertype.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@Synonyms", txtSynonyms.Value));
                cmd.Parameters.Add(new SqlParameter("@Contact_Number", txtContactNo.Value));

                cmd.Parameters.Add(new SqlParameter("@Address", txtAddress.Value.ToString().Trim()));
                cmd.Parameters.Add(new SqlParameter("@Pincode", txtPincode.Value.ToString().Trim()));
                cmd.Parameters.Add(new SqlParameter("@City", txtCity.Value.ToString().Trim()));
                cmd.Parameters.Add(new SqlParameter("@State", DDState.SelectedValue));
                //cmd.Parameters.Add(new SqlParameter("@State", DDState.SelectedValue));
                cmd.Parameters.Add(new SqlParameter("@Area", txtArea.Value));




                cmd.Parameters.Add(new SqlParameter("@AccessibilityType", txtAccessibility.Value));


                cmd.Parameters.Add(new SqlParameter("@AccessTimeFrom", ""));

                cmd.Parameters.Add(new SqlParameter("@AccessTimeTo", ""));


                //if (txtAccessibilityTimeFrom.Value != "00:00")
                //{
                //    AccFrom = txtAccessibilityTimeFrom.Value.Split(':');
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
                //if (txtAccessibilityTimeTo.Value != "00:00")
                //{
                //    AccTo = txtAccessibilityTimeTo.Value.Split(':');
                //    AccToHrs = AccTo[0];
                //    AccTomins = Convert.ToString(Convert.ToInt32(AccToHrs) * 60);
                //    AccTotalTo = Convert.ToString(Convert.ToInt32(AccTo[1]) + Convert.ToInt32(AccTomins));

                //    cmd.Parameters.Add(new SqlParameter("@AccessTimeTo", AccTotalTo));

                //}
                //else
                //{
                //    cmd.Parameters.Add(new SqlParameter("@AccessTimeTo", DBNull.Value));
                //}

                cmd.Parameters.Add(new SqlParameter("@Account_createdby", Session["s_student_name"].ToString()));

                cmd.Parameters.Add(new SqlParameter("@KeyGen", DBNull.Value));



                cmd.ExecuteNonQuery();






                Page.ClientScript.RegisterStartupScript(this.GetType(), "Karthick", "Closefun('Saved Successfully');", true);

                //Page.RegisterClientScriptBlock("", "<script>alert('Saved Successfully');window.close();</script>");

                con.Close();



            }
            catch (Exception ex)
            {
                Response.Write("Exception: " + ex.ToString());
                // MessageBox(ex.Message);
                //Response.Write("Exception: " + ex.Message);
                //Response.End();
            }


        }




    }
}