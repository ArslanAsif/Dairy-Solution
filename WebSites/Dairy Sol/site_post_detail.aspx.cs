using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string post_id = Request.QueryString["id"];
        string query = "SELECT * FROM posts where post_id = '"+ post_id +"'";
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
                heading.InnerText = dr["heading"].ToString();
                post_image.ImageUrl = dr["picture"].ToString();
                parag.InnerText = dr["detail"].ToString();
                
                if( parag.InnerText == "" )
                {
                    parag.InnerText = "Not Available";
                }
            }
            else
                Response.Redirect("products.aspx");
        }
        con.Close();
    }
}