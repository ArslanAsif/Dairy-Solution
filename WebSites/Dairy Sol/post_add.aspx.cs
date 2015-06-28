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
    protected void addPost_Click(object sender, EventArgs e)
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Post Uploaded!');", true);
            }
        }

        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = "insert into posts (heading, summary, detail, picture, date) values (@postHeading, @postSummary, @postDetail, @postImage, @date);";
        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@postHeading", postHeading.Text);
        cmd.Parameters.AddWithValue("@postSummary", postSummary.Value);
        cmd.Parameters.AddWithValue("@postDetail", postDetail.Value);
        cmd.Parameters.AddWithValue("@postImage", "images/updates/" + postImage.PostedFile.FileName.ToString());
        cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());
        cmd.Connection = con;

        con.Open();
        //SqlDataReader dr = cmd.ExecuteReader();
        cmd.ExecuteNonQuery();
        //for insert remove data reader and replace cmd.executenonquery()

       
        con.Close();
    }
}