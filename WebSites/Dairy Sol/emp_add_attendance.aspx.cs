using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userType"] != null)
        {
            switch (Session["userType"].ToString())
            {
                case "CEO":
                    break;

                case "Receptionist":
                    
                    break;

                case "Sales Person":
                    Response.Redirect("mng_dashboard.aspx");
                    break;

                case "Inventory Manager":
                    Response.Redirect("mng_dashboard.aspx");
                    break;

                default:
                    Response.Redirect("site_signIn.aspx");
                    break;

            }
        }

        CurrentDate.Text = DateTime.Now.ToString("yyyy-M-dd");
        CurrentTime.Text = DateTime.Now.ToString("hh:m:s tt");
    }

    protected void mark_attendance_Click(object sender, EventArgs e)
    {
        try
        {

        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = "insert into employee_attendance (employee_id, date, time) values (@employee_id, @date, @time);";
        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@employee_id", DropDownList1.SelectedValue);
        cmd.Parameters.AddWithValue("@time", CurrentTime.Text);
        cmd.Parameters.AddWithValue("@date", CurrentDate.Text);
        cmd.Connection = con;

        con.Open();

        if (cmd.ExecuteNonQuery() != null)
        {
            alert_fail.Visible = false;
            alert_success.Visible = true;
        }
        else {
            throw new Exception("Something Went wrong! Please Try again.");
            
        }
        
        con.Close();

        }
        catch (Exception ex)
        {
            alert_success.Visible = false;
            alert_fail.Visible = true;
            error.Text = "Error! : Cannot mark attendance twice a day";
        }
    }
}