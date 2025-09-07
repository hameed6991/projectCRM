using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data; 

namespace apa_pack
{
    public partial class finance : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridincomeviewdetails();
                gridpayviewdetails();
            }
            if (Session["s_student_name"] != null)
            {
                Label1.Text = Session["s_student_name"].ToString();
            }
            else
            {
                Response.Redirect("apalogin.aspx");
            }
            filltotalvaluein();
            filltotalvalueout();
            dateformate();
            fillmonthwiseincome();
            fillmonthwisepay();


        }
        void dateformate()
        {
            DateTime today = DateTime.Today;
            hdncorrentdate.Value = today.ToString("dd/MM/yyyy");
            int correntmonth = DateTime.Now.Month;
            hdncorrentmonth.Value = correntmonth.ToString();
            //Response.Write(hdncorrentmonth.Value);
            //Response.End();
        }
        protected void but_Logout_Click(object sender, EventArgs e)
        {

            if (Session["s_student_name"] != null)
            {
                Session.Abandon();
                Response.Redirect("apalogin.aspx");
            }
        }
        
        void filltotalvaluein()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Total_Amount FROM incomedetails WHERE income_id=(SELECT max(income_id) FROM incomedetails)", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                hdnincometotalvalue.Value = dr["Total_Amount"].ToString();
                txt_totalamount_in.Text = hdnincometotalvalue.Value;
            }
            con.Close();
        }
        void filltotalvalueout()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Totaloutgo_Amoount FROM outgodetails WHERE Outgo_id=(SELECT max(Outgo_id) FROM outgodetails)", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                hdnoutgototalvalue.Value = dr["Totaloutgo_Amoount"].ToString();
                Tex_totalamount_out.Text = hdnoutgototalvalue.Value;
            }
            con.Close();
        }
        void fillmonthwiseincome()
        {
            con.Open();
            string query = "";
            query = "SELECT Jan_income_amount,Feb_income_amount,Mar_income_amount, Apl_income_amount,May_income_amount,Jun_income_amount, ";
            query += "Juy_income_amount,Agt_income_amount,Sep_income_amount,Oct_income_amount,Nov_income_amount,Des_income_amount ";
            query += "FROM incomedetails WHERE income_id=(SELECT max(income_id) FROM incomedetails)"; 
            
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                hdnLabjanina1.Value = dr["Jan_income_amount"].ToString();
                Labjanina1.Text = hdnLabjanina1.Value;

                hdnLabfebina2.Value = dr["Feb_income_amount"].ToString();
                Labfebina2.Text = hdnLabfebina2.Value;

                hdnLabmarina3.Value = dr["Mar_income_amount"].ToString();
                Labmarina3.Text = hdnLabmarina3.Value;

                hdnLabaplina4.Value = dr["Apl_income_amount"].ToString();
                Labaplina4.Text = hdnLabaplina4.Value;

                hdnLabmayin5.Value = dr["May_income_amount"].ToString();
                Labmayina5.Text = hdnLabmayin5.Value;

                hdnLabjunin6.Value = dr["Jun_income_amount"].ToString();
                Labjunina6.Text = hdnLabjunin6.Value;

                hdnLabjuyina7.Value = dr["Juy_income_amount"].ToString();
                Labjuyina7.Text = hdnLabjuyina7.Value;

                hdnLabaugina8.Value = dr["Agt_income_amount"].ToString();
                Labaugina8.Text = hdnLabaugina8.Value;

                hdnLabsepina9.Value = dr["Sep_income_amount"].ToString();
                Labsepina9.Text = hdnLabsepina9.Value;

                hdnLaboctina10.Value = dr["Oct_income_amount"].ToString();
                Laboctina10.Text = hdnLaboctina10.Value;

                hdnLabnovina11.Value = dr["Nov_income_amount"].ToString();
                Labnovina11.Text = hdnLabnovina11.Value;

                hdnLabdesina12.Value = dr["Des_income_amount"].ToString();
                Labdesina12.Text = hdnLabdesina12.Value;






            }
            con.Close();
        }

        void gridincomeviewdetails()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from incomedetails", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Gridincomeviewdetails.DataSource = ds;
            Gridincomeviewdetails.DataBind();
            con.Close();
        }
        void gridpayviewdetails()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select Outgo_id,Out_Date,Out_To,Outgo_Amount,Totaloutgo_Amoount from outgodetails", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Gridviewpaydetails.DataSource = ds;
            Gridviewpaydetails.DataBind();
            con.Close();
        }
        protected void Gridincomeviewdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            
                Gridincomeviewdetails.PageIndex = e.NewPageIndex;
                gridincomeviewdetails();
            
                Gridviewpaydetails.PageIndex = e.NewPageIndex;
                gridpayviewdetails();
            
            
        }
        protected void butadd_Click(object sender, EventArgs e)
        {    
            SqlCommand cmd = new SqlCommand("sp_incomedetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Income_id", SqlDbType.Int);
            cmd.Parameters.AddWithValue("@Income_Date", tex_date.Text);

            String[] array = new string[] { txt_company.Text };
            //Response.Write(array[0]);
            //Response.End();

            cmd.Parameters.AddWithValue("@Income_From", txt_company.Text);
            cmd.Parameters.AddWithValue("@Income_Amount", txt_amount.Text);

            if (!String.IsNullOrEmpty(txt_amount.Text))
            {
                int a, b;
                a = int.Parse(txt_amount.Text);
                b = int.Parse(hdnincometotalvalue.Value);
                txt_totalamount_in.Text = (a + b).ToString();
            }
            cmd.Parameters.AddWithValue("@Total_Amount", txt_totalamount_in.Text);

            
            if(hdncorrentmonth.Value == "1")
            {
                Labjanina1.Text = txt_totalamount_in.Text;
                cmd.Parameters.AddWithValue("@Jan_income_Amount", txt_totalamount_in.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Jan_income_Amount", 0);
            }
            if(hdncorrentmonth.Value == "2")
            {
                Labfebina2.Text = txt_totalamount_in.Text;
                cmd.Parameters.AddWithValue("@Feb_income_Amount", Labfebpaya2.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Feb_income_Amount", 0);
            }
            if(hdncorrentmonth.Value == "3")
            {
                Labmarina3.Text = txt_totalamount_in.Text;
                cmd.Parameters.AddWithValue("@Mar_income_Amount", Labmarina3.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Mar_income_Amount", 0);
            }
            if(hdncorrentmonth.Value == "4")
            {
                Labaplina4.Text = txt_totalamount_in.Text;
                cmd.Parameters.AddWithValue("@Apl_income_Amount", Labaplina4.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Apl_income_Amount", 0);
            }
            if(hdncorrentmonth.Value == "5")
            {
                Labmayina5.Text = txt_totalamount_in.Text;
                cmd.Parameters.AddWithValue("@May_income_Amount", Labmayina5.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@May_income_Amount", 0);
            }
            if (hdncorrentmonth.Value == "6")
            {
                Labjunina6.Text = txt_totalamount_in.Text;
                cmd.Parameters.AddWithValue("@Jun_income_Amount", Labjunina6.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Jun_income_Amount", 0);
            }
            if(hdncorrentmonth.Value == "7")
            {
                Labjuyina7.Text = txt_totalamount_in.Text;
                cmd.Parameters.AddWithValue("@Juy_income_Amount", Labjuyina7.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Juy_income_Amount", 0);
            }
            if(hdncorrentmonth.Value == "8")
            {
                Labaugina8.Text = txt_totalamount_in.Text;
                
                cmd.Parameters.AddWithValue("@Agt_income_Amount", Labaugina8.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Agt_income_Amount", 0);
            }
            if(hdncorrentmonth.Value == "9")
            {
                Labsepina9.Text = txt_totalamount_in.Text;
                cmd.Parameters.AddWithValue("@Sep_income_Amount", Labsepina9.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Sep_income_Amount", 0);
            }
            if (hdncorrentmonth.Value == "10")
            {
                Laboctina10.Text = txt_totalamount_in.Text;
                cmd.Parameters.AddWithValue("@Oct_income_Amount", Laboctina10.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Oct_income_Amount", 0);
            }
            if(hdncorrentmonth.Value == "11")
            {
                Labnovina11.Text = txt_totalamount_in.Text;
                cmd.Parameters.AddWithValue("@Nov_income_Amount", Labnovina11.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Nov_income_Amount", 0);
            }
            if(hdncorrentmonth.Value == "12")
            {
                Labdesina12.Text = txt_totalamount_in.Text; 
                cmd.Parameters.AddWithValue("@Des_income_Amount", Labdesina12.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Des_income_Amount", 0);
            }
            

            con.Open();
            cmd.ExecuteNonQuery();      
            con.Close();
            clear();
            fillmonthwiseincome();
            

        }

        void fillmonthwisepay()
        {
            con.Open();
            string query = "";
            query = "SELECT Jan_Pay_amount,Jan_saving_amount,Feb_Pay_amount,Feb_saving_amount, Mar_Pay_amount,Mar_saving_amount,Apl_Pay_amount,Apl_saving_amount, ";
            query += "May_Pay_amount,May_saving_amount,Jun_Pay_amount,Jun_saving_amount,Juy_Pay_amount,Juy_saving_amount,Agt_Pay_amount,Agt_saving_amount, ";
            query += "Sep_Pay_amount,Sep_saving_amount,Oct_Pay_amount,Oct_saving_amount,Nov_Pay_amount,Nov_saving_amount,Des_Pay_amount,Des_saving_amount ";
            query += "FROM outgodetails WHERE Outgo_id=(SELECT max(Outgo_id) FROM outgodetails)";

            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                hdnLabjanpaya1.Value = dr["Jan_pay_amount"].ToString();
                hdnLabjansavea1.Value = dr["Jan_saving_amount"].ToString();

                Labjanpaya1.Text = hdnLabjanpaya1.Value;
                Labjansavea1.Text = hdnLabjansavea1.Value;


                hdnLabfebpaya2.Value = dr["Feb_pay_amount"].ToString();
                hdnLabfebsavea2.Value = dr["Feb_saving_amount"].ToString();

                Labfebpaya2.Text = hdnLabfebpaya2.Value;
                Labfebsavea2.Text = hdnLabfebsavea2.Value;


                hdnLabmarpaya3.Value = dr["Mar_pay_amount"].ToString();
                hdnLabmarsavea3.Value = dr["Mar_saving_amount"].ToString();

                Labmarpaya3.Text = hdnLabmarpaya3.Value;
                Labmarsavea3.Text = hdnLabmarsavea3.Value;


                hdnLabaplpaya4.Value = dr["Apl_pay_amount"].ToString();
                hdnLabaplsavea4.Value = dr["Apl_saving_amount"].ToString();

                Labaplpaya4.Text = hdnLabaplpaya4.Value;
                Labaplsavea4.Text = hdnLabaplsavea4.Value;


                hdnLabmaypay5.Value = dr["May_pay_amount"].ToString();
                hdnLabmaysave5.Value = dr["May_saving_amount"].ToString();

                Labmaypaya5.Text = hdnLabmaypay5.Value;
                Labmaysavea5.Text = hdnLabmaysave5.Value;


                hdnLabjunpay6.Value = dr["Jun_pay_amount"].ToString();
                hdnLabjunsave6.Value = dr["Jun_saving_amount"].ToString();

                Labjunpaya6.Text = hdnLabjunpay6.Value;
                Labjunsavea6.Text = hdnLabjunsave6.Value;


                hdnLabjuypaya7.Value = dr["Juy_pay_amount"].ToString();
                hdnLabjuysavea7.Value = dr["Juy_saving_amount"].ToString();

                Labjuypaya7.Text = hdnLabjuypaya7.Value;
                Labjuysavea7.Text = hdnLabjuysavea7.Value;


                hdnLabaugpaya8.Value = dr["Agt_pay_amount"].ToString();
                hdnLabaugsavea8.Value = dr["Agt_saving_amount"].ToString();

                Labaugpaya8.Text = hdnLabaugpaya8.Value;
                Labaugsavea8.Text = hdnLabaugsavea8.Value;


                hdnLabseppaya9.Value = dr["Sep_pay_amount"].ToString();
                hdnLabsepsavea9.Value = dr["Sep_saving_amount"].ToString();

                Labseppaya9.Text = hdnLabseppaya9.Value;
                Labsepsavea9.Text = hdnLabsepsavea9.Value;


                hdnLaboctpaya10.Value = dr["Oct_pay_amount"].ToString();
                hdnLaboctsavea10.Value = dr["Oct_saving_amount"].ToString();

                Laboctpaya10.Text = hdnLaboctpaya10.Value;
                Laboctsavea10.Text = hdnLaboctsavea10.Value;


                hdnLabnovpaya11.Value = dr["Nov_pay_amount"].ToString();
                hdnLabnovsavea11.Value = dr["Nov_saving_amount"].ToString();

                Labnovpaya11.Text = hdnLabnovpaya11.Value;
                Labnovsavea11.Text = hdnLabnovsavea11.Value;


                hdnLabdespaya12.Value = dr["Des_pay_amount"].ToString();
                hdnLabdessavea12.Value = dr["Des_saving_amount"].ToString();

                Labdespaya12.Text = hdnLabdespaya12.Value;
                Labdessavea12.Text = hdnLabdessavea12.Value;

            }
            con.Close();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            
            SqlCommand cmd = new SqlCommand("sp_outgodetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Outgo_id", SqlDbType.Int);
            cmd.Parameters.AddWithValue("@Out_Date", txt_dateoutgo.Text);
            cmd.Parameters.AddWithValue("@Out_To", txt_tooutgo.Text);
            cmd.Parameters.AddWithValue("@Outgo_Amount", txt_amountoutgo.Text);
            if (!String.IsNullOrEmpty(txt_amountoutgo.Text))
            {
                int a, c;
                a = int.Parse(txt_amountoutgo.Text);
                //b = int.Parse(hdnoutgototalvalue.Value);
                SqlCommand cmd1 = new SqlCommand(" select Totaloutgo_Amoount from outgodetails where Outgo_id=(SELECT max(Outgo_id) FROM outgodetails) ", con);
                con.Open();
                SqlDataReader dr = cmd1.ExecuteReader();
                
                while (dr.Read())
                {
                    hdnoutgototalvalue.Value = dr["Totaloutgo_Amoount"].ToString();
                }
                c = int.Parse(hdnoutgototalvalue.Value); 
                Tex_totalamount_out.Text = (c + a).ToString();  
                con.Close();
                con.Open();
                SqlCommand cmd2 = new SqlCommand("SELECT Total_Amount,Jan_income_amount FROM incomedetails WHERE income_id=(SELECT max(income_id) FROM incomedetails)", con);
                SqlDataReader dr2 = cmd2.ExecuteReader();
                while (dr2.Read())
                {
                    hdnincometotalvalue.Value = dr2["Total_Amount"].ToString();
                    hdnLabjanina1.Value = dr2["Jan_income_amount"].ToString();
                    int incomevalue = int.Parse(hdnincometotalvalue.Value);
                    int janina1 = int.Parse(hdnLabjanina1.Value);
                    int payvalue;

                    payvalue = int.Parse(txt_amountoutgo.Text);
                    txt_totalamount_in.Text = (incomevalue - payvalue).ToString();
                    hdnLabjanina1.Value = (janina1 - payvalue).ToString();
                }
                con.Close();
                con.Open();
                SqlCommand cmd3 = new SqlCommand("update incomedetails set Total_Amount='" + txt_totalamount_in.Text + "',Jan_income_amount='"+hdnLabjanina1.Value+"' where income_id=(select max(income_id) from incomedetails)", con);
                cmd3.ExecuteNonQuery();
                con.Close();
                
            }
            cmd.Parameters.AddWithValue("@Totaloutgo_Amoount", Tex_totalamount_out.Text);

            if (hdncorrentmonth.Value == "1")
            {
                Labjanpaya1.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Labjansavea1.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@Jan_pay_Amount", Labjanpaya1.Text);
                cmd.Parameters.AddWithValue("@Jan_saving_Amount", Labjansavea1.Text);

            }
            else
            {
                cmd.Parameters.AddWithValue("@Jan_pay_Amount", 0);
                cmd.Parameters.AddWithValue("@Jan_saving_Amount", 0);
            }
            if (hdncorrentmonth.Value == "2")
            {
                Labfebpaya2.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Labfebsavea2.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@Feb_pay_amount", Labfebpaya2.Text);
                cmd.Parameters.AddWithValue("@Feb_saving_amount", Labfebsavea2.Text);
            }else
            {
                cmd.Parameters.AddWithValue("@Feb_pay_amount", 0);
                cmd.Parameters.AddWithValue("@Feb_saving_amount", 0);
            }
            if (hdncorrentmonth.Value == "3")
            {
                Labmarpaya3.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Labmarsavea3.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@Mar_pay_amount", Labmarpaya3.Text);
                cmd.Parameters.AddWithValue("@Mar_saving_amount", Labmarsavea3.Text);
            }else
            {
                cmd.Parameters.AddWithValue("@Mar_pay_amount", 0);
                cmd.Parameters.AddWithValue("@Mar_saving_amount", 0);
            }
            if (hdncorrentmonth.Value == "4")
            {
                Labaplpaya4.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Labaplsavea4.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@Apl_pay_amount", Labaplpaya4.Text);
                cmd.Parameters.AddWithValue("@Apl_saving_amount", Labaplsavea4.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Apl_pay_amount", 0);
                cmd.Parameters.AddWithValue("@Apl_saving_amount", 0);
            }
            if (hdncorrentmonth.Value == "5")
            {
                Labmaypaya5.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Labmaysavea5.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@May_pay_amount", Labmaypaya5.Text);
                cmd.Parameters.AddWithValue("@May_saving_amount", Labmaysavea5.Text);
            }else
            {
                cmd.Parameters.AddWithValue("@May_pay_amount", 0);
                cmd.Parameters.AddWithValue("@May_saving_amount", 0);
            }
            if(hdncorrentmonth.Value == "6")
            {
                Labjunpaya6.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Labjunsavea6.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@Jun_pay_amount", Labjunpaya6.Text);
                cmd.Parameters.AddWithValue("@Jun_saving_amount", Labjunsavea6.Text);
            }else
            {
                cmd.Parameters.AddWithValue("@Jun_pay_amount", 0);
                cmd.Parameters.AddWithValue("@Jun_saving_amount", 0);
            }
            if (hdncorrentmonth.Value == "7")
            {
                Labjuypaya7.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Labjuysavea7.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@Juy_pay_amount", Labjuypaya7.Text);
                cmd.Parameters.AddWithValue("@Juy_saving_amount", Labjuysavea7.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Juy_pay_amount", 0);
                cmd.Parameters.AddWithValue("@Juy_saving_amount", 0);
            }
            if (hdncorrentmonth.Value == "8")
            {
                Labaugpaya8.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Labaugsavea8.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@Agt_pay_amount", Labaugpaya8.Text);
                cmd.Parameters.AddWithValue("@Agt_saving_amount", Labaugsavea8.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Agt_pay_amount", 0);
                cmd.Parameters.AddWithValue("@Agt_saving_amount", 0);
            }

            if (hdncorrentmonth.Value == "9")
            {
                Labseppaya9.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Labsepsavea9.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@Sep_pay_amount", Labseppaya9.Text);
                cmd.Parameters.AddWithValue("@Sep_saving_amount", Labsepsavea9.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Sep_pay_amount", 0);
                cmd.Parameters.AddWithValue("@Sep_saving_amount", 0);
            }
            if (hdncorrentmonth.Value == "10")
            {
                Laboctpaya10.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Laboctsavea10.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@Oct_pay_amount", Laboctpaya10.Text);
                cmd.Parameters.AddWithValue("@Oct_saving_amount", Laboctsavea10.Text);
            }else
            {
                cmd.Parameters.AddWithValue("@Oct_pay_amount", 0);
                cmd.Parameters.AddWithValue("@Oct_saving_amount", 0);
            }
            if (hdncorrentmonth.Value == "11")
            {
                Labnovpaya11.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Labnovsavea11.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@Nov_pay_amount", Labnovpaya11.Text);
                cmd.Parameters.AddWithValue("@Nov_saving_amount", Labnovsavea11.Text);
            }else
            {
                cmd.Parameters.AddWithValue("@Nov_pay_amount", 0);
                cmd.Parameters.AddWithValue("@Nov_saving_amount", 0);
            }
            if (hdncorrentmonth.Value == "12")
            {
                Labdespaya12.Text = Tex_totalamount_out.Text;
                int a, b;
                a = int.Parse(txt_totalamount_in.Text);
                b = int.Parse(Tex_totalamount_out.Text);
                Labdessavea12.Text = (a - b).ToString();
                cmd.Parameters.AddWithValue("@Des_pay_amount", Labdespaya12.Text);
                cmd.Parameters.AddWithValue("@Des_saving_amount", Labdessavea12.Text);
            }else
            {
                cmd.Parameters.AddWithValue("@Des_pay_amount", 0);
                cmd.Parameters.AddWithValue("@Des_saving_amount", 0);
            }
                
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            clear();
            fillmonthwisepay();
        }


        void clear()
        {
            tex_date.Text = "";
            txt_company.Text = "";
            txt_amount.Text = "";
            txt_dateoutgo.Text = "";
            txt_tooutgo.Text = "";
            txt_amountoutgo.Text = "";
        }


    }
}