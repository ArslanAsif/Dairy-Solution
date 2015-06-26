using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int emp_id = -1;

            if (Request.QueryString != null && Request.QueryString.Count > 0)
            {
                emp_id = int.Parse(Request.QueryString["id"]);
            }
            else
            {
                emp_id = int.Parse(Session["userId"].ToString());
            }
            SqlConnection con = new SqlConnection(constring);
            string query = "SELECT e.[employee_name], e.[date_of_birth], e.[gender], e.[marital_status], e.[father_name], e.[cnic], e.[no_of_children], e.[phone_number], e.[mobile_number], e.[email_id], e.[employee_picture], ci.date_of_joining, ci.designation, ci.loan_gained, s.basic_salary, s.allowance, s.medical_allowance, s.loan_deduction, a.permanent_address, a.other_address, a.city FROM [employee_info] AS e INNER JOIN employee_company_info AS ci ON e.employee_id = ci.employee_id INNER JOIN employee_net_salary AS s ON e.employee_id = s.employee_id INNER JOIN employee_address AS a ON e.employee_id = a.employee_id WHERE e.employee_id = '" + emp_id + "'";
            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                name.Text = dr["employee_name"].ToString();
                dob.Text = dr["date_of_birth"].ToString();
                gender.Text = dr["gender"].ToString();
                ms.Text = dr["marital_status"].ToString();
                father.Text = dr["father_name"].ToString();
                cnic.Text = dr["cnic"].ToString();
                noc.Text = dr["no_of_children"].ToString();
                phone.Text = dr["phone_number"].ToString();
                mobile.Text = dr["mobile_number"].ToString();
                email.Text = dr["email_id"].ToString();
                emp_img.ImageUrl = dr["employee_picture"].ToString();
                doj.Text = dr["date_of_joining"].ToString();
                desig.Text = dr["designation"].ToString();
                loan.Text = dr["loan_gained"].ToString();
                salary.Text = dr["basic_salary"].ToString();
                allow.Text = dr["allowance"].ToString();
                med_allow.Text = dr["medical_allowance"].ToString();
                loan_deduct.Text = dr["loan_deduction"].ToString();
                if (dr["permanent_address"].ToString() != "")
                {
                    add.Text = dr["permanent_address"].ToString() + ", " + dr["city"].ToString();
                }

                if (dr["other_address"].ToString() != "")
                {
                    other_add.Text = dr["other_address"].ToString() + ", " + dr["city"].ToString();
                }
            }
            else
            {
                Response.Redirect("mng_dashboard.aspx?error=404");
            }

            con.Close();
        }
        catch (Exception ex)
        {
            alert_fail.Visible = true;
            error.Text = "Error! " + ex.ToString();
        }
    }
}