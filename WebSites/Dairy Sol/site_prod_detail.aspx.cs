using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string prod_id = Request.QueryString["id"];
        string query = "SELECT inventory_products.price, inventory_products.quantity, products.product_name, products.picture, products.specs, products.description FROM products INNER JOIN inventory_products ON products.product_id = inventory_products.product_id WHERE products.product_id = '" +prod_id+ "'";
        string constring = @"Data Source=ACER;Initial Catalog=Dairy_Solution;Integrated Security=True";
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            //for insert remove data reader and replace cmd.executenonquery()
            if (dr.HasRows)
            {
                heading.InnerText = dr["product_name"].ToString();
                prod_image.ImageUrl = dr["picture"].ToString();
                product_id.Text = prod_id;
                quantity.Text = dr["quantity"].ToString();
                price.Text = dr["price"].ToString()+"/-";
                specs_para.InnerText = dr["specs"].ToString();
                description_para.InnerText = dr["description"].ToString();
                
                if (Convert.ToInt16(dr["quantity"].ToString()) > 0)
                {
                    availability.Text = "Available";
                }
                else
                {
                    availability.Text = "Not Available";
                    add_to_cart.Disabled = true;
                }

                if( description_para.InnerText == "" )
                {
                    description_para.InnerText = "Not Available";
                }
                if( specs_para.InnerText == "" )
                {
                    specs_para.InnerText = "Not Available";
                }
                
            }
            else
                Response.Redirect("products.aspx");
        }
        con.Close();
    }
}