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

public partial class Donor_Donation : System.Web.UI.Page
{
    #region Global Variable
    string str;
    SqlConnection CS = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BusType();
            BindShiftRptr();
            txtEmail.Text = Session["Email"].ToString();
        }
    }
    private void BusType()
    {
        String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select distinct(NgoName) from NgoRegisterTable inner join LoginTable On  LoginTable.EmailId = NgoRegisterTable.EmailId where LoginTable.Status='Active'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlNgo.DataSource = dt;
                ddlNgo.DataTextField = "NgoName";
                ddlNgo.DataValueField = "NgoName";
                ddlNgo.DataBind();
                ddlNgo.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlNgo.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string strQuery = "insert into DonorDonationTable(NgoName, DonorName, Email,MobileNo , Donate , Status) values (@NgoName, @DonorName,@Email, @MobileNo , @Donate ,'Pending')";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@NgoName", SqlDbType.VarChar).Value = ddlNgo.Text;
            cmd.Parameters.Add("@DonorName", SqlDbType.VarChar).Value = txtDonor.Text;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtEmail.Text;
            cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = txtMobileNo.Text;
            cmd.Parameters.Add("@Donate", SqlDbType.VarChar).Value = txtDonate.Text;
            InsertUpdateData(cmd);
            Clear();
            BindShiftRptr();
            string message = "Donor Request Send Successfully!!";
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
        txtDonate.Text = "";
        txtDonor.Text = "";
        txtEmail.Text = "";
        txtMobileNo.Text = "";
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

    private void BindShiftRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from DonorDonationTable order By Id asc", con))
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