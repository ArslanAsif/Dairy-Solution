using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userType"] != null)
        {
            switch (Session["userType"].ToString())
            {
                case "CEO":
                    break;

                case "Receptionist":
                    Response.Redirect("mng_dashboard.aspx");
                    break;

                case "Sales Person":
                    break;

                case "Inventory Manager":
                    Response.Redirect("mng_dashboard.aspx");
                    break;

                default:
                    Response.Redirect("site_signIn.aspx");
                    break;

            }
        }
    }
    protected void order_customer_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
        {
            return;
        }
        string con = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        GridView grv1 = ((GridView)e.Row.FindControl("GridView1"));
        int row_id = int.Parse((order_customer_GridView.DataKeys[e.Row.RowIndex].Value.ToString()));
        string query = "select p.product_name from products p inner join services_or_products sop on sop.product_id = p.product_id where sop.order_id ='" + row_id + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grv1.DataSource = dt;
        grv1.DataBind();
    }


    protected void srch_btn_Click(object sender, EventArgs e)
    {
        if (search.Text == "")
        {
            order_customer_GridView.DataSourceID = "SqlDataSource1";
        }
        else
        {
            order_customer_GridView.DataSourceID = "SqlDataSource2";
        }
    }
}