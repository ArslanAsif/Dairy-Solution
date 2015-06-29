using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
    string pass = null;
    string picture = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userId"] == null) { Response.Redirect("site_signIn.aspx"); }

        if (IsPostBack)
        {
            alert_success.Visible = false;
            alert_fail.Visible = false;
        }

        if (!Page.IsPostBack)
        {
            load_emp_data();
        }
    }

    protected void load_emp_data()
    {
        string emp_id = Session["userId"].ToString();
        string query = "SELECT employee_name, employee_picture, password FROM employee_info WHERE employee_id = '" + emp_id + "'";

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
                emp_img.ImageUrl = "../"+dr["employee_picture"].ToString();
                emp_name.Text = dr["employee_name"].ToString();
                pass = dr["password"].ToString();

            }
        }
        con.Close();
    }

    protected void load_pic_Click(object sender, EventArgs e)
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
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('File Uploaded!');", true);
            }
        }
        emp_img.ImageUrl = "images/employee_picture/" + empl_image.PostedFile.FileName.ToString();
        picture = emp_img.ImageUrl;
    }
    protected void update_info_Click(object sender, EventArgs e)
    {
        try
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

            string emp_id = Session["userId"].ToString();
            int x = check_pass();

            if (x == 1)
            {
                string query = "UPDATE employee_info SET password=@password, employee_picture=@picture WHERE employee_id = '" + emp_id + "'";
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = query;

                cmd.Parameters.AddWithValue("@password", new_pass1.Text);

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

                alert_success.Visible = true;
                alert_fail.Visible = false;

                emp_pass.Text = "";
                new_pass1.Text = "";
                new_pass2.Text = "";
            }

            else if(x == 0)
            {
                string query = "UPDATE employee_info SET employee_picture=@picture WHERE employee_id = '" + emp_id + "'";
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = query;

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

                alert_success.Visible = true;
                alert_fail.Visible = false;

            }
        }
        catch(Exception ex)
        {
            alert_fail.Visible = true;
            error.Text = "Error! " + ex.ToString();
        }
    }

    protected int check_pass()
    {
        if((emp_pass.Text == "") && (new_pass1.Text == "") && (new_pass2.Text == ""))
        {
            return 0;
        }

        if (emp_pass.Text != pass)
        {
            alert_fail.Visible = true;
            error.Text = "Authentication Failed! Incorrect Password";

            return -1;
        }

        if (new_pass1.Text != new_pass2.Text)
        {
            alert_fail.Visible = true;
            error.Text ="Password missmatch.";

            return -1;
        }
        
        return 1;
    }
}