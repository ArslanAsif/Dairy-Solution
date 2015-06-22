using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string src_id = null;
    string sndr_name = null;
    string x;
    protected void Page_Load(object sender, EventArgs e)
    {
        //ListItem defaultItem = new ListItem("--Select Name--", "-1");
        //msg_DropDownList.Items.Add(defaultItem);
        if (Session["userId"] == null) { Response.Redirect("site_signIn.aspx"); }

        x = Request.QueryString["id"];
        if (!IsPostBack && x != null)
        {
            string user_name = Session["userId"].ToString();

            string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);

            String query = "SELECT TOP 1 e.employee_name FROM messages AS m INNER JOIN employee_info AS e ON m.source_id = e.employee_id WHERE dest_id = '" + user_name + "' AND source_id = '"+ int.Parse(x) +"'";

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                src_id = x;
                newLabel.Text = src_id;
                sndr_name = dr["employee_name"].ToString();
                get_sender_name.InnerText = sndr_name;
            }

            con.Close();
        }

        if (!IsPostBack && src_id == null && sndr_name == null)
        {
            last_msg();
        }

        BindRepeater();
    }

    protected void last_msg()
    {
        string user_name = Session["userId"].ToString();

        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = "SELECT TOP 1 m.source_id, e.employee_name FROM messages AS m INNER JOIN employee_info AS e ON m.source_id = e.employee_id WHERE dest_id = '" + user_name + "' ORDER BY date DESC";

        SqlCommand cmd = new SqlCommand(query, con);

        con.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            src_id = dr["source_id"].ToString();
            newLabel.Text = src_id;
            sndr_name = dr["employee_name"].ToString();
            get_sender_name.InnerText = sndr_name;
        }

        con.Close();


    }


    protected void send_message_Click(object sender, EventArgs e)
    {
        string user_name = Session["userId"].ToString();

        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = "INSERT INTO messages(message, source_id, dest_id, date) VALUES(@message, @source_id, @dest_id, @date)";

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@message", message1.Text);
        cmd.Parameters.AddWithValue("@source_id", user_name);
        cmd.Parameters.AddWithValue("@dest_id", msg_DropDownList.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());

        cmd.Connection = con;

        con.Open();

        cmd.ExecuteNonQuery();
        //for insert remove data reader and replace cmd.executenonquery()

        Response.Redirect("messages.aspx?id=" + msg_DropDownList.SelectedItem.Value);

        con.Close();
    }

    protected void msg_submit2_Click(object sender, EventArgs e)
    {
        string user_name = Session["userId"].ToString();

        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = " INSERT INTO messages(message, source_id, dest_id, date) VALUES(@message, @source_id, @dest_id, @date)";

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@message", message_input.Text);
        cmd.Parameters.AddWithValue("@source_id", user_name);
        cmd.Parameters.AddWithValue("@dest_id", newLabel.Text);
        cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());

        cmd.Connection = con;

        con.Open();

        cmd.ExecuteNonQuery();
        //for insert remove data reader and replace cmd.executenonquery()

        Response.Redirect("messages.aspx?id=" + newLabel.Text);

        con.Close();
    }
    protected void getIdbtn_Click(object sender, EventArgs e)
    {
        string[] arg = new string[2];

        Button btn = (Button)sender;
        arg = btn.CommandArgument.ToString().Split(';');
        src_id = arg[0];
        newLabel.Text = src_id;
        sndr_name = arg[1];
        get_sender_name.InnerText = sndr_name;

        BindRepeater();
    }



    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
            {
                return Convert.ToInt32(ViewState["PageNumber"]);
            }
            else
            {
                return 0;
            }
        }
        set { ViewState["PageNumber"] = value; }
    }



    private void BindRepeater()
    {
        int user_id = int.Parse(Session["userId"].ToString());
        int source_id = int.Parse(newLabel.Text);
        //Do your database connection stuff and get your data
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        cmd.CommandText = "SELECT m.source_id, e.employee_picture, e.employee_name, m.status, m.message, m.date FROM (SELECT * from messages WHERE (((dest_id = '" + user_id + "') AND (source_id = '" + source_id + "')) OR ((source_id = '" + user_id + "') AND (dest_id = '" + source_id + "'))) ) AS m INNER JOIN employee_info AS e ON m.source_id = e.employee_id ORDER BY date DESC";

        //save the result in data table
        DataTable dt = new DataTable();
        ad.SelectCommand = cmd;
        ad.Fill(dt);

        //Create the PagedDataSource that will be used in paging
        PagedDataSource pgitems = new PagedDataSource();
        pgitems.DataSource = dt.DefaultView;
        pgitems.AllowPaging = true;

        //Control page size from here 
        pgitems.PageSize = 10;
        pgitems.CurrentPageIndex = PageNumber;
        if (pgitems.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList pages = new ArrayList();
            for (int i = 0; i <= pgitems.PageCount - 1; i++)
            {
                pages.Add((i + 1).ToString());
            }
            rptPaging.DataSource = pages;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }

        //Finally, set the datasource of the repeater
        Repeater3.DataSource = pgitems;
        Repeater3.DataBind();
    }

    //This method will fire when clicking on the page no link from the pager repeater
    protected void rptPaging_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        BindRepeater();
    }
    protected void rptPaging_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("btnPage");
            if (lnkbtnPage.CommandArgument.ToString() == (PageNumber + 1).ToString())
            {
                lnkbtnPage.Enabled = false;
                lnkbtnPage.ForeColor = System.Drawing.Color.White;
                lnkbtnPage.Style.Add("background-color", "#2E8AE6");
                lnkbtnPage.Font.Bold = true;
            }
        }
    }
}