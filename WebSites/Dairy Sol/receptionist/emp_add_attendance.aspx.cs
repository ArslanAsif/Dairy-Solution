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
        CurrentTime.Text = DateTime.Now.ToString();
    }

    protected void mark_attendance_Click(object sender, EventArgs e)
    {
        try
        {

        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = "insert into employee_attendance (employee_id, date_time) values (@employee_id, @date_time);";
        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@employee_id", DropDownList1.SelectedValue);
        cmd.Parameters.AddWithValue("@date_time", CurrentTime.Text);

        cmd.Connection = con;

        con.Open();

        if (cmd.ExecuteNonQuery() != null)
        {
            attendance_marked.Text = "Attendance marked successfully!";
            attendance_marked.EnableViewState = true;
            attendance_marked.Visible = true;
            attendance_marked.ForeColor = System.Drawing.Color.Green;
        }
        else {
            attendance_marked.Text = "Something Went wrong! Please Try again.";
            attendance_marked.EnableViewState = true;
            attendance_marked.Visible = true;
            attendance_marked.ForeColor = System.Drawing.Color.Red;
        }

        alert_success.Visible = true;
        con.Close();

        alert_success.Visible = true;
        }
        catch (Exception ex)
        {
            alert_fail.Visible = true;
            error.Text = "Error! " + ex.ToString();
        }
    }
}