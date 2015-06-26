using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.VisualBasic;
using System.Globalization;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            user_name.Text = "Login";
            Response.Redirect("site_signIn.aspx");
        }
        else
        {
            user_name.Text = Session["username"].ToString();
        }
        select_notifications();
    }// end function page_load

    protected void select_notifications()
    {
        string query = "SELECT description, date_time, status FROM notifications where status = '0' and type = 'inventory'";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        int inv_count = 0;
        
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (dr.HasRows)
            {
                inv_count++;
            }
        }// end while loop
        notify.InnerText = Convert.ToString(inv_count) + " inventory notifications";
        con.Close();
    }
}