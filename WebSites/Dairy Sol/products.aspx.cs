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
        Label1.Text = Session["username"].ToString();
    }

    protected void check_user(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("site_signin.aspx");
        }
        else
        {
            Response.Redirect("online_order.aspx");
        }
    }

}