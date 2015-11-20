using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
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
                    Response.Redirect("mng_dashboard.aspx");
                    break;

                default:
                    Response.Redirect("site_signIn.aspx");
                    break;

            }
        }
    }
    protected void add_product_button_Click(object sender, EventArgs e)
    {
        try
        {

            if (product_picture.HasFile)
            {
                string extension = System.IO.Path.GetExtension(product_picture.FileName);
                if (extension.ToLower() != ".gif" && extension.ToLower() != ".png" && extension.ToLower() != ".jpg" && extension.ToLower() != ".jpeg")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Invalid Image Format!');", true);
                }
                else
                {
                    string pathName = "images/" + Path.GetFileName(product_picture.PostedFile.FileName);
                    product_picture.SaveAs(Server.MapPath("~/images/products/" + product_picture.FileName));
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('File Uploaded!');", true);
                }
            }
            char[] arr = new char[50];
            string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);

            String query = "insert into products (product_name, minimum_level, description, specs, picture) values (@product_name, @product_min_level, @product_description, @product_spec, @product_picture)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@product_name", product_name.Text);
            cmd.Parameters.AddWithValue("@product_min_level", product_min_level.Text);
            cmd.Parameters.AddWithValue("@product_description", product_description.Value);
            cmd.Parameters.AddWithValue("@product_spec", product_spec.Value);
            cmd.Parameters.AddWithValue("@product_picture", "images/products/" + product_picture.PostedFile.FileName.ToString());
            cmd.Connection = con;

            con.Open();
            //SqlDataReader dr = cmd.ExecuteReader();
            cmd.ExecuteNonQuery();
            //for insert remove data reader and replace cmd.executenonquery()

            alert_success.Visible = true;

            con.Close();
        }
        catch (Exception ex)
        {
            alert_fail.Visible = true;
            error.Text = "Error! " + ex.ToString();
        }
    }
}