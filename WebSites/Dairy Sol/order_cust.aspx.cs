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
}