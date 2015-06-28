using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindRepeater();
    }

    protected void check_user(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("site_signin.aspx");
        }// if session not created
        else
        {
            Button btn = (Button)sender;
            string prod_id = btn.CommandArgument.ToString();
            int prod_price = 0;
            string prod_name = "", prod_picture = "";

            string query = "select products.product_id, products.product_name, products.picture, inventory_products.price, inventory_products.entry_date from products inner join inventory_products on products.product_id = inventory_products.product_id where products.product_id = '"+prod_id+"' And entry_date = (Select MIN(entry_date) From inventory_products Where product_id = '"+prod_id+"')";
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
                    check_data( prod_price, prod_name, prod_picture, prod_id );
                }
            }// end while loop
            Response.Redirect("online_order.aspx");
        }
    }

    protected void insert_values( int price, string name, string picture, string id ) 
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
        cmd.Parameters.AddWithValue("@session_id", Session["userId"].ToString());

        cmd.Connection = con;

        con.Open();
        cmd.ExecuteNonQuery();

        con.Close();
        Response.Redirect("online_order.aspx");
    }

    protected void check_data(int price, string name, string picture, string id) 
    {
        bool found = false;
        string query = "SELECT * FROM order_page_info WHERE session_id = '" + Session["userId"].ToString() + "'";
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
            insert_values( price, name, picture, id );
        }
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if( e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem )
        {
            Label label = (Label)e.Item.FindControl("change_text");
            Button btn = (Button)e.Item.FindControl("order_btn");

            string query = "SELECT description FROM products WHERE product_id = '" +btn.CommandArgument+ "'";
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
                    string sub_str = "";
                    string str = dr["description"].ToString();
                    
                    if (str.Length <= 120)
                    {
                        sub_str = str;
                    }
                    else
                    {
                        sub_str = str.Substring(0, 120);
                        sub_str = sub_str + "...";
                    }
                    label.Text = sub_str;
                }
            }// end while
            
        }// end if
    }


    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
            {
                return Convert.ToInt32(ViewState["PageNumber"]);
            }
            else
            {
                return 0;
            }
        }
        set { ViewState["PageNumber"] = value; }
    }



    private void BindRepeater()
    {
        //Do your database connection stuff and get your data
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        cmd.CommandText = "SELECT * FROM products";

        //save the result in data table
        DataTable dt = new DataTable();
        ad.SelectCommand = cmd;
        ad.Fill(dt);

        //Create the PagedDataSource that will be used in paging
        PagedDataSource pgitems = new PagedDataSource();
        pgitems.DataSource = dt.DefaultView;
        pgitems.AllowPaging = true;

        //Control page size from here 
        pgitems.PageSize = 6;
        pgitems.CurrentPageIndex = PageNumber;
        if (pgitems.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList pages = new ArrayList();
            for (int i = 0; i <= pgitems.PageCount - 1; i++)
            {
                pages.Add((i + 1).ToString());
            }
            rptPaging.DataSource = pages;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }

        //Finally, set the datasource of the repeater
        Repeater1.DataSource = pgitems;
        Repeater1.DataBind();
    }

    //This method will fire when clicking on the page no link from the pager repeater
    protected void rptPaging_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        BindRepeater();
    }
    protected void rptPaging_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("btnPage");
            if (lnkbtnPage.CommandArgument.ToString() == (PageNumber + 1).ToString())
            {
                lnkbtnPage.Enabled = false;
                lnkbtnPage.ForeColor = System.Drawing.Color.White;
                lnkbtnPage.Style.Add("background-color", "#2E8AE6");
                lnkbtnPage.Font.Bold = true;
            }
        }
    }


}