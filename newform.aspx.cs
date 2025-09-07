using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace apa_pack
{
    public partial class newform : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropdwon();
                
            }
        }
        protected void dropdwon()
        {
            string class_value = " select id,class from dropdown";
            SqlDataAdapter da = new SqlDataAdapter( class_value, con);
            con.Open();
            DataTable dt = new DataTable();
            da.Fill(dt);
            drop_class.DataSource = dt;
            drop_class.DataTextField = "class";
            drop_class.DataValueField = "id";
            drop_class.DataBind();
            drop_class.Items.Insert(0, new ListItem("--Select--", "0"));
            con.Close();
            
        }

        protected void reset_form_Click(object sender, EventArgs e)
        {
            txt_name.Text = "";
            drop_class.SelectedValue = " -- select -- ";
        }

        protected void submit_form_Click(object sender, EventArgs e)
        {
            
            //string insert = "insert into reg values ('"+ txt_name.Text + "','" + drop_class.SelectedValue + "','" + txt_dob.Text + "','female','" + txt_mail.Text + "')";
            SqlCommand cmd = new SqlCommand("reg_save", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@student_name", txt_name.Text );
            cmd.Parameters.AddWithValue("@class", drop_class.SelectedValue);
            cmd.Parameters.AddWithValue("@dob", txt_dob.Text);
            if (Radio_gender_m.Checked == true)
            {
                cmd.Parameters.AddWithValue("@gender", Radio_gender_m.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@gender", Radio_gender_f.Text);
            }   
            cmd.Parameters.AddWithValue("@mail", txt_mail.Text);
            cmd.Parameters.AddWithValue("@password", txt_password.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            clearscreen();
            Response.Redirect("apalogin.aspx");

        }
        void clearscreen()
        {
            txt_name.Text = "";
            drop_class.SelectedValue = "0";
            txt_dob.Text = "";
            Radio_gender_m.Checked = false;
            Radio_gender_f.Checked = false;
            txt_mail.Text = "";
        }
    }
}