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
            Response.Redirect("~/site_signIn.aspx");
        }
        else
        {
            user_name.Text = Session["username"].ToString();
        }
        
        select_task_notifications();
        get_user_info();
    }// end function page_load


    protected void select_task_notifications()
    {
        string query = "SELECT task_desc, task_date, task_status, added_by, added_to, task_type FROM tasks where task_status = '0'";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        int task_count = 0;

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (dr.HasRows)
            {
                task_count++;
            }
        }// end while loop
        notify3.InnerText = Convert.ToString(task_count) + "  Task Notifications";
        con.Close();
    }

    protected void get_user_info()
    {
        string user_name = Session["userId"].ToString();

        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = "SELECT e.employee_name, e.employee_picture, c.designation FROM employee_info AS e INNER JOIN employee_company_info AS c ON e.employee_id = c.employee_id  WHERE e.employee_id = '" + user_name + "'";

        SqlCommand cmd = new SqlCommand(query, con);

        con.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            usr_name.Text = dr["employee_name"].ToString();
            usr_designation.Text = dr["designation"].ToString();
            usr_image.ImageUrl = "../"+dr["employee_picture"].ToString();
        }

        con.Close();
    }
}