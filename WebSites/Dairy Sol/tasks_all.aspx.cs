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
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void add_task_Click(object sender, EventArgs e)
    {
        string user_name = Session["userId"].ToString();


        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = " INSERT INTO tasks(task_desc, task_date, task_type, added_on, added_by, added_to) VALUES(@task_desc, @task_date, @task_type, @added_on, @added_by, @added_to)";

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@task_desc", task_desc.Text);
        cmd.Parameters.AddWithValue("@task_date", task_date.Text);
        cmd.Parameters.AddWithValue("@task_type", task_type.Text);
        cmd.Parameters.AddWithValue("@added_on", DateTime.Now.ToString());
        cmd.Parameters.AddWithValue("@added_by", user_name);
        cmd.Parameters.AddWithValue("@added_to", emp_DropDownList.SelectedItem.Value);

        cmd.Connection = con;

        con.Open();

        cmd.ExecuteNonQuery();
        //for insert remove data reader and replace cmd.executenonquery()

        Response.Redirect("tasks_all.aspx");

        con.Close();
    }
}