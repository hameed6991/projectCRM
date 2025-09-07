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
    public partial class AddNewProduct : System.Web.UI.Page
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
                FillProdDada();

                
            }

            //EditProdDada();


            if(hdnFrom.Value == "Add")
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


            //string strSql = "";
            //con.Open();

            //strSql = " select Name from DropDownMast where [key] ='Department' order by Name asc ";

            //SqlDataAdapter da = new SqlDataAdapter(strSql, con);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //DDDepartment.DataSource = dt;
            //DDDepartment.DataTextField = "Name";
            //DDDepartment.DataValueField = "Name";
            //DDDepartment.DataBind();
            ////DDCustomerType.DataValueField = "Name";
            //DDDepartment.Items.Insert(0, new ListItem("<- Select ->", ""));

            //con.Close();


 

        }


        protected void FillProdDada()
        {

            string selectSQL = "  select ProdCode,Product,ProdDesc,ModleNo,Rupees,PSCode from ProdMast ";

            con.Open();
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            GridViewProdDetails.DataSource = ds;
            GridViewProdDetails.DataBind();

            //Get perticular value from gridview
            //dnAccCode.Value = GridviewAccountSummary.Rows[1].Cells[2].Text;
            con.Close();

        }
 


        void MessageBox(string msg)
        {
            Page page = HttpContext.Current.Handler as Page;
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + msg + "');", true);
        }

        protected void btnsubmitProd_Click(object sender, EventArgs e)
        {
            try
            {

                if(hdnProdcode.Value == "")
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("ProdMast_Insert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Mode", "INSERT"));
                    cmd.Parameters.Add(new SqlParameter("@UpdateProdCode", "INSERT"));
                    cmd.Parameters.Add(new SqlParameter("@Product", TexProduct.Value));
                    cmd.Parameters.Add(new SqlParameter("@ProductDesc", TexProdesc.Value));
                    cmd.Parameters.Add(new SqlParameter("@Principal", TexPrincipal.Value));
                    cmd.Parameters.Add(new SqlParameter("@ModleNo", TexModleNo.Value));
                    cmd.Parameters.Add(new SqlParameter("@Rupees", TexAmount.Value));
                    cmd.Parameters.Add(new SqlParameter("@HSNCode", TexHSNCode1.Value));
                    cmd.Parameters.Add(new SqlParameter("@CreatedBy", Session["s_student_name"].ToString()));

                    cmd.ExecuteNonQuery();


                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "<script type=\"text/JavaScript\"language=\"javascript\"> CloseWindow('Saved Successfully');</script>");


                    con.Close();
                }
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("ProdMast_Insert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Mode", "UPDATE"));
                    cmd.Parameters.Add(new SqlParameter("@UpdateProdCode", hdnProdcode.Value));
                    cmd.Parameters.Add(new SqlParameter("@Product", TexProduct.Value));
                    cmd.Parameters.Add(new SqlParameter("@ProductDesc", TexProdesc.Value));
                    cmd.Parameters.Add(new SqlParameter("@Principal", TexPrincipal.Value));
                    cmd.Parameters.Add(new SqlParameter("@ModleNo", TexModleNo.Value));
                    cmd.Parameters.Add(new SqlParameter("@Rupees", TexAmount.Value));
                    cmd.Parameters.Add(new SqlParameter("@HSNCode", TexHSNCode1.Value));
                    cmd.Parameters.Add(new SqlParameter("@CreatedBy", Session["s_student_name"].ToString()));

                    cmd.ExecuteNonQuery();


                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "<script type=\"text/JavaScript\"language=\"javascript\"> CloseWindow('Updated Successfully');</script>");


                    con.Close();
                }
                




            }


            catch (Exception ex)
            {
                MessageBox(ex.Message);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "<script type=\"text/JavaScript\"language=\"javascript\"> alert('Product Creation SP Error..');</script>");
            }
        }


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
                
                TexProduct.Value = reader["Product"].ToString();
                TexPrincipal.Value = reader["PSCode"].ToString();
                TexProdesc.Value = reader["ProdDesc"].ToString();
                TexModleNo.Value = reader["ModleNo"].ToString();
                TexAmount.Value = reader["Rupees"].ToString();
                TexHSNCode1.Value = reader["HSNCode"].ToString();
                 
 

            }
            reader.Close();
            reader.Dispose();

            cmd.Dispose();
            con.Close();

        }

        protected void GridProdCode_Click(object sender, EventArgs e)
        {
            EditProdDada();
        }

        protected void GridProdCode_Init(object sender, EventArgs e)
        {
            //EditProdDada();
        }

        protected void btnSaveProd_Click(object sender, EventArgs e)
        {

        }

        protected void GridViewProdDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            main2.Visible = true;
            main.Visible = false;
            btAdd.Visible = true;
            btview.Visible = false;
            GridViewProdDetails.PageIndex = e.NewPageIndex;
            FillProdDada();
            
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
    }
}