﻿using System;
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
        string prod_id = Request.QueryString["id"];
        string query = "select products.product_id, products.picture, products.specs, products.description, products.product_name, inventory_products.quantity,inventory_products.price, inventory_products.entry_date As Date1  from products inner join inventory_products on products.product_id = inventory_products.product_id where products.product_id = '" + prod_id + "' And entry_date = (Select MIN(entry_date) From inventory_products Where product_id = '" + prod_id + "')";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
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
                    order_btn.Enabled = false;
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

    protected void check_user(object sender, EventArgs e)
    {
        if (Session["cust_username"] == null)
        {
            Response.Redirect("site_signin.aspx");
        }// if session not created
        else
        {
            Button btn = (Button)sender;
            string prod_id = Request.QueryString["id"];
            int prod_price = 0;
            string prod_name = "", prod_picture = "";

            string query = "SELECT inventory_products.price, products.product_name, products.picture, products.product_id FROM products INNER JOIN inventory_products ON products.product_id = inventory_products.product_id WHERE products.product_id = '" + prod_id + "'";
            string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = query;

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    prod_price = Convert.ToInt32(dr["price"].ToString());
                    prod_name = dr["product_name"].ToString();
                    prod_picture = dr["picture"].ToString();
                    check_data(prod_price, prod_name, prod_picture, prod_id);
                }
            }// end while loop
            Response.Redirect("online_order.aspx");
        }
    }

    protected void insert_values(int price, string name, string picture, string id)
    {
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = "insert into order_page_info (product_name, product_picture, product_price, product_id, quantity, session_id) values (@product_name, @product_picture, @product_price, @product_id, @quantity, @session_id)";
        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@product_name", name);
        cmd.Parameters.AddWithValue("@product_picture", picture);
        cmd.Parameters.AddWithValue("@product_price", price);
        cmd.Parameters.AddWithValue("@product_id", id);
        cmd.Parameters.AddWithValue("@quantity", "1");
        cmd.Parameters.AddWithValue("@session_id", Session["cust_userId"].ToString());

        cmd.Connection = con;

        con.Open();
        cmd.ExecuteNonQuery();

        con.Close();
        Response.Redirect("online_order.aspx");
    }

    protected void check_data(int price, string name, string picture, string id)
    {
        bool found = false;
        string query = "SELECT * FROM order_page_info WHERE session_id = '" + Session["cust_userId"].ToString() + "'";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (dr.HasRows)
            {
                if (dr["product_id"].ToString() == id)
                {
                    found = true;
                }
            }
        }// end while loop
        if (found == true)
        {
            Response.Redirect("online_order.aspx");
        }
        else
        {
            insert_values(price, name, picture, id);
        }
    }
}