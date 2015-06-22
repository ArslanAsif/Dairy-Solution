using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            user_name.Text = "Login";
            Response.Redirect("site_signin.aspx");
        }
        else
        {
            user_name.Text = Session["username"].ToString();
        }

        get_user_info();
    }// end function page_load

    protected void get_user_info()
    {
        string user_name = Session["userId"].ToString();

        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = "SELECT e.employee_name, e.employee_picture, c.designation FROM employee_info AS e INNER JOIN employee_company_info AS c ON e.employee_id = c.employee_id  WHERE e.employee_id = '" + user_name + "'";

        SqlCommand cmd = new SqlCommand(query, con);

        con.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {            
            usr_name.Text = dr["employee_name"].ToString();
            usr_designation.Text = dr["designation"].ToString();
            usr_image.ImageUrl = dr["employee_picture"].ToString();
        }

        con.Close();
    }

}