using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void srch_btn_Click(object sender, EventArgs e)
    {
        if (search.Text == "")
        {
            emp_attendance_GridView.DataSourceID = "SqlDataSource1";
        }
        else
        {
            emp_attendance_GridView.DataSourceID = "SqlDataSource2";
        }
    }
}