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
    public partial class AddContack : System.Web.UI.Page
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

             

            hdnAccCode.Value = Request.QueryString["AccCode"];

             

            if(Request.QueryString["From"].ToString() == "EditCont")
            {
                hdncontcode.Value = Request.QueryString["ContCode"].ToString();
            }
            else
            {
                hdncontcode.Value = "";
            }


 

            if (!IsPostBack)
            {
                DropDownBind();
                FillContactDada();
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

            strSql2 = " select Name from DropDownMast where [key] ='Salutation' order by Name asc ";

            SqlDataAdapter da2 = new SqlDataAdapter(strSql2, con);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            DDSalutation.DataSource = dt2;
            DDSalutation.DataTextField = "Name";
            DDSalutation.DataValueField = "Name";
            DDSalutation.DataBind();
            //DDSalutation.DataValueField = "Name";
            DDSalutation.Items.Insert(0, new ListItem("None", ""));

            con.Close();



        }


        protected void FillContactDada()
        {


            con.Open();
            string selectSQL = @"  select ContCode,Name,Salutation,Designation,Department,MobileNo,EMail,Phone 
                                   from ContMast where ContCode='" + hdncontcode.Value + "' ";


            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader = cmd.ExecuteReader(); 
            while (reader.Read())
            {
                //Contact Info
                DDSalutation.SelectedValue = reader["Salutation"].ToString();
                txtName.Value = reader["Name"].ToString();
                DDDesignation.SelectedValue = reader["Designation"].ToString();
                DDDepartment.SelectedValue = reader["Department"].ToString();
                Texmobileno.Value = reader["MobileNo"].ToString();
                TexEmail.Value = reader["EMail"].ToString();
                txtPhone.Value = reader["Phone"].ToString();
                

            }
            reader.Close();
            reader.Dispose();

            cmd.Dispose();
            con.Close();



        }




        protected void btnSubmit_ServerClick(object sender, EventArgs e)
        {

            
             
            try
            {

 
                if (hdncontcode.Value != "")
                {

                    con.Open();
                    SqlCommand cmd = new SqlCommand("ContMast_Update", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@ContCode", hdncontcode.Value));
                    cmd.Parameters.Add(new SqlParameter("@Name", txtName.Value));
                    cmd.Parameters.Add(new SqlParameter("@Salutation", DDSalutation.SelectedValue));
                    cmd.Parameters.Add(new SqlParameter("@Designation", DDDesignation.SelectedValue.Trim()));
                    cmd.Parameters.Add(new SqlParameter("@Department", DDDepartment.SelectedValue.Trim()));
                    cmd.Parameters.Add(new SqlParameter("@Mobile", Texmobileno.Value));
                    cmd.Parameters.Add(new SqlParameter("@Email", TexEmail.Value));
                    cmd.Parameters.Add(new SqlParameter("@Phone", txtPhone.Value));
    
                    cmd.Parameters.Add(new SqlParameter("@AccCode", hdnAccCode.Value));
                    cmd.Parameters.Add(new SqlParameter("@ModifiedBy", Session["s_student_name"].ToString()));
                    cmd.ExecuteNonQuery();



                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "<script type=\"text/JavaScript\"language=\"javascript\"> CloseModal('Updated Successfully');</script>");


                    con.Close();
                }
                else
                {


                    con.Open();
                    SqlCommand cmd = new SqlCommand("ContMast_Insert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Salutation", DDSalutation.SelectedValue));
                    cmd.Parameters.Add(new SqlParameter("@Name", txtName.Value));
                    cmd.Parameters.Add(new SqlParameter("@Mobile", Texmobileno.Value));
                    cmd.Parameters.Add(new SqlParameter("@Phone", txtPhone.Value));
                    cmd.Parameters.Add(new SqlParameter("@Email", TexEmail.Value));
                    cmd.Parameters.Add(new SqlParameter("@Department", DDDepartment.SelectedValue.Trim()));
                    cmd.Parameters.Add(new SqlParameter("@Designation", DDDesignation.SelectedValue.Trim()));
                    cmd.Parameters.Add(new SqlParameter("@AccCode", hdnAccCode.Value));
                    cmd.Parameters.Add(new SqlParameter("@CreatedBy", Session["s_student_name"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("@KeyGen1", SqlDbType.VarChar, 50, ParameterDirection.Output, false, 0, 10, "ResOut", DataRowVersion.Default, null));
                    cmd.ExecuteNonQuery();
                     

                    hdncontcode.Value = cmd.Parameters["@KeyGen1"].Value.ToString();
                    //string Module = Request.QueryString["Module"];
                    

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "<script type=\"text/JavaScript\"language=\"javascript\"> CloseModal('Saved Successfully');</script>");

                    con.Close();
                }
            }


            catch (Exception ex)
            {
                MessageBox(ex.Message);

            }

        }


        void MessageBox(string msg)
        {
            Page page = HttpContext.Current.Handler as Page;
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + msg + "');", true);
        }

        protected void btnlock_ServerClick(object sender, EventArgs e)
        {

            try
            {

 
                con.Open();
                SqlCommand cmd = new SqlCommand("ContMast_Delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@ContCode", hdncontcode.Value));
                
                cmd.ExecuteNonQuery();

 
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "<script type=\"text/JavaScript\"language=\"javascript\"> CloseModal('Deleted Successfully');</script>");


                con.Close();

            }
            catch (Exception ex)
            {
                MessageBox(ex.Message);

            }

        }
    }
}