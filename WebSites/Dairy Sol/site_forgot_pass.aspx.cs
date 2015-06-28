using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void forgot_pass_btn_Click(object sender, EventArgs e)
    {
        string emp_query = "select secret_question, secret_answer from employee_info where email_id = '" + email_id.Text + "'";
        string cus_query = "select secret_question, secret_answer from customer_info where customer_email_id = '" + email_id.Text + "'";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString; 
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

        con.Close();
    }
    protected void submit_btn_click(object sender, EventArgs e)
    {
        string change_text = "";
        string answer = "";
        string emp_query = "select secret_answer, password from employee_info where email_id = '" + email_id.Text + "'";
        string cus_query = "select secret_answer, password from customer_info where customer_email_id = '" + email_id.Text + "'";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString; 
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
                        SendMail();
                        pass_reveal.Text = "An email has been sent to your email address containing password.";
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
                    pass_reveal.Text = dr["customer_password"].ToString();
                    SendMail();
                    //pass_reveal.EnableViewState = true;
                    //pass_reveal.Visible = true;
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
        con.Close();
    }

    protected void SendMail()
    {
        // Gmail Address from where you send the mail
        var fromAddress = "dairysolutionlahore.inquiry@gmail.com";
        // any address where the email will be sending
        var toAddress = email_id.Text;
        //Password of your gmail address
        const string fromPassword = "dairysolution";
        // Passing the values and make a email formate to display
        string subject = "Password Reset Request";

        string body = "Your password of Dairy Solution account is: "+ pass_reveal.Text +"\n\n";

        // smtp settings
        var smtp = new System.Net.Mail.SmtpClient();
        {
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
            smtp.Timeout = 20000;
        }
        // Passing values to smtp object
        smtp.Send(fromAddress, toAddress, subject, body);
    }
}