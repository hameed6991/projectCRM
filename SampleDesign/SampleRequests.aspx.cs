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
    public partial class SampleRequests : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");
        DataTable dt;

        private static DataRow copiedRow = null;



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

                gvPaperCombination.DataSource = null;
                gvPaperCombination.DataBind();



                string currentDate = DateTime.Now.ToString("dd/MM/yyyy HH:mm");
                txtRequestDate1.Value = currentDate;


            }






        }



        protected void DropDownBind()
        {
            //Response.Write("DropDownBind" + "..." + hdnAccCode.Value);




            string strSql = "";
            con.Open();

            strSql = " select EngineerCode as [ID], EngineerName as [Name] from EngineerMaster ";

            SqlDataAdapter da = new SqlDataAdapter(strSql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DDSalesExecutive.DataSource = dt;
            DDSalesExecutive.DataTextField = "Name";
            DDSalesExecutive.DataValueField = "ID";
            DDSalesExecutive.DataBind();
            //DDSalesExecutive.DataValueField = "Name";
            DDSalesExecutive.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();



            con.Open();
            string strSql5 = " select Name from DropDownMast where [key] ='SampleRequest_Type' order by Name asc ";
            SqlDataAdapter da5 = new SqlDataAdapter(strSql5, con);
            DataTable dt5 = new DataTable();
            da5.Fill(dt5);
            DDSampleRequestType.DataSource = dt5;
            DDSampleRequestType.DataTextField = "Name";
            DDSampleRequestType.DataValueField = "Name";
            DDSampleRequestType.DataBind();
            //DDSampleRequestType.DataValueField = "Name";
            DDSampleRequestType.Items.Insert(0, new ListItem("<-Select->", ""));
            con.Close();
             

            con.Open();
            string strSql6 = " select Name from DropDownMast where [key] ='SampleRequest_Priority' order by Name asc ";
            SqlDataAdapter da6 = new SqlDataAdapter(strSql6, con);
            DataTable dt6 = new DataTable();
            da6.Fill(dt6);
            DDPriority.DataSource = dt6;
            DDPriority.DataTextField = "Name";
            DDPriority.DataValueField = "Name";
            DDPriority.DataBind();
            //DDPriority.DataValueField = "Name";
            DDPriority.Items.Insert(0, new ListItem("<-Select->", ""));
            con.Close();



            string SqlPly = "";
            con.Open();

            SqlPly = " select Name from DropDownMast where [key] ='PLY' order by Name asc  ";

            SqlDataAdapter daPly = new SqlDataAdapter(SqlPly, con);
            DataTable dtPly = new DataTable();
            daPly.Fill(dtPly);
            DDPly.DataSource = dtPly;
            DDPly.DataTextField = "Name";
            DDPly.DataValueField = "Name";
            DDPly.DataBind();
            //DDPly.DataValueField = "Name";
            DDPly.Items.Insert(0, new ListItem("<-Select->", ""));

            con.Close();




            string SqlDT = "";
            con.Open();

            SqlDT = " select Name from DropDownMast where [key] ='SampleRequest_DesignType' order by Name asc  ";

            SqlDataAdapter daDT = new SqlDataAdapter(SqlDT, con);
            DataTable dtDT = new DataTable();
            daDT.Fill(dtDT);
            DDDesignType.DataSource = dtDT;
            DDDesignType.DataTextField = "Name";
            DDDesignType.DataValueField = "Name";
            DDDesignType.DataBind();
            //DDDesignType.DataValueField = "Name";
            DDDesignType.Items.Insert(0, new ListItem("<-Select->", ""));

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


        protected void btnsubmitIns_Click(object sender, EventArgs e)
        {



            //------------------------------------------------------------- Add Sample Details



            string ReturnValue = string.Empty;  string Alert = string.Empty; string OutSampleCode = "";

            try
            {

                SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");

                if (con.State != ConnectionState.Open)
                    con.Open();


                SqlCommand scmd = new SqlCommand("SP_AddSampleRequestMaster", con);
                scmd.CommandType = CommandType.StoredProcedure;

                // Parameters (match your SP_AddSampleRequestMaster)
                scmd.Parameters.AddWithValue("@CustomerName", txtCustomerName.Value);

                scmd.Parameters.Add(new SqlParameter("@RequestDate", SqlDbType.DateTime, 50, "RequestDate"));
                if (txtRequestDate1.Value != "")
                {

                    string RequestDate = ConvertDateTime(txtRequestDate1.Value, true);
                    RequestDate = Convert.ToDateTime(RequestDate).ToString("MMM dd, yyyy HH:mm");
                   
                    scmd.Parameters["@RequestDate"].Value = RequestDate;
                }
                else
                {
                    scmd.Parameters["@RequestDate"].Value = DBNull.Value;
                }
                scmd.Parameters.AddWithValue("@ContactPerson", txtContactPerson.Value);
                scmd.Parameters.AddWithValue("@SalesExecutive", DDSalesExecutive.SelectedValue);
                scmd.Parameters.AddWithValue("@SampleRequestType", DDSampleRequestType.SelectedValue);
                scmd.Parameters.AddWithValue("@Priority", DDPriority.SelectedValue);
                scmd.Parameters.AddWithValue("@Comments", txtComments.Value);

                scmd.Parameters.AddWithValue("@LengthMM", string.IsNullOrEmpty(txtLength.Value) ? (object)DBNull.Value : Convert.ToDecimal(txtLength.Value));
                scmd.Parameters.AddWithValue("@WidthMM", string.IsNullOrEmpty(txtWidth.Value) ? (object)DBNull.Value : Convert.ToDecimal(txtWidth.Value));
                scmd.Parameters.AddWithValue("@HeightMM", string.IsNullOrEmpty(txtHeight.Value) ? (object)DBNull.Value : Convert.ToDecimal(txtHeight.Value));

                scmd.Parameters.AddWithValue("@ReelSizeMM", string.IsNullOrEmpty(txtReelSize.Value) ? (object)DBNull.Value : Convert.ToDecimal(txtReelSize.Value));
                scmd.Parameters.AddWithValue("@CuttingSizeMM", string.IsNullOrEmpty(txtCuttingSize.Value) ? (object)DBNull.Value : Convert.ToDecimal(txtCuttingSize.Value));

                scmd.Parameters.AddWithValue("@Ply", string.IsNullOrEmpty(DDPly.SelectedValue) ? (object)DBNull.Value : Convert.ToInt32(DDPly.SelectedValue));
                scmd.Parameters.AddWithValue("@SampleDescription", txtSampleDescription.Value);
                scmd.Parameters.AddWithValue("@DesignType", DDDesignType.SelectedValue);

                scmd.Parameters.AddWithValue("@RequestQuantity", string.IsNullOrEmpty(txtRequestQuantity.Value) ? (object)DBNull.Value : Convert.ToInt32(txtRequestQuantity.Value));
                scmd.Parameters.AddWithValue("@PaperCombination", hdnGridPaperCombinationData.Value);
                


                scmd.Parameters.AddWithValue("@SampleStatus", "Open");

                scmd.Parameters.AddWithValue("@CreatedBy", Session["s_student_name"].ToString());


                // Output parameter
                SqlParameter outParam = new SqlParameter("@OutSampleCode", SqlDbType.VarChar, 50);
                outParam.Direction = ParameterDirection.Output;
                scmd.Parameters.Add(outParam);



                // Execute
                scmd.ExecuteNonQuery();
                scmd.Dispose();







                // Get output value
                OutSampleCode = scmd.Parameters["@OutSampleCode"].Value.ToString();
                









                // Save Paper Combination



                if (ViewState["PaperData"] == null) return;

                // First save current grid values into ViewState
                SaveCurrentGridToViewState();


                DataTable dt = (DataTable)ViewState["PaperData"];

                 
                    foreach (DataRow row in dt.Rows)
                    {
                        using (SqlCommand cmd = new SqlCommand(@"
                INSERT INTO PaperCombination 
                (SrNo,SampleCode, Ply, Flute, GSM, BF, Shade, Size, [SizeInches], Weight) 
                VALUES (@SrNo,@SampleCode, @Ply, @Flute, @GSM, @BF, @Shade, @Size, @SizeInches, @Weight)", con))
                        {
                            cmd.Parameters.AddWithValue("@SrNo", row["SrNo"]);
                             cmd.Parameters.AddWithValue("@SampleCode", OutSampleCode);
                            cmd.Parameters.AddWithValue("@Ply", row["Ply"]);
                            cmd.Parameters.AddWithValue("@Flute", row["Flute"]);
                            cmd.Parameters.AddWithValue("@GSM", row["GSM"]);
                            cmd.Parameters.AddWithValue("@BF", row["BF"]);
                            cmd.Parameters.AddWithValue("@Shade", row["Shade"]);
                            cmd.Parameters.AddWithValue("@Size", row["Size"]);
                            cmd.Parameters.AddWithValue("@SizeInches", row["Size(Inches)"]);
                            cmd.Parameters.AddWithValue("@Weight", row["Weight"]);

                            cmd.ExecuteNonQuery();
                        }
                    }
                



                if (con.State != ConnectionState.Closed)
                    con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
                //ReturnValue = ex.Message.Replace("'", " ");
                if (con.State != ConnectionState.Closed)
                    con.Close();
            }


             Page.RegisterClientScriptBlock("", "<script>Closefun('" + OutSampleCode + "');</script>");


        }





        protected void DDPly_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (DDPly.SelectedValue != "")
            {


                int plyCount = int.Parse(DDPly.SelectedValue);
                if (plyCount > 0)
                {
                    BindDynamicRows(plyCount);
                }
                else
                {
                    gvPaperCombination.DataSource = null;
                    gvPaperCombination.DataBind();
                }


            }
            else
            {
                gvPaperCombination.DataSource = null;
                gvPaperCombination.DataBind();
            }


        }

        private DataTable CreateTableStructure()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("SrNo", typeof(int));
            dt.Columns.Add("Ply", typeof(string));
            dt.Columns.Add("Flute", typeof(string));
            dt.Columns.Add("GSM", typeof(string));
            dt.Columns.Add("BF", typeof(string));
            dt.Columns.Add("Shade", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("Size(Inches)", typeof(string));
            dt.Columns.Add("Weight", typeof(string));
            return dt;
        }


        private void BindDynamicRows(int plyCount)
        {
            DataTable dt = CreateTableStructure();
            string[] plyNames = { "Top", "Flute 1", "Liner 1", "Flute 2", "Liner 2" };

            for (int i = 0; i < plyCount; i++)
            {
                string plyName = i < plyNames.Length ? plyNames[i] : "Ply " + (i + 1);
                dt.Rows.Add(i + 1, plyName, "A Flute", "", "", "White", 0,0,0);
            }

            ViewState["PaperData"] = dt;
            gvPaperCombination.DataSource = dt;
            gvPaperCombination.DataBind();
        }


        private void SaveCurrentGridToViewState()
        {
            DataTable dt = CreateTableStructure();

            foreach (GridViewRow row in gvPaperCombination.Rows)
            {

                int srNo = Convert.ToInt32(gvPaperCombination.DataKeys[row.RowIndex].Value);
                string ply = row.Cells[1].Text;
                string flute = ((DropDownList)row.FindControl("ddlFlute")).SelectedValue;
                string gsm = ((TextBox)row.FindControl("txtGSM")).Text;
                string bf = ((TextBox)row.FindControl("txtBF")).Text;
                string shade = ((DropDownList)row.FindControl("ddlShade")).SelectedValue;

                dt.Rows.Add(srNo, ply, flute, gsm, bf, shade,0,0,0);

                //hdnGridPaperCombinationData.Value += ply + "||" + flute + "||" + gsm + "||" + bf + "||" + shade + "~~";
            }

            ViewState["PaperData"] = dt;
        }


        protected void gvPaperCombination_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (ViewState["PaperData"] == null) return;

            SaveCurrentGridToViewState();
            DataTable dt = (DataTable)ViewState["PaperData"];

            int rowIndex = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "CopyRow")
            {
                copiedRow = dt.Rows[rowIndex];
            }
            else if (e.CommandName == "PasteRow" && copiedRow != null)
            {

                dt.Rows[rowIndex]["GSM"] = copiedRow["GSM"];
                dt.Rows[rowIndex]["BF"] = copiedRow["BF"];
                dt.Rows[rowIndex]["Shade"] = copiedRow["Shade"];

                ViewState["PaperData"] = dt;
                gvPaperCombination.DataSource = dt;
                gvPaperCombination.DataBind();

            }


        }

        protected void gvPaperCombination_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drv = (DataRowView)e.Row.DataItem;

                // --- Flute Dropdown ---
                DropDownList ddlFlute = (DropDownList)e.Row.FindControl("ddlFlute");
                if (ddlFlute != null && drv["Flute"] != DBNull.Value)
                {
                    if (ddlFlute.Items.FindByValue(drv["Flute"].ToString()) != null)
                        //ddlFlute.SelectedValue = ddlFlute.Items.FindByText(drv["Flute"].ToString()).Value;
                        ddlFlute.SelectedValue = drv["Flute"].ToString();
                }

                // --- Shade Dropdown ---
                DropDownList ddlShade = (DropDownList)e.Row.FindControl("ddlShade");
                if (ddlShade != null && drv["Shade"] != DBNull.Value)
                {
                    if (ddlShade.Items.FindByValue(drv["Shade"].ToString()) != null)
                        ddlShade.SelectedValue = drv["Shade"].ToString();
                }
            }

        }






        //private void BindGrid()
        //{
        //    dt = new DataTable();
        //    dt.Columns.Add("SrNo");
        //    dt.Columns.Add("Ply");
        //    dt.Columns.Add("Flute");
        //    dt.Columns.Add("GSM");
        //    dt.Columns.Add("BF");
        //    dt.Columns.Add("Shade");
        //    dt.Columns.Add("Size");
        //    dt.Columns.Add("SizeInch");
        //    dt.Columns.Add("Weight");
        //    dt.Columns.Add("MillName");
        //    dt.Columns.Add("RCT");
        //    dt.Columns.Add("PaperValue");

        //    // Sample rows
        //    dt.Rows.Add("1", "Top", "", "", "", "", "0", "0.00", "0.00", "", "0", "0.00");
        //    dt.Rows.Add("2", "Flute 1", "", "", "", "", "0", "0.00", "0.00", "", "0", "0.00");
        //    dt.Rows.Add("3", "Liner 1", "", "", "", "", "0", "0.00", "0.00", "", "0", "0.00");

        //    gvPaperCombination.DataSource = dt;
        //    gvPaperCombination.DataBind();

        //    ViewState["PaperData"] = dt;
        //}

        //protected void gvPaperCombination_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "CopyRow")
        //    {
        //        int index = Convert.ToInt32(e.CommandArgument);
        //        DataTable dt = (DataTable)ViewState["PaperData"];
        //        Session["CopiedRow"] = dt.Rows[index].ItemArray;
        //    }
        //    else if (e.CommandName == "PasteRow")
        //    {
        //        if (Session["CopiedRow"] != null)
        //        {
        //            int index = Convert.ToInt32(e.CommandArgument);
        //            DataTable dt = (DataTable)ViewState["PaperData"];
        //            object[] copiedData = (object[])Session["CopiedRow"];

        //            // Paste values except SrNo & Ply (if needed)
        //            for (int i = 2; i < copiedData.Length; i++)
        //            {
        //                dt.Rows[index][i] = copiedData[i];
        //            }

        //            gvPaperCombination.DataSource = dt;
        //            gvPaperCombination.DataBind();
        //            ViewState["PaperData"] = dt;
        //        }
        //    }

        //}


    }
}