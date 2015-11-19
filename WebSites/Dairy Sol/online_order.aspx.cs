using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["cust_username"] == null)
        {
            Response.Redirect("site_signIn.aspx");
        }
    }

    protected void clear_cart_Click(object sender, EventArgs e)
    {
        string cust_id = Session["cust_userId"].ToString();
        string query = "DELETE FROM order_page_info WHERE session_id = '" +cust_id+ "'";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        con.Open();
        
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("site_products.aspx");
    }
    protected void check_out_btn_click(object sender, EventArgs e)
    {
        Response.Redirect("site_online_order.aspx");
    }
}