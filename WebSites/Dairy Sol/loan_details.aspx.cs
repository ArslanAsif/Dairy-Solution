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

    }

    protected void formReset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Page.Request.RawUrl, false);
    }

    protected void refuse_req_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con2 = new SqlConnection(constring);
            String query = "UPDATE loan_request SET status = 'rejected' WHERE emp_id = @id";
            SqlCommand cmd = new SqlCommand(query, con2);

            cmd.Parameters.AddWithValue("@id", int.Parse(Request.QueryString["id"]));

            cmd.Connection = con2;
            con2.Open();
            cmd.ExecuteNonQuery();
            con2.Close();

            alert_rejected.Visible = true;
        }
        catch(Exception ex)
        {
            alert_fail.Visible = true;
            error.Text = "Error! " + ex.ToString();
        }
    }

    protected void send_req_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(constring);

            String query = "UPDATE loan_request SET amount = @amount, span = @span, status = @status WHERE emp_id = @id";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@id", int.Parse(Request.QueryString["id"]));
            cmd.Parameters.AddWithValue("@amount", amount.Text);
            cmd.Parameters.AddWithValue("@span", loan_span.SelectedValue);
            cmd.Parameters.AddWithValue("@status", "Accepted");

            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
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