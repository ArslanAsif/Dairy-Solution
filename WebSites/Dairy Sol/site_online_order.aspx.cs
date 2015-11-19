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
        select_data();
    }
    static int count = 0;
    
    protected void select_data() 
    {
        string query = "select product_id, product_name, product_price, quantity, (select customer_name from customer_info where customer_id = '" + Session["cust_userId"] + "') as customer_name from order_page_info where session_id = '" + Session["cust_userId"] + "'";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        string name = "";
        int total_products = 0, total_price = 0, unit_price = 0;
        bool present = false;

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (dr.HasRows)
            {
                name = dr["customer_name"].ToString();
                unit_price = Convert.ToInt32(dr["product_price"].ToString());
                unit_price = unit_price * Convert.ToInt32(dr["quantity"].ToString());
                present = true;
                total_price = total_price + unit_price;
                products[total_products] = Convert.ToInt32(dr["product_id"].ToString());
                prod_quantity[total_products] = Convert.ToInt32(dr["quantity"].ToString());
                total_products++;
            }
        }// end while loop
        if( present == true )
        {
            name_txt.Text = name;
            total_prd_text.Text = Convert.ToString(total_products);
            count = total_products;
            time_txt.Text = DateTime.Now.ToString();
            total_prd_text.Text = Convert.ToString(total_products);
            amount_txt.Text = Convert.ToString(total_price) + " /-";
            total.Text = Convert.ToString(total_price);
        }
        con.Close();
    }

    int[] products = new int[10];
    int[] prod_quantity = new int[10];

    protected void submit_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String order_insert_query = "INSERT INTO orders(order_date, customer_id) VALUES(@date, @customer_id)";

        SqlCommand cmd = new SqlCommand(order_insert_query, con);

        cmd.Parameters.AddWithValue("@customer_id", Session["cust_userId"].ToString());
        cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());
        
        cmd.Connection = con;
        con.Open();
        
        cmd.ExecuteNonQuery();
        con.Close();
        insert_services();
    }

    protected void insert_services()
    {
        string query = "SELECT TOP 1 order_id FROM orders where customer_id = '" + Session["cust_userId"] + "' ORDER BY order_id DESC";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            int order = Convert.ToInt32(dr["order_id"].ToString());
            
            for (int i = 0; i < count; i++ )
            {
                string constring1 = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
                String order_insert_query = "INSERT INTO services_or_products(product_id, quantity, order_id) VALUES (@product_id, @quantity, @order_id)";
                SqlConnection con1 = new SqlConnection(constring1);
                SqlCommand cmd1 = new SqlCommand(order_insert_query, con1);

                cmd1.Parameters.AddWithValue("@product_id", products[i]);
                cmd1.Parameters.AddWithValue("@quantity", prod_quantity[i]);
                cmd1.Parameters.AddWithValue("@order_id", order);

                cmd1.Connection = con1;
                con1.Open();

                cmd1.ExecuteNonQuery();
                con1.Close();
            }
            con.Close();
            delete_cart();
        }// delete cart if order is placed
    }

    protected void delete_cart()
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
}