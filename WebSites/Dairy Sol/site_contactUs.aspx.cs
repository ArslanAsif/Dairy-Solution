using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void add_query_Click(object sender, EventArgs e)
    {
        try
        {
            SendMail();

            submitMsg.Text = "Successfully submitted!";
            alertMsg.Visible = true;

            sender_subject.Text = string.Empty;
            message.Text = string.Empty;
        }

        catch (Exception ex)
        {
            submitMsg.Text = "Error! " +ex.ToString();
            alertMsg.Visible = true;
        }
    }

    protected void SendMail()
    {
        // Gmail Address from where you send the mail
        var fromAddress = "dairysolutionlahore.inquiry@gmail.com";
        // any address where the email will be sending
        var toAddress = "dairysolutionlahore@gmail.com";
        //Password of your gmail address
        const string fromPassword = "dairysolution";
        // Passing the values and make a email formate to display
        string subject = "Customer Inquiry";

        string body = "From: " + sender_name.Text + "\n";
        body += "Email: " + sender_email.Text + "\n\n";
        body += "Subject: " + sender_subject.Text + "\n\n";
        body += "Message: \n" + message.Text + "\n";

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