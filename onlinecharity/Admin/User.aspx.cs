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

public partial class Admin_User : System.Web.UI.Page
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

    private void Clear()
    {
        txtAddress.Text = "";
        txtFullName.Text = "";
        txtDateOfBirth.Text = System.DateTime.Today.ToString();
        txtEmail.Text = "";
        txtMobileNo.Text = "";
        txtPassword.Text = "";
    }
    private void BindRoleRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from UserTable order By Id asc", con))
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string gender = string.Empty;
        string filePath = FileUpload1.PostedFile.FileName;
        string filename = Path.GetFileName(filePath);
        string ext = Path.GetExtension(filename);
        string contenttype = String.Empty;
         
        switch (ext)
        {
            case ".jpg":
                contenttype = "image/jpg";
                break;
            case ".png":
                contenttype = "image/png";
                break;
        }
        if (contenttype != String.Empty)
        {
            String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlConnection con1 = new SqlConnection(CS);
                con1.Open();
                str = "select count(*)from UserTable where Email='" + txtEmail.Text + "'";
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
                    txtEmail.Text = "";
                    return;
                }
                else
                {
                    Stream fs = FileUpload1.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string strQuery = "insert into UserTable(FullName, Address, Email, Password , Gender,DateOfBirth,MobileNo,Image,ContentType) values (@FullName, @Address, @Email,@Password,@Gender,@DateOfBirth,@MobileNo,@Image,@ContentType)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.Add("@FullName", SqlDbType.VarChar).Value = txtFullName.Text;
                    cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = txtAddress.Text;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtEmail.Text;
                    cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = txtPassword.Text;
                    cmd.Parameters.Add("@Gender", SqlDbType.Char).Value = ddlGender.Text;
                    cmd.Parameters.Add("@DateOfBirth", SqlDbType.Date).Value = txtDateOfBirth.Text;
                    cmd.Parameters.Add("@MobileNo", SqlDbType.NVarChar).Value = txtMobileNo.Text;
                    cmd.Parameters.Add("@Image", SqlDbType.Binary).Value = bytes;
                    cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contenttype;
                    InsertUpdateData(cmd);
                    Clear();
                    BindRoleRptr();
                    string message = "New User added successfully!!";
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
            SqlCommand cmd1 = new SqlCommand("insert into LoginTable (EmailId,Password,UserType,Status,Name) Values ('" + txtEmail.Text + "','" + txtPassword.Text + "','A','Active','"+ txtFullName.Text +"')", con);
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