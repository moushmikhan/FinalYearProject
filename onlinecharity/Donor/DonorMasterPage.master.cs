using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Donor_DonorMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Email"] != null)
        {
            lblUserName.Text = Session["NAME"].ToString();
        }
        else
        {
            Response.Redirect("~/LoginPage.aspx");
        }
    }
}
