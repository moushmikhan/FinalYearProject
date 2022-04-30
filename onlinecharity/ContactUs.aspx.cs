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
using System.Security.Cryptography;
using System.Text;

public partial class ContactUs : System.Web.UI.Page
{
    SqlCommand com;
    string str;
    String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string strQuery = "insert into ContactTable(Name,Email,Subject,Message) values (@Name,@Email,@Subject,@Message)";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = txtName.Text;
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtEmail.Text;
            cmd.Parameters.Add("@Subject", SqlDbType.NVarChar).Value = txtSubject.Text;
            cmd.Parameters.Add("@Message", SqlDbType.NVarChar).Value = txtMessage.Text;
            InsertUpdateData(cmd);
            string message = "Thank You For Query Administrator Contact To Soon!!";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
    }
    private void Clear()
    {
        txtEmail.Text = "";
        txtMessage.Text = "";
        txtName.Text = "";
        txtSubject.Text = "";
    }
    private Boolean InsertUpdateData(SqlCommand cmd)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Clear();
            return true;
        }
        catch (Exception ex)
        {
            string formatError = ex.Message;
            System.Text.StringBuilder sb1 = new System.Text.StringBuilder();
            sb1.Append("<script type = 'text/javascript'>");
            sb1.Append("window.onload=function(){");
            sb1.Append("alert('");
            sb1.Append(formatError);
            sb1.Append("')};");
            sb1.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb1.ToString());
            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
}
