using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString != null && Request.QueryString.Count > 0)
        {
            if (int.Parse(Request.QueryString["success"]) == 1)
            {
                alert_success.Visible = true;
            }
        }
    }

    protected void formReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("emp_loan_request.aspx");
    }

    protected void send_req_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(constring);

            String query = "INSERT INTO loan_request(emp_id, amount, req_date, span, status) VALUES(@emp_id, @amount, @req_date, @span, @status)";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@emp_id", Session["userId"].ToString());
            cmd.Parameters.AddWithValue("@amount", amount.Text);
            cmd.Parameters.AddWithValue("@req_date", DateTime.Now);
            cmd.Parameters.AddWithValue("@span", loan_span.SelectedValue);
            cmd.Parameters.AddWithValue("@status", "Pending");

            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("loan_request.aspx?success=1");
        }
        catch (Exception ex)
        {
            alert_fail.Visible = true;
            error.Text = "Error! " + ex.ToString();
        }
    }
}