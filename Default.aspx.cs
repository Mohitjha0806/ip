using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    private string connectionString = "Your_Connection_String";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    private string GetUserIP()
    {
        return HttpContext.Current.Request.UserHostAddress;
    }

    // Button click event
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string userName = txtUserName.Text;
        string userIp = GetUserIP();

        InsertUserData(userName, userIp);
        BindGridView();
    }

    private void InsertUserData(string name, string ip)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        string query = "INSERT INTO tblUserData (UserName, UserIP) VALUES (@Name, @IP)";
        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@IP", ip);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            txtUserName.Text = "";
        }
    }


    private void BindGridView()
    {
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            string query = "SELECT UserName, UserIP FROM tblUserData";
            SqlCommand cmd = new SqlCommand(query, con);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);

                gvUserData.DataSource = dt;
                gvUserData.DataBind();
            }
        }
    }
}
