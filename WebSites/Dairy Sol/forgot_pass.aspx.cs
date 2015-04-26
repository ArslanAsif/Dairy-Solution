using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void forgot_pass_btn_Click(object sender, EventArgs e)
    {
        string emp_query = "select secret_question, secret_answer from employee_info where email_id = '" + email_id.Text + "'";
        string cus_query = "select secret_question, secret_answer from customer_info where customer_email_id = '" + email_id.Text + "'";
        string constring = @"Data Source=ACER;Initial Catalog=Dairy_Solution;Integrated Security=True";
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        SqlDataReader dr;
        
        if (radioOptions1.SelectedValue == "Employee")
        {
            cmd.CommandText = emp_query;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    secret_question.Visible = true;
                    secret_question.EnableViewState = true;
                    secret_question.Text = dr["secret_question"].ToString();
                    submit_btn.EnableViewState = true;
                    submit_btn.Visible = true;
                    secret_answer.EnableViewState = true;
                    secret_answer.Visible = true;
                    pass_reveal.ForeColor = System.Drawing.Color.Green;
                }
                
            }
        }
        else
        {
            cmd.CommandText = cus_query;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    secret_question.Visible = true;
                    secret_question.EnableViewState = true;
                    secret_question.Text = dr["secret_question"].ToString();
                    pass_reveal.ForeColor = System.Drawing.Color.Green;
                    submit_btn.EnableViewState = true;
                    submit_btn.Visible = true;
                    secret_answer.EnableViewState = true;
                    secret_answer.Visible = true;
                }
                
            }
        }

        //for insert remove data reader and replace cmd.executenonquery()
        //Response.Redirect("products.aspx");
        con.Close();
    }
    protected void submit_btn_click(object sender, EventArgs e)
    {
        string change_text = "";
        string answer = "";
        string emp_query = "select secret_answer, password from employee_info where email_id = '" + email_id.Text + "'";
        string cus_query = "select secret_answer, password from customer_info where customer_email_id = '" + email_id.Text + "'";
        string constring = @"Data Source=ACER;Initial Catalog=Dairy_Solution;Integrated Security=True";
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        SqlDataReader dr;

        if (radioOptions1.SelectedValue == "Employee")
        {
            cmd.CommandText = emp_query;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    answer = dr["secret_answer"].ToString();
                    if (answer.Equals(secret_answer.Text))
                    {
                        change_text = dr["password"].ToString();
                        pass_reveal.Text = "Your Password is: " + change_text;
                        pass_reveal.EnableViewState = true;
                        pass_reveal.Visible = true;
                        pass_reveal.ForeColor = System.Drawing.Color.Green;
                    }
                    else 
                    {
                        pass_reveal.Text = "Your Answer is Incorrect!";
                        pass_reveal.EnableViewState = true;
                        pass_reveal.Visible = true;
                        pass_reveal.ForeColor = System.Drawing.Color.Red;
                    }
                }
                
            }
        }
        else
        {
            cmd.CommandText = cus_query;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    change_text = dr["customer_password"].ToString();
                    pass_reveal.Text = "Your Password is: " + change_text;
                    pass_reveal.EnableViewState = true;
                    pass_reveal.Visible = true;
                    pass_reveal.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    pass_reveal.Text = "Answer is Wrong!";
                    pass_reveal.EnableViewState = true;
                    pass_reveal.Visible = true;
                    pass_reveal.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        //for insert remove data reader and replace cmd.executenonquery()
        //Response.Redirect("products.aspx");
        con.Close();
    }
}