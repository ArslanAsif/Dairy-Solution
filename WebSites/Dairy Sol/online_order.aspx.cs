using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void clear_cart_Click(object sender, EventArgs e)
    {
        string cust_id = Session["username"].ToString();
        string query = "DELETE FROM order_page_info WHERE session_id = '" +cust_id+ "'";
        string constring = @"Data Source=ACER;Initial Catalog=Dairy_Solution;Integrated Security=True";
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}