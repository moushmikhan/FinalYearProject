using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;

public partial class Admin_ListOfPriv : System.Web.UI.Page
{
    SqlCommand com;
    string str;
    SqlCommand cmd;
    SqlConnection con;
    String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindRoleRptr();
        }
    }
    private void BindRoleRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from NgoRegisterTable inner join LoginTable On  LoginTable.EmailId = NgoRegisterTable.EmailId Where NgoRegisterTable.NgoType='Private Ngo' order By NgoRegisterTable.Id asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {

                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    RepeaterUser.DataSource = dtBrands;
                    RepeaterUser.DataBind();
                }

            }
        }
    }
}