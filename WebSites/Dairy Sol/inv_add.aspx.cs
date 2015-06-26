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
    
    protected void formReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("inv_add.aspx");
    }
    protected void add_inv_Click(object sender, EventArgs e)
    {
        try
        {
            string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);

            String query = "INSERT INTO inventory_products(product_id, price, entry_date, expiry_date, quantity, discount) VALUES(@product_id, @price, @entry_date, @expiry_date, @quantity, @discount)";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@product_id", ProdDropDownList.SelectedValue);
            cmd.Parameters.AddWithValue("@price", price.Text);
            cmd.Parameters.AddWithValue("@entry_date", DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@expiry_date", expiry.Text);
            cmd.Parameters.AddWithValue("@quantity", quantity.Text);
            cmd.Parameters.AddWithValue("@discount", discount.Text);

            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            alert_success.Visible = true;
        }
        catch (Exception ex)
        {
            alert_fail.Visible = true;
            error.Text = "Error! "+ex.ToString();
        }
    }
}