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

public partial class RegisterPage : System.Web.UI.Page
{
    #region Global Variable
    string str;
    SqlCommand com;
    SqlConnection CS = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void Clear()
    {
        txtAddress.Text = "";
        txtContactNo.Text = "";
        txtEmailId.Text = "";
        txtNgoAdmin.Text = "";
        txtNgoName.Text = "";
        txtPassword.Text = "";
        txtRegistrationDate.Text = "";
        txtRegistrationNo.Text = "";
        ddlNgoType.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string filePath = fpNgoDocument.PostedFile.FileName;
        
        string filename = Path.GetFileName(filePath);
       
        string ext = Path.GetExtension(filename);
         
        string contenttype = String.Empty;
       
        switch (ext)
        {
            case ".pdf":
                contenttype = "file/pdf";
                break;
        }
        
        if (contenttype != String.Empty)
        {
            String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlConnection con1 = new SqlConnection(CS);
                con1.Open();
                str = "select count(*) from LoginTable where EmailId='" + txtEmailId.Text + "' And UserType='N'";
                com = new SqlCommand(str, con1);
                int count = Convert.ToInt32(com.ExecuteScalar());
                if (count > 0)
                {
                    string message = "Email Id already register";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    txtEmailId.Text = "";
                    return;
                }
                else
                {

                    Stream fs = fpNgoDocument.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    string strQuery = "insert into NgoRegisterTable(NgoName,RegistrationNo,RegistrationDate,NgoAdministrator,NgoType,NgoAddress,ContactNo,NgoDocument,ContentType,NgoDocumentName,EmailId,Password) values (@NgoName,@RegistrationNo,@RegistrationDate,@NgoAdministrator,@NgoType,@NgoAddress,@ContactNo,@NgoDocument,@ContentType,@NgoDocumentName,@EmailId,@Password)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.Add("@NgoName", SqlDbType.VarChar).Value = txtNgoName.Text;
                    cmd.Parameters.Add("@RegistrationNo", SqlDbType.VarChar).Value = txtRegistrationNo.Text;
                    cmd.Parameters.Add("@RegistrationDate", SqlDbType.Date).Value = txtRegistrationDate.Text;
                    cmd.Parameters.Add("@NgoAdministrator", SqlDbType.VarChar).Value = txtNgoAdmin.Text;
                    cmd.Parameters.Add("@NgoType", SqlDbType.VarChar).Value = ddlNgoType.Text;
                    cmd.Parameters.Add("@NgoAddress", SqlDbType.VarChar).Value = txtAddress.Text;
                    cmd.Parameters.Add("@ContactNo", SqlDbType.VarChar).Value = txtContactNo.Text;
                    cmd.Parameters.Add("@NgoDocument", SqlDbType.Binary).Value = bytes;
                    cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contenttype;
                    cmd.Parameters.Add("@NgoDocumentName", SqlDbType.VarChar).Value = filename;
                    cmd.Parameters.Add("@EmailId", SqlDbType.VarChar).Value = txtEmailId.Text;
                    cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = txtPassword.Text;
                    InsertUpdateData(cmd);
                    Clear();
                    string message = "Ngo registration data successfully; Wait for Admin Approval!!!";
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

        }

        string formatError = "File format not recognised. Upload Image formats";
        System.Text.StringBuilder sb1 = new System.Text.StringBuilder();
        sb1.Append("<script type = 'text/javascript'>");
        sb1.Append("window.onload=function(){");
        sb1.Append("alert('");
        sb1.Append(formatError);
        sb1.Append("')};");
        sb1.Append("</script>");
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb1.ToString());
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
            SqlCommand cmd1 = new SqlCommand("insert into LoginTable (EmailId,Password,UserType,Status,Name) Values ('" + txtEmailId.Text + "','" + txtPassword.Text + "','N','Deactive','"+ txtNgoName.Text +"')", con);
            cmd1.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

}