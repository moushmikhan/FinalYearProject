using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_ApprovalNgo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string Id = Request.QueryString["Id"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("Update LoginTable Set Status='Active' where EmailId='" + Id + "'", con);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Admin/NgoRequest.aspx");
        }
    }
}