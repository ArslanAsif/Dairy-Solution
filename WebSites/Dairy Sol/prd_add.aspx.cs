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

    }
    protected void add_product_button_Click(object sender, EventArgs e)
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
                product_picture.SaveAs(Server.MapPath("~/images/products/"+product_picture.FileName));
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('File Uploaded!');", true);
            }
        }
        char[] arr = new char[50];
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = "insert into products (product_name, minimum_level, description, specs, picture, short_description) values (@product_name, @product_min_level, @product_description, @product_spec, @product_picture, @short_description);";
        SqlCommand cmd = new SqlCommand(query, con);

        string sub_str = "";
        string str = product_description.Value;
        if (str.Length <= 120)
        {
            sub_str = str;
        }
        else
        {
            sub_str = str.Substring(0, 120);
            sub_str = sub_str + "...";
        }
        cmd.Parameters.AddWithValue("@product_name", product_name.Text);
        cmd.Parameters.AddWithValue("@product_min_level", product_min_level.Text);
        cmd.Parameters.AddWithValue("@product_description", product_description.Value);
        cmd.Parameters.AddWithValue("@product_spec", product_spec.Value);
        cmd.Parameters.AddWithValue("@product_picture", "images/products/" + product_picture.PostedFile.FileName.ToString());
        cmd.Parameters.AddWithValue("@short_description", sub_str);
        cmd.Connection = con;

        con.Open();
        //SqlDataReader dr = cmd.ExecuteReader();
        cmd.ExecuteNonQuery();
        //for insert remove data reader and replace cmd.executenonquery()

        con.Close();
    }
    
}