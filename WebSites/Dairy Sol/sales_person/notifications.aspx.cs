using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class notifications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
             
    }

    protected void change_status() 
    {
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        string query = "UPDATE tasks SET task_status = '1' WHERE task_status = '0' " +
                       "UPDATE notifications SET status = '1' WHERE status ='0'";
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("mng_dashboard.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        change_status();
    }
}