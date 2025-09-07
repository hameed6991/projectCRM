using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace apa_pack
{
    public partial class Successfully : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            hdnCode.Value = Request.QueryString["Code"];

        }
    }
}