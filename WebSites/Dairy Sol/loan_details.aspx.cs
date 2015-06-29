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
        if (Session["userId"] == null) { Response.Redirect("site_signIn.aspx"); }

        if (IsPostBack)
        {
            alert_success.Visible = false;
            alert_fail.Visible = false;
        }

        if (!Page.IsPostBack)
        {
            load_req_data();
        }
    }

    protected void load_req_data()
    {
        string req_id = Request.QueryString["id"];
        string query = "SELECT l.*, e.employee_name FROM loan_request AS l INNER JOIN employee_info AS e ON l.emp_id = e.employee_id WHERE req_id = '" + req_id + "'";

        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (dr.HasRows)
            {
                emp_id.Text = dr["emp_id"].ToString();
                emp_name.Text = dr["employee_name"].ToString();
                amount.Text = dr["amount"].ToString();
                loan_span.Text = dr["span"].ToString();

            }
        }
        con.Close();
    }

    
    protected void refuse_req_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con2 = new SqlConnection(constring);
            String query = "UPDATE loan_request SET status = 'rejected' WHERE req_id = @id";
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
            int loan = 0;
            int amount1 = Convert.ToInt32(amount.Text);
            int span1 = Convert.ToInt32(loan_span.SelectedValue);
            loan = amount1 / span1;

            SqlConnection con = new SqlConnection(constring);

            String query = "UPDATE loan_request SET amount = @amount, span = @span, status = @status WHERE req_id = @id";

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
            select_loan(loan);
        }
        catch (Exception ex)
        {
            alert_fail.Visible = true;
            error.Text = "Error! " + ex.ToString();
        }
    }

    protected void select_loan( int loan_add ) 
    {
        string user_id = Session["userId"].ToString();
        string query = "SELECT loan_deduction from employee_net_salary where employee_id = '"+user_id+"'";

        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (dr.HasRows)
            {
                int prev_loan = Convert.ToInt32(dr["loan_deduction"].ToString());
                loan_add = loan_add + prev_loan;

                SqlConnection con1 = new SqlConnection(constring);
                String query1 = "UPDATE employee_net_salary SET loan_deduction = @loan_deduction WHERE employee_id = '"+user_id+"'";
                SqlCommand cmd1 = new SqlCommand(query1, con1);

                cmd1.Parameters.AddWithValue("@loan_deduction", loan_add);
                
                cmd1.Connection = con1;
                con1.Open();
                cmd1.ExecuteNonQuery();
                con1.Close();
            }
        }
        con.Close();
    }

    protected void redirect_profile_Click(object sender, EventArgs e)
    {
        Response.Redirect("emp_profile.aspx?id="+emp_id.Text);
    }
}