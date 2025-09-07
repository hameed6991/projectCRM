using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace apa_pack.Master
{
    public partial class AddEngineer : System.Web.UI.Page
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

            hdnFrom.Value = Request.QueryString["From"];



            //if (Request.QueryString["From"].ToString() == "EditCont")
            //{
            //    hdncontcode.Value = Request.QueryString["ContCode"].ToString();
            //}
            //else
            //{
            //    hdncontcode.Value = "";
            //}


            
            if (!IsPostBack)
            {
                DropDownBind();
                FillEngDada();
 
            }
            
            //EditProdDada();


            if (hdnFrom.Value == "Add")
            {
                main2.Visible = false;
                main.Visible = true;
                btAdd.Visible = false;
                btview.Visible = true;
            }
            else
            {
                main2.Visible = true;
                main.Visible = false;
                btAdd.Visible = true;
                btview.Visible = false;
            }





        }

        protected void DropDownBind()
        {


            string strSql = "";
            con.Open();

            strSql = " select Name from DropDownMast where [key] ='Department' order by Name asc ";

            SqlDataAdapter da = new SqlDataAdapter(strSql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DDDepartment.DataSource = dt;
            DDDepartment.DataTextField = "Name";
            DDDepartment.DataValueField = "Name";
            DDDepartment.DataBind();
            //DDCustomerType.DataValueField = "Name";
            DDDepartment.Items.Insert(0, new ListItem("<- Select ->", ""));

            con.Close();



            string strSql1 = "";
            con.Open();

            strSql1 = " select Name from DropDownMast where [key] ='Designation' order by Name asc ";

            SqlDataAdapter da1 = new SqlDataAdapter(strSql1, con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            DDDesignation.DataSource = dt1;
            DDDesignation.DataTextField = "Name";
            DDDesignation.DataValueField = "Name";
            DDDesignation.DataBind();
            //DDCustomerType.DataValueField = "Name";
            DDDesignation.Items.Insert(0, new ListItem("<- Select ->", ""));

            con.Close();




            string strSql2 = "";
            con.Open();

            strSql2 = " select RegionID as [ID], RegionName as [Name], * from RegionMaster order by Name asc ";

            SqlDataAdapter da2 = new SqlDataAdapter(strSql2, con);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            DDRegion.DataSource = dt2;
            DDRegion.DataTextField = "Name";
            DDRegion.DataValueField = "ID";
            DDRegion.DataBind();
            //DDRegion.DataValueField = "Name";
            DDRegion.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();

        }


        protected void FillEngDada()
        {

            string selectSQL = "  select EngineerCode,EngineerName,MobileNumber,Email,DateOfJoin,Department,Designation,Status from EngineerMaster ";

            con.Open();
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            GridViewEngDetails.DataSource = ds;
            GridViewEngDetails.DataBind();

            //Get perticular value from gridview
            //dnAccCode.Value = GridviewAccountSummary.Rows[1].Cells[2].Text;
            con.Close();

        }



        //void MessageBox(string msg)
        //{
        //    Page page = HttpContext.Current.Handler as Page;
        //    ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + msg + "');", true);
        //}

        //protected void btnsubmitProd_Click(object sender, EventArgs e)
        //{
        //    try
        //    {

        //        if (hdnProdcode.Value == "")
        //        {
        //            con.Open();
        //            SqlCommand cmd = new SqlCommand("ProdMast_Insert", con);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.Add(new SqlParameter("@Mode", "INSERT"));
        //            cmd.Parameters.Add(new SqlParameter("@UpdateProdCode", "INSERT"));
        //            cmd.Parameters.Add(new SqlParameter("@Product", TexProduct.Value));
        //            cmd.Parameters.Add(new SqlParameter("@ProductDesc", TexProdesc.Value));
        //            cmd.Parameters.Add(new SqlParameter("@Principal", TexPrincipal.Value));
        //            cmd.Parameters.Add(new SqlParameter("@ModleNo", TexModleNo.Value));
        //            cmd.Parameters.Add(new SqlParameter("@Rupees", TexAmount.Value));
        //            cmd.Parameters.Add(new SqlParameter("@HSNCode", TexHSNCode1.Value));
        //            cmd.Parameters.Add(new SqlParameter("@CreatedBy", Session["s_student_name"].ToString()));

        //            cmd.ExecuteNonQuery();


        //            Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "<script type=\"text/JavaScript\"language=\"javascript\"> CloseWindow('Saved Successfully');</script>");


        //            con.Close();
        //        }
        //        else
        //        {
        //            con.Open();
        //            SqlCommand cmd = new SqlCommand("ProdMast_Insert", con);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.Add(new SqlParameter("@Mode", "UPDATE"));
        //            cmd.Parameters.Add(new SqlParameter("@UpdateProdCode", hdnProdcode.Value));
        //            cmd.Parameters.Add(new SqlParameter("@Product", TexProduct.Value));
        //            cmd.Parameters.Add(new SqlParameter("@ProductDesc", TexProdesc.Value));
        //            cmd.Parameters.Add(new SqlParameter("@Principal", TexPrincipal.Value));
        //            cmd.Parameters.Add(new SqlParameter("@ModleNo", TexModleNo.Value));
        //            cmd.Parameters.Add(new SqlParameter("@Rupees", TexAmount.Value));
        //            cmd.Parameters.Add(new SqlParameter("@HSNCode", TexHSNCode1.Value));
        //            cmd.Parameters.Add(new SqlParameter("@CreatedBy", Session["s_student_name"].ToString()));

        //            cmd.ExecuteNonQuery();


        //            Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "<script type=\"text/JavaScript\"language=\"javascript\"> CloseWindow('Updated Successfully');</script>");


        //            con.Close();
        //        }





        //    }


        //    catch (Exception ex)
        //    {
        //        MessageBox(ex.Message);
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "<script type=\"text/JavaScript\"language=\"javascript\"> alert('Product Creation SP Error..');</script>");
        //    }
        //}


        protected void EditProdDada()
        {


            string selectSQL = @"  select ProdCode,Product,ProdDesc,ModleNo,Rupees,PSCode,HSNCode from ProdMast where ProdCode='" + hdnProdcode.Value + "' ";

            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //Prod Info

                //TexProduct.Value = reader["Product"].ToString();
                //TexPrincipal.Value = reader["PSCode"].ToString();
                //TexProdesc.Value = reader["ProdDesc"].ToString();
                //TexModleNo.Value = reader["ModleNo"].ToString();
                //TexAmount.Value = reader["Rupees"].ToString();
                //TexHSNCode1.Value = reader["HSNCode"].ToString();



            }
            reader.Close();
            reader.Dispose();

            cmd.Dispose();
            con.Close();

        }



        protected void GridEngCode_Click(object sender, EventArgs e)
        {
            EditProdDada();
        }
       

        protected void GridEngCode_Init(object sender, EventArgs e)
        {
            //EditProdDada();
        }

        protected void btnSaveProd_Click(object sender, EventArgs e)
        {

        }



        protected void GridViewEngDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            main2.Visible = true;
            main.Visible = false;
            btAdd.Visible = true;
            btview.Visible = false;
            GridViewEngDetails.PageIndex = e.NewPageIndex;
            FillEngDada();

        }
         

        protected void btview_Click(object sender, EventArgs e)
        {
            var button = sender as System.Web.UI.HtmlControls.HtmlButton;

            // Get the button's ID
            string buttonId = btview.ID;

            if (buttonId == "btview")
            {
                main2.Visible = true;
                main.Visible = false;
                btAdd.Visible = true;
                btview.Visible = false;
            }

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            var button = sender as System.Web.UI.HtmlControls.HtmlButton;

            // Get the button's ID
            string buttonId = btAdd.ID;

            if (buttonId == "btAdd")
            {
                main2.Visible = false;
                main.Visible = true;
                btAdd.Visible = false;
                btview.Visible = true;
            }
        }

        protected void btnsubmitIns_Click(object sender, EventArgs e)
        {


            try
            {
                 
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_InsertEngineerMaster", con);
                cmd.CommandType = CommandType.StoredProcedure;
 
                cmd.Parameters.AddWithValue("@EngineerName", txtEngineerName.Value);
                cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Value);
                cmd.Parameters.AddWithValue("@AlternateMobileNumber", string.IsNullOrEmpty(txtMobileNumber.Value) ? (object)DBNull.Value : txtMobileNumber.Value);
                cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(txtEmail.Value) ? (object)DBNull.Value : txtEmail.Value);
                if (txtDateofJoining.Value != "")
                {
                    //strSalesOrderDate = datecnv.ConvertDateTime(txtSODate.Value, true);
                    //strSalesOrderDate = Convert.ToDateTime(strSalesOrderDate).ToString("MMM dd, yyyy HH:mm");
                    //scmd.Parameters["@SalesOrderDate"].Value = strSalesOrderDate;

                    cmd.Parameters.AddWithValue("@DateOfJoin", txtDateofJoining.Value);
                   
                }
                else
                {
                    cmd.Parameters.AddWithValue("@DateOfJoin", DBNull.Value);
                }
                cmd.Parameters.AddWithValue("@RegionID", hdnDDRegion.Value);
                cmd.Parameters.AddWithValue("@LocationID", hdnDDLocationZone.Value);
                cmd.Parameters.AddWithValue("@Department", DDDepartment.SelectedValue);
                cmd.Parameters.AddWithValue("@Designation", DDDesignation.SelectedValue);
                cmd.Parameters.AddWithValue("@CreatedBy", Session["s_student_name"].ToString());
                 
                cmd.ExecuteNonQuery();






                Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "CloseWindow('Saved Successfully');", true);

                //Page.RegisterClientScriptBlock("", "<script>alert('Saved Successfully');window.close();</script>");

                con.Close();



            }
            catch (Exception ex)
            {
                Response.Write("Exception: " + ex.ToString());
                 
            }


        }

    }
}