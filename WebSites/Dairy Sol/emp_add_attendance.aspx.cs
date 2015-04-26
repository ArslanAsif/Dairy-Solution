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
        CurrentTime.Text = DateTime.Now.ToString();
        load_dropdown();
    }
    protected void mark_attendance_Click(object sender, EventArgs e)
    {
        attendance_marked.Text = "Attendance marked successfully!";
        attendance_marked.EnableViewState = true;
        attendance_marked.Visible = true;
        attendance_marked.ForeColor = System.Drawing.Color.Green;
    }

    protected void load_dropdown()
    {
        /*string constring = @"Data Source=ACER;Initial Catalog=Dairy_Solution;Integrated Security=True";
        SqlCommand cmd = new SqlCommand("SELECT * FROM [employee_info]", new SqlConnection(System.Configuration.ConfigurationManager.AppSettings[constring]));
        cmd.Connection.Open();

        SqlDataReader ddlValues;
        ddlValues = cmd.ExecuteReader();

        DropDownList1.DataSource = ddlValues;
        DropDownList1.DataValueField = "theCity";
        DropDownList1.DataTextField = "theCity";
        DropDownList1.DataBind();

        cmd.Connection.Close();
        cmd.Connection.Dispose();*/

        /*string constr = System.Configuration.ConfigurationManager.ConnectionStrings["binddropdown"].ToString(); // connection string
        SqlConnection con = new SqlConnection(constr);
        con.Open();

        SqlCommand com = new SqlCommand("select employee_name from employee_info", con); // table name 
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);  // fill dataset
        DropDownList1.DataTextField = ds.Tables[0].Columns["FirstName"].ToString(); // text field name of table dispalyed in dropdown
        DropDownList1.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name 
        DropDownList1.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
        DropDownList1.DataBind();  //binding dropdownlist*/
    }
}