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
    protected void Submit_order(object sender, EventArgs e)
    {
        
    }
    protected void add_order_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString; 
        SqlConnection con = new SqlConnection(constring);

        String query = " INSERT INTO orders(employee_id, product_id, order_date, customer_id, description) VALUES(@employee_id, @product_id, @order_date, @customer_id, @description)" +
                        "INSERT INTO services_or_products (product_id, quantity, services) VALUES(@product_id, @quantity, @services)";
        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@employee_id", employee_id.Text);
        cmd.Parameters.AddWithValue("@customer_id", customer_id.Text);
        cmd.Parameters.AddWithValue("@order_date", date.Text);
        cmd.Parameters.AddWithValue("@product_id", product_id.Text);
        cmd.Parameters.AddWithValue("@description", product_description.Text);
        cmd.Parameters.AddWithValue("@quantity", product_quantity.Text);
        cmd.Parameters.AddWithValue("@services", services.Text);
        cmd.Connection = con;

        con.Open();
        
        cmd.ExecuteNonQuery();
        //for insert remove data reader and replace cmd.executenonquery()

        Response.Redirect("order_add.aspx");

        con.Close();
    }
}