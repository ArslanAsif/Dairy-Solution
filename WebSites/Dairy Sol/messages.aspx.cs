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

    protected void send_message_Click(object sender, EventArgs e)
    {
        string user_name = Session["userId"].ToString();

        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = " INSERT INTO messages(message, source_id, dest_id, date) VALUES(@message, @source_id, @dest_id, @date)";

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@message", message.Text);
        cmd.Parameters.AddWithValue("@source_id", user_name);
        cmd.Parameters.AddWithValue("@dest_id", send_to.Text);
        cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());

        cmd.Connection = con;

        con.Open();

        cmd.ExecuteNonQuery();
        //for insert remove data reader and replace cmd.executenonquery()

        Response.Redirect("messages.aspx");

        con.Close();
    }
}