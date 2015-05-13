using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
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
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = " INSERT INTO customer_queries(sender_name, sender_email, subject, message) VALUES(@name, @email, @subject, @message)";
        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@name", sender_name.Text);
        cmd.Parameters.AddWithValue("@email", sender_email.Text);
        cmd.Parameters.AddWithValue("@subject", subject.Text);
        cmd.Parameters.AddWithValue("@message", message.Text);
        cmd.Connection = con;

        con.Open();

        cmd.ExecuteNonQuery();
        //for insert remove data reader and replace cmd.executenonquery()

        submitMsg.Text = "Successfully submitted!";
        alertMsg.Visible = true;

        subject.Text = string.Empty;
        message.Text = string.Empty;


        con.Close();
    }
}