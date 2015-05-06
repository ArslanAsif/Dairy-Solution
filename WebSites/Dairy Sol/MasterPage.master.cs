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
        if ( Session["username"] == null )
        {
            login_status.InnerText = "Sign In";
        }
        else
        {
            login_status.InnerText = Session["username"].ToString();
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
