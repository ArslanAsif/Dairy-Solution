using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            Session.Clear();
        }
    }
    protected void SignIn_Click(object sender, EventArgs e)
    {
        string emp_query = "select e.employee_id, e.employee_name, c.designation from employee_info e INNER JOIN employee_company_info c ON e.employee_id = c.employee_id where email_id ='" + inputEmail.Value + "' and password = '" + inputPass.Value + "'";
            string cus_query = "select * from customer_info where customer_email_id ='" + inputEmail.Value + "' and customer_password = '" + inputPass.Value + "'";
            string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString; 
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            int x = 0;
            
            cmd.CommandText = emp_query;

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //for insert remove data reader and replace cmd.executenonquery()
                if (dr.HasRows)
                {
                    Session["userId"] = dr["employee_id"];
                    Session["userName"] = dr["employee_name"];
                    Session["designation"] = dr["designation"];

                    if (Session["designation"].ToString() == "CEO")
                    {
                        Response.Redirect("mng_dashboard.aspx");
                    }

                    else if (Session["designation"].ToString() == "Sales Person")
                    {
                        Response.Redirect("~/sales_person/mng_dashboard.aspx");
                    }

                    else if (Session["designation"].ToString() == "Receptionist")
                    {
                        Response.Redirect("~/receptionist/mng_dashboard.aspx");
                    }

                    else if (Session["designation"].ToString() == "Inventory Manager")
                    {
                        Response.Redirect("~/inv_manager/mng_dashboard.aspx");
                    }
                    
                    x = 1;
                }
            }
            con.Close();

            //Customer sign in
            cmd.CommandText = cus_query;

            con.Open();
            SqlDataReader dr2 = cmd.ExecuteReader();
            while (dr2.Read())
            {
                //for insert remove data reader and replace cmd.executenonquery()
                if (dr2.HasRows)
                {
                    Session["userId"] = dr2["customer_id"];
                    Session["userName"] = dr2["customer_name"];
                    Response.Redirect("site_products.aspx");
                    x = 1;
                }
                    
            }
            con.Close();

            err_msg.Text = "Invalid username or password.";
    }

    protected void get_type()
    {
        
    }
    protected void signUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("customer_signup.aspx");
    }
    
}