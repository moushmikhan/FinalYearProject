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
public partial class Ngo_GoodReceipt : System.Web.UI.Page
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
            auto();
        }
    }

    private void auto()
    {
        int Num = 0;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        string sql = "SELECT MAX(Id+1) FROM FeeTable";
        cmd = new SqlCommand(sql);
        cmd.Connection = con;
        if (Convert.IsDBNull(cmd.ExecuteScalar()))
        {
            Num = 01;
            lblReceipt.Text = Convert.ToString(Num);
            txtReceiptId.Text = Convert.ToString("B" + Num);
        }
        else
        {
            Num = (int)(cmd.ExecuteScalar());
            //lblBillId.Text = Convert.ToString(Num);
            //txtBillId.Text = Convert.ToString("B" + Num);
        }
        cmd.Dispose();
        con.Close();
        con.Dispose();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }
}