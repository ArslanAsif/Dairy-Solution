using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ( Session["username"] == null &&  Session["cust_username"] == null )
        {
            login_status.Visible = false;
            link.Visible = true;
        }
        else
        {
            login_status.Visible = true;
            link.Visible = false;
            if (Session["username"] != null)
            {
                login_status.InnerText = Session["username"].ToString();
            }
            else
                login_status.InnerText = Session["cust_username"].ToString();
            
        }
    }

    protected void decide(object sender, EventArgs e)
    {
        if (login_status.InnerText == "Log Out")
        {
            Session.Clear();
        }
        Response.Redirect("site_signin.aspx");
    }
}
