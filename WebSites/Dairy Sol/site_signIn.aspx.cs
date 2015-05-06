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
            string emp_query = "select * from employee_info where email_id ='" + inputEmail.Text + "' and password = '" + inputPass.Text + "'";
            string cus_query = "select * from customer_info where customer_email_id ='" + inputEmail.Text + "' and customer_password = '" + inputPass.Text + "'";
            string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString; 
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            string redirect = "";
            string user = "";
            string username;
            if (radioOptions1.SelectedValue == "Employee")
            {
                cmd.CommandText = emp_query;
                redirect = "mng_dashboard.aspx";
                user = "employee_id";
                username  = "Employee_name";
            }
            else
            {
                cmd.CommandText = cus_query;
                redirect = "site_products.aspx";
                user = "customer_id";
                username = "Customer_name";
            }

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while(dr.Read()){
            //for insert remove data reader and replace cmd.executenonquery()
            if (dr.HasRows)
            {
                Session["userId"] = dr[user];
                Session["username"] = dr[username];
                Response.Redirect(redirect);
            }
            else
                Response.Redirect("site_signIn.aspx");
            con.Close();
    }
    }
    protected void signUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("customer_signup.aspx");
    }
    
}