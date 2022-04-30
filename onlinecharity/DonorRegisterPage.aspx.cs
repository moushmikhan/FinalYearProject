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

public partial class DonorRegisterPage : System.Web.UI.Page
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
        txtCity.Text = "";
        txtEmailId.Text = "";
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtMiddleName.Text = "";
        txtMobileNo.Text = "";
        txtPassword.Text = "";
        txtPincode.Text = "";
        txtState.Text = "";
        ddlGender.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlConnection con1 = new SqlConnection(CS);
            con1.Open();
            str = "select count(*) from LoginTable where EmailId='" + txtEmailId.Text + "' And UserType='D'";
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
                string strQuery = "insert into DonorRegisterTable(FirstName,MiddleName,LastName,Gender,MobileNumber,Address,State,City,Pincode,EmailID,Password) values (@FirstName,@MiddleName,@LastName,@Gender,@MobileNumber,@Address,@State,@City,@Pincode,@EmailID,@Password)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = txtFirstName.Text;
                cmd.Parameters.Add("@MiddleName", SqlDbType.VarChar).Value = txtMiddleName.Text;
                cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = txtLastName.Text;
                cmd.Parameters.Add("@Gender", SqlDbType.VarChar).Value = ddlGender.Text;
                cmd.Parameters.Add("@MobileNumber", SqlDbType.VarChar).Value = txtMobileNo.Text;
                cmd.Parameters.Add("@Address", SqlDbType.VarChar).Value = txtAddress.Text;
                cmd.Parameters.Add("@State", SqlDbType.VarChar).Value = txtState.Text;
                cmd.Parameters.Add("@City", SqlDbType.VarChar).Value = txtCity.Text;
                cmd.Parameters.Add("@Pincode", SqlDbType.VarChar).Value = txtPincode.Text;
                cmd.Parameters.Add("@EmailId", SqlDbType.VarChar).Value = txtEmailId.Text;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = txtPassword.Text;
                InsertUpdateData(cmd);
                Clear();
                string message = "Donor registration data successfully!!!";
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
            SqlCommand cmd1 = new SqlCommand("insert into LoginTable (EmailId,Password,UserType,Status,Name) Values ('" + txtEmailId.Text + "','" + txtPassword.Text + "','D','Active','" + txtFirstName.Text + "')", con);
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