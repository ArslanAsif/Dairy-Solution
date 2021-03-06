﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

public partial class inventory_in : System.Web.UI.Page
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
                    Response.Redirect("mng_dashboard.aspx");
                    break;

                case "Inventory Manager":
                    break;

                default:
                    Response.Redirect("site_signIn.aspx");
                    break;

            }
        }
    }
    private void showReport()
    {
        rptViewer.Reset();

        DataTable dt = GetData(DateTime.Parse(txtFrom.Text), DateTime.Parse(txtTo.Text));
        ReportDataSource rds = new ReportDataSource("DataSet1", dt);

        rptViewer.LocalReport.DataSources.Add(rds);

        rptViewer.LocalReport.ReportPath = "inventory_inReport.rdlc";

        ReportParameter[] rptParams = new ReportParameter[]
        {
          new ReportParameter("fromDate", txtFrom.Text),
          new ReportParameter("toDate", txtTo.Text)
        };
        rptViewer.LocalReport.SetParameters(rptParams);

        rptViewer.LocalReport.Refresh();
    }
    private DataTable GetData(DateTime fromDate, DateTime toDate)
    {
        DataTable dt = new DataTable();
        string constring = System.Configuration.ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(constring))
        {
            SqlCommand cmd = new SqlCommand("InventoryIn", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@From", SqlDbType.DateTime).Value = fromDate;
            cmd.Parameters.Add("@To", SqlDbType.DateTime).Value = toDate;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
        }
        return dt;
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        showReport();
    }
}