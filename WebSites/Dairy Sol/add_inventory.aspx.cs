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
        inventory_entry_date.Text = DateTime.Now.ToString();
    }
    protected void inventory_button_Click(object sender, EventArgs e)
    {
        try
        {
            string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);

            String query = " INSERT INTO inventory_products(product_id, price, entry_date, expiry_date, quantity, discount) VALUES(@product_id, @price, @entry_date, @expiry_date, @quantity, @discount)";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@product_id", inventory_product_id.Text);
            cmd.Parameters.AddWithValue("@price", product_price.Text);
            cmd.Parameters.AddWithValue("@entry_date", inventory_entry_date.Text);
            cmd.Parameters.AddWithValue("@expiry_date", expiry_date.Text);
            cmd.Parameters.AddWithValue("@quantity", inventory_quantity.Text);
            cmd.Parameters.AddWithValue("@discount", product_discount.Text);

            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            validate.EnableViewState = true;
            validate.Visible = true;
            validate.ForeColor = System.Drawing.Color.Green;
            validate.Text = "Inventory Added Successfully!";
        }
        catch( Exception ex )
        {
            validate.EnableViewState = true;
            validate.Visible = true;
            validate.ForeColor = System.Drawing.Color.Red;
            validate.Text = "Error Encountered while adding product!";
        }
    }
}