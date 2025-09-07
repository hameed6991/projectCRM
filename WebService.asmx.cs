using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using apa_pack.User_Control;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using apa_pack.UserControl;

namespace apa_pack
{

     
    /// <summary>
    /// Summary description for WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }



        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string BarChartControl00()
        {
            var response = new
            {
                success = true,
                data = "<div>Sample Chart Data</div>"
            };

            return new JavaScriptSerializer().Serialize(response);
        }


 


        [WebMethod(EnableSession = false)]
        public string BarChartControl()
        {
            
                using (Page page = new Page())
                {
                    // Load the UserControl
                    BarChart div1val = (BarChart)page.LoadControl("UserControl/BarChart.ascx");
                    page.Controls.Add(div1val);

                    using (StringWriter writer = new StringWriter())
                    {
                        page.Controls.Add(div1val);
                        HttpContext.Current.Server.Execute(page, writer, true);
                        return writer.ToString();
                    }

                     
                }
             
             
        }



        [WebMethod(EnableSession = false)]
        public string DoughNutChartControl()
        {

            using (Page page = new Page())
            {
                // Load the UserControl
                DoughNutChart div1val = (DoughNutChart)page.LoadControl("UserControl/DoughNutChart.ascx");
                page.Controls.Add(div1val);

                using (StringWriter writer = new StringWriter())
                {
                    page.Controls.Add(div1val);
                    HttpContext.Current.Server.Execute(page, writer, true);
                    return writer.ToString();
                }


            }


        }



        [WebMethod(EnableSession = false)]
        public string PieChartControl()
        {

            using (Page page = new Page())
            {
                // Load the UserControl
                PieChart div1val = (PieChart)page.LoadControl("UserControl/PieChart.ascx");
                page.Controls.Add(div1val);

                using (StringWriter writer = new StringWriter())
                {
                    page.Controls.Add(div1val);
                    HttpContext.Current.Server.Execute(page, writer, true);
                    return writer.ToString();
                }


            }


        }



        [WebMethod(EnableSession = false)]
        public string ScatterChartControl()
        {

            using (Page page = new Page())
            {
                // Load the UserControl
                ScatterChart div1val = (ScatterChart)page.LoadControl("UserControl/ScatterChart.ascx");
                page.Controls.Add(div1val);

                using (StringWriter writer = new StringWriter())
                {
                    page.Controls.Add(div1val);
                    HttpContext.Current.Server.Execute(page, writer, true);
                    return writer.ToString();
                }


            }


        }


        [WebMethod(EnableSession = false)]
        public string GaugeChartControl()
        {

            using (Page page = new Page())
            {
                // Load the UserControl
                GaugeChart div1val = (GaugeChart)page.LoadControl("UserControl/GaugeChart.ascx");
                page.Controls.Add(div1val);

                using (StringWriter writer = new StringWriter())
                {
                    page.Controls.Add(div1val);
                    HttpContext.Current.Server.Execute(page, writer, true);
                    return writer.ToString();
                }


            }


        }
        



        [WebMethod(EnableSession = false)]
        public string LineChartControl()
        {

            using (Page page = new Page())
            {
                // Load the UserControl
                LineChart div1val = (LineChart)page.LoadControl("UserControl/LineChart.ascx");
                page.Controls.Add(div1val);

                using (StringWriter writer = new StringWriter())
                {
                    page.Controls.Add(div1val);
                    HttpContext.Current.Server.Execute(page, writer, true);
                    return writer.ToString();
                }


            }


        }





        #region GetAccountDetails
        [WebMethod(EnableSession = true)]
        public void GetAccountDetails(string AccCode)
        {

            if (AccCode != "")
            {
                Context.Request.ContentType = "application/x-www-form-urlencoded";
                SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");

                StringBuilder str = new StringBuilder();

                con.Open();

                string strQry = "";
                string strTemp = "";
                string ProdList = "";


                strQry = "  select AccCode,Address,Industry,Site,State,City,Pincode from Accmast Where Acccode='" + AccCode + "' ";



                SqlCommand cmd = new SqlCommand(strQry, con);
                SqlDataReader dr = cmd.ExecuteReader();


                while (dr.Read())
                {
                    //ProdList += dr["Address"].ToString() + ",";
                    //ProdList += dr["Industry"].ToString() + ",";
                    //ProdList += dr["Site"].ToString() + ",";
                    //ProdList += dr["City"].ToString() + ",";
                    //ProdList += dr["Pincode"].ToString() + "||";
                    
                    ProdList += dr["AccCode"].ToString() + ";";
                    ProdList += dr["Address"].ToString() + ";";
                    ProdList += dr["Industry"].ToString() + ";";
                    ProdList += dr["Site"].ToString() + ";";
                    ProdList += dr["City"].ToString() + ";";
                    ProdList += dr["State"].ToString() + ";";
                    ProdList += dr["Pincode"].ToString() + ";";


                }
                strTemp = ProdList.ToString();
                dr.Close();
                cmd.Dispose();
                con.Dispose();
                con.Close();
                HttpContext.Current.Response.Write(strTemp);
            }

        }
        #endregion


