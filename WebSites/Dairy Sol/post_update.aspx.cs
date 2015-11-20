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

        if (!Page.IsPostBack)
        {
            retrieve_data();
        }
    }
    string picture = "";
    protected void retrieve_data( ) 
    { 
        string post_id = Request.QueryString["id"];
        string query = "SELECT * from posts where post_id = '"+ post_id +"'";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if( dr.HasRows )
            {
                date.Text = dr["date"].ToString();
                Image1.ImageUrl = dr["picture"].ToString();
                postHeading.Text = dr["heading"].ToString();
                postSummary.InnerText = dr["summary"].ToString();
                postDetail.InnerText = dr["detail"].ToString();  
            }
        }// while loop

        con.Close();
    }

    protected void updatePost_Click(object sender, EventArgs e) 
    {
        string post_id = Request.QueryString["id"];
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        string query = "UPDATE posts SET heading=@heading, summary=@summary, detail=@detail, picture=@picture, date=@date WHERE post_id = '" + post_id + "'";
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        
        cmd.Parameters.AddWithValue("@heading", postHeading.Text);
        cmd.Parameters.AddWithValue("@summary", postSummary.InnerText);
        cmd.Parameters.AddWithValue("@detail", postDetail.InnerText);
        cmd.Parameters.AddWithValue("@date",date.Text);

        if (postImage.PostedFile.FileName != "")
        {
            cmd.Parameters.AddWithValue("@picture", "images/updates/" + postImage.PostedFile.FileName.ToString());
        }
        else 
        {
            cmd.Parameters.AddWithValue("@picture", Image1.ImageUrl);
        }

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("post_manage.aspx");
    }

    protected void changeDate(object sender, EventArgs e) 
    {
        date.Text = Convert.ToString(DateTime.Now);
    }
    protected void changePic(object sender, EventArgs e)
    {
        if (postImage.HasFile)
        {
            string extension = System.IO.Path.GetExtension(postImage.FileName);
            if (extension.ToLower() != ".gif" && extension.ToLower() != ".png" && extension.ToLower() != ".jpg" && extension.ToLower() != ".jpeg")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Invalid Image Format!');", true);
            }
            else
            {
                string pathName = "images/" + Path.GetFileName(postImage.PostedFile.FileName);
                postImage.SaveAs(Server.MapPath("~/images/updates/" + postImage.FileName));
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('File Uploaded!');", true);
            }
        }
        Image1.ImageUrl = "images/updates/" + postImage.PostedFile.FileName.ToString();
        picture = Image1.ImageUrl;
    }
}