using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = " INSERT INTO supplier_order(supplier_name, order_date, quantity) VALUES(@supplier_name, @order_date, @quantity)";

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@supplier_name", supplier_name.Text);
        cmd.Parameters.AddWithValue("@order_date", order_date.Text);
        cmd.Parameters.AddWithValue("@quantity", prod_quantity.Text);
        
        cmd.Connection = con;
        con.Open();
        cmd.ExecuteNonQuery();
        inserting_value();

        Response.Redirect("order_odsupp.aspx");
        con.Close();
    }

    protected int finding_value() 
    {
        string cus_query = "SELECT TOP 1 order_id FROM supplier_order ORDER BY order_id DESC";
        string constring = @"Data Source=ACER;Initial Catalog=Dairy_Solution;Integrated Security=True";
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = cus_query;
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        int order_id = 0;

        while (dr.Read())
        {
            if (dr.HasRows)
            {
                order_id = Convert.ToInt32(dr["order_id"].ToString());
                return order_id;
            }
            con.Close();
        }// end while loop
        return -1;
    }

    protected void inserting_value()
    {
        string constring = @"Data Source=ACER;Initial Catalog=Dairy_Solution;Integrated Security=True";
        SqlConnection con = new SqlConnection(constring);

        String query = "INSERT INTO ordered_products (order_id, product_id) VALUES(@order_id, @product_id)";

        SqlCommand cmd = new SqlCommand(query, con);
        int order_id = finding_value();
        if (order_id != -1)
        {
            cmd.Parameters.AddWithValue("@order_id", finding_value());
            cmd.Parameters.AddWithValue("@product_id", product_id.Text);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();

            con.Close();
        }
    }
}