        #region GetContact
        [WebMethod]
        public void GetContact(string AccCode)
        {
            Context.Request.ContentType = "application/x-www-form-urlencoded";
            StringBuilder str = new StringBuilder();
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");
            con.Open();
            SqlDataReader dr;
            string strQry = "";
            string strTemp = "";
     
            strQry = "  select ContCode as [ID], Name from ContMast where ";
            if (AccCode != "")
            {
                strQry += " AccCode='" + AccCode + "'";
            }
            strQry += " order by Name ";
            SqlCommand cmd = new System.Data.SqlClient.SqlCommand(strQry, con);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                str.Append(dr["ID"].ToString());
                str.Append("|" + dr["Name"].ToString());
                str.Append("^^^");
            }
            strTemp = str.ToString();
            dr.Close();
            cmd.Dispose();
            con.Dispose();
            con.Close();
            HttpContext.Current.Response.Write(strTemp);
        }
        #endregion


        #region GetContactDetail
        [WebMethod(EnableSession = true)]
        public void GetContactDetail(string ContCode)
        {

            if (ContCode != "")
            {
                Context.Request.ContentType = "application/x-www-form-urlencoded";
                SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");

                StringBuilder str = new StringBuilder();

                con.Open();

                string strQry = "";
                string strTemp = "";
                string ProdList = "";


                strQry = "  select Name,MobileNo,Department,Designation from ContMast where ContCode='"+ ContCode + "' ";
 
                SqlCommand cmd = new SqlCommand(strQry, con);
                SqlDataReader dr = cmd.ExecuteReader();


                while (dr.Read())
                {
       
                    ProdList += dr["Name"].ToString() + ";";
                    ProdList += dr["MobileNo"].ToString() + ";";
                    ProdList += dr["Department"].ToString() + ";";
                    ProdList += dr["Designation"].ToString() + ";";
            
                }
                strTemp = ProdList.ToString();
                dr.Close();
                cmd.Dispose();
                con.Dispose();
                con.Close();
                HttpContext.Current.Response.Write(strTemp);
            }

        }
        #endregion


        #region GetProductDetails
        [WebMethod(EnableSession = true)]
        public void GetProductDetails(string ProdCode)
        {

            if (ProdCode != "")
            {
                Context.Request.ContentType = "application/x-www-form-urlencoded";
                SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");

                StringBuilder str = new StringBuilder();

                con.Open();

                string strQry = "";
                string strTemp = "";
                string ProdList = "";


                strQry = " select prodcode,Product,ProdDesc,ModleNo,PSCode,Rupees from prodmast where ProdCode='"+ ProdCode + "' ";

                SqlCommand cmd = new SqlCommand(strQry, con);
                SqlDataReader dr = cmd.ExecuteReader();


                while (dr.Read())
                {

                    ProdList += dr["ProdDesc"].ToString() + ";";
                    ProdList += dr["PSCode"].ToString() + ";";
                 
                }
                strTemp = ProdList.ToString();
                dr.Close();
                cmd.Dispose();
                con.Dispose();
                con.Close();
                HttpContext.Current.Response.Write(strTemp);
            }

        }
        #endregion





        #region GetLocation
        [WebMethod(EnableSession = true)]
        public void GetLocation(string Regioncode)
        {
            string Regioncode1 = Regioncode.Replace(@"@", "'");
            string MyCond = "";
            Context.Request.ContentType = "application/x-www-form-urlencoded";
            StringBuilder str = new StringBuilder();
            //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["strCon"]);
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-1G3J74F\SQLEXPRESS;Initial Catalog=studentmanagemant;Integrated Security=True");
            con.Open();
            SqlDataReader dr;
            string strQry = "";
            string strTemp = "";
            string strSql = "";


            //if (Session["group"].ToString().ToUpper() == "ON")
            //{
            //    MyCond = Session["utype"] + "Code " + Session["glist"];
            //}
            //else
            //{
            //    MyCond = Session["utype"] + "Code = '" + Session["ulist"] + "'";
            //}

            //if (Session["utype"].ToString().ToLower() == "ho")
            //{
            //    strSql = "select  LocationName,LocationCode from locationmast where 1=1 ";
            //}
            //else if (Session["utype"].ToString().ToLower() == "ro")
            //{
            //    strSql = "select  LocationName,LocationCode from locationmast where " + MyCond;
            //}
            //else if (Session["utype"].ToString().ToLower() == "location")
            //{
            //    strSql = "select  LocationName,LocationCode from locationmast where " + MyCond;
            //}
            //else if (Session["utype"].ToString().ToLower() == "gl")
            //{
            //    strSql = "select  LocationName,LocationCode from locationmast where locationcode in (select locationcode from glmast where " + MyCond + ")";
            //}
            //else if (Session["utype"].ToString().ToLower() == "cse")
            //{
            //    strSql = "select  LocationName,LocationCode from locationmast where locationcode in (select locationcode from csemast where " + MyCond + ")";
            //}


            //strSql = strSql + "  and  rocode in (" + Rocode1 + ") ";
            //strSql += " order by LocationName asc ";


            strSql = "select LocationID as [LocationCode], LocationName as [LocationName], * from Locationmaster where 1=1 ";
            strSql += "  and  RegionID in ('"+ Regioncode1 +"') ";

            SqlCommand cmd = new System.Data.SqlClient.SqlCommand(strSql, con);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                str.Append(dr["LocationName"].ToString());
                str.Append("|" + dr["LocationCode"].ToString());
                str.Append("^^^");
            }
            // string strheader = "Location";


            strTemp = str.ToString();

            dr.Close();
            cmd.Dispose();
            con.Dispose();
            con.Close();
            HttpContext.Current.Response.Write(strTemp);
        }
        #endregion


    }
}
