using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void srch_btn_Click(object sender, EventArgs e)
    {
        if (search.Text == "")
        {
            GridView1.DataSourceID = "SqlDataSource1";
        }
        else
        {
            GridView1.DataSourceID = "SqlDataSource2";
        }
    }
}