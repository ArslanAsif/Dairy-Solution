﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
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
                    break;

                default:
                    Response.Redirect("site_signIn.aspx");
                    break;

            }
        }
    }

    protected void srch_btn_Click(object sender, EventArgs e)
    {
        if (search.Text == "")
        {
            del_product_GridView.DataSourceID = "SqlDataSource1";
        }
        else
        {
            del_product_GridView.DataSourceID = "SqlDataSource2";
        }
    }
}