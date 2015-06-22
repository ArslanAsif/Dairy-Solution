using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            retrieve_data();
        }
    }
    protected void retrieve_data()
    {
        string emp_id = Request.QueryString["id"];
        string query = "SELECT ei.*, ea.city, ea.permanent_address, ea.other_address from employee_info ei inner join employee_address ea on ei.employee_id = ea.employee_id where ei.employee_id = '"+emp_id+"'";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (dr.HasRows)
            {
                emp_img.ImageUrl = dr["employee_picture"].ToString();
                empl_Name.Text = dr["employee_name"].ToString();
                empl_Email.Text = dr["email_id"].ToString();
                empl_Pass.Text = dr["password"].ToString();
                empl_CNIC.Text = dr["cnic"].ToString();
                empl_marital_status.Text = dr["marital_status"].ToString();
                empl_no_children.Text = dr["no_of_children"].ToString();
                empl_no_siblings.Text = dr["siblings"].ToString();
                empl_phone_number.Text = dr["phone_number"].ToString();
                empl_Address.Text = dr["permanent_address"].ToString();

                string other_address = dr["other_address"].ToString();
                if( other_address != "" )
                {
                    empl_other_address.Text = other_address;
                }
                empl_city.Text = dr["city"].ToString();
                empl_Dob.Text = dr["date_of_birth"].ToString();
            }
        }// while loop

        con.Close();
    }

    protected void updatePost_Click(object sender, EventArgs e)
    {
        if (empl_image.HasFile)
        {
            string extension = System.IO.Path.GetExtension(empl_image.FileName);
            if (extension.ToLower() != ".gif" && extension.ToLower() != ".png" && extension.ToLower() != ".jpg" && extension.ToLower() != ".jpeg")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Invalid Image Format!');", true);
            }
            else
            {
                string pathName = "images/" + Path.GetFileName(empl_image.PostedFile.FileName);
                empl_image.SaveAs(Server.MapPath("~/images/employee_picture/" + empl_image.FileName));
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('File Uploaded!');", true);
            }
        }
        string emp_id = Request.QueryString["id"];
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        string query = "UPDATE employee_info SET employee_name=@employee_name, email_id=@email_id, password=@password, cnic=@cnic, marital_status=@marital_status, no_of_children=@no_of_children, siblings=@siblings, phone_number=@phone_number, date_of_birth=@date_of_birth, employee_picture=@picture WHERE employee_id = '" + emp_id + "'" +
            "UPDATE employee_address SET permanent_address=@permanent_address, other_address=@other_address, city=@city WHERE employee_id='"+emp_id+"'";
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;

        cmd.Parameters.AddWithValue("@employee_name", empl_Name.Text);
        cmd.Parameters.AddWithValue("@email_id", empl_Email.Text);
        cmd.Parameters.AddWithValue("@password", empl_Pass.Text);
        cmd.Parameters.AddWithValue("@cnic", empl_CNIC.Text);
        cmd.Parameters.AddWithValue("@marital_status", empl_marital_status.Text);
        cmd.Parameters.AddWithValue("@no_of_children", empl_no_children.Text);
        cmd.Parameters.AddWithValue("@siblings", empl_no_siblings.Text);
        cmd.Parameters.AddWithValue("@phone_number", empl_phone_number.Text);
        cmd.Parameters.AddWithValue("@date_of_birth", empl_Dob.Text);
        cmd.Parameters.AddWithValue("@permanent_address", empl_Address.Text);
        cmd.Parameters.AddWithValue("@other_address", empl_other_address.Text);
        cmd.Parameters.AddWithValue("@city", empl_city.Text);

        if (empl_image.PostedFile.FileName != "")
        {
            cmd.Parameters.AddWithValue("@picture", "images/employee_picture/" + empl_image.PostedFile.FileName.ToString());
        }
        else
        {
            cmd.Parameters.AddWithValue("@picture", emp_img.ImageUrl);
        }

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("emp_list.aspx");
    }

    protected void changePic(object sender, EventArgs e)
    {
        if (empl_image.HasFile)
        {
            string fullPath;
            fullPath = Path.GetFullPath(Path.GetFileName(empl_image.PostedFile.FileName));
            label1.Text = fullPath;
            emp_img.ImageUrl = "";
        }
    }
    
}