using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["NAME"] != null)
        {
            lblUserName.Text = Session["NAME"].ToString();
        }
        else
        {
            Response.Redirect("~/LoginPage.aspx");
        }
    }
}
