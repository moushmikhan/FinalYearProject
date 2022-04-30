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

public partial class Donor_Volunteer : System.Web.UI.Page
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
        string chkboxDays = "";
        for (int i = 0; i < cbDaysOfWork.Items.Count; i++)
        {
            if (cbDaysOfWork.Items[i].Selected)
            {
                if (chkboxDays == "")
                {
                    chkboxDays = cbDaysOfWork.Items[i].Text;
                }
                else
                {
                    chkboxDays += "," + cbDaysOfWork.Items[i].Text;
                }
            }
        }
        String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string strQuery = "insert into VolunteerRegisterTable(NGOName, FirstName, LastName,MobileNumber , Address , State,City,Pincode,Skillsets,DaysOfWork,Commets,Status,EmailId) values (@NGOName, @FirstName, @LastName,@MobileNumber , @Address , @State,@City,@Pincode,@Skillsets,@DaysOfWork,@Commets,'Pending',@EmailId)";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@NgoName", SqlDbType.VarChar).Value = ddlNgo.Text;
            cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = txtFirstName.Text;
            cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = txtLastName.Text;
            cmd.Parameters.Add("@MobileNumber", SqlDbType.VarChar).Value = txtMobileNo.Text;
            cmd.Parameters.Add("@Address", SqlDbType.VarChar).Value = txtAddress.Text;
             cmd.Parameters.Add("@State", SqlDbType.VarChar).Value = txtState.Text;
            cmd.Parameters.Add("@City", SqlDbType.VarChar).Value = txtCity.Text;
            cmd.Parameters.Add("@Pincode", SqlDbType.VarChar).Value = txtPincode.Text;
            cmd.Parameters.Add("@Skillsets", SqlDbType.VarChar).Value = txtSkillsets.Text;
            cmd.Parameters.Add("@DaysOfWork", SqlDbType.VarChar).Value = chkboxDays;
             cmd.Parameters.Add("@Commets", SqlDbType.VarChar).Value = txtCommets.Text;
             cmd.Parameters.Add("@EmailId", SqlDbType.VarChar).Value = Session["Email"].ToString();
            InsertUpdateData(cmd);
            Clear();
            BindShiftRptr();
            string message = "Volunteer Request Send Successfully!!";
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
       txtAddress.Text = "";
         txtCity.Text = "";
         txtCommets.Text = "";
         txtFirstName.Text = "";
         txtLastName.Text = "";
         txtMobileNo.Text = "";
         txtPincode.Text = "";
         txtSkillsets.Text = "";
         txtState.Text = "";
        
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
            using (SqlCommand cmd = new SqlCommand("select * from VolunteerRegisterTable where EmailId='" + Session["Email"].ToString() + "'  order By Id asc", con))
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