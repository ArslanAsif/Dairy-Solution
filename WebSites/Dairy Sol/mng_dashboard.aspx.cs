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
        if (Session["username"] == null)
        {
            Response.Redirect("site_signIn.aspx");
        }
        if( !IsPostBack )
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "refresh", "window.setTimeout('window.location.reload(true);',120000);", true);
            count_products();
            check_tasks();
        }
    }

    protected void check_notification(string msg, string type)
    {
        string query = "select * from notifications where description = '"+msg+"'";
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;
        bool read = false;
        
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            if (dr.HasRows)
            {
                read = true;
            }
            else 
            {
                insert_notification(msg,type);
            }
        }// end while loop
        if( read == false )
        {
            insert_notification(msg, type);
        }
        read = false;
        con.Close();
    }

    protected void check_tasks()
    {
        string user_id = Session["userId"].ToString();
        string query = "select * from tasks where DATEDIFF(day, GETDATE(),task_date) = 0 and task_status = 0 and added_to = '"+user_id+"'";
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Reminder!"+"  "+dr["task_desc"].ToString()+"');", true);
                string constring1 = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
                string query1 = "UPDATE tasks SET task_status = '1' WHERE task_status = '0' and added_to = '"+user_id+"'";
                SqlConnection con1 = new SqlConnection(constring1);
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con1;
                cmd1.CommandText = query1;

                con1.Open();
                cmd1.ExecuteNonQuery();
                con1.Close();
            }
        }// end while loop
        
        con.Close();
    }

    protected void insert_notification( string msg, string type )
    {
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = "insert into notifications (description, date_time, status, type) values (@description, @date_time, @status, @type)";
        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@description", msg);
        cmd.Parameters.AddWithValue("@date_time", DateTime.Now);
        cmd.Parameters.AddWithValue("@status", "0");
        cmd.Parameters.AddWithValue("@type", type);

        cmd.Connection = con;

        con.Open();
        cmd.ExecuteNonQuery();

        con.Close();
    }

    protected void count_products()
    {
        int[] product_ids = new int[30];
        int i = 0;
        string query = "SELECT product_id FROM products";
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
                product_ids[i] = Convert.ToInt16(dr["product_id"].ToString());
                i++;
            }
        }// end while loop
        con.Close();
        check_min_level(product_ids, i);
        check_expiry(product_ids, i);
    }

    protected void check_min_level(int[] ids, int count)
    {
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        string query = "", prod_name = "";
        int total = 0;
        bool status = false;

        for (int i = 0; i <= count; i++)
        {
            query = "SELECT (select product_name from products where product_id = inventory_products.product_id) as product_name, inventory_products.quantity, products.minimum_level FROM products INNER JOIN inventory_products ON products.product_id = inventory_products.product_id WHERE products.product_id = '" + ids[i] + "'";
            cmd.Connection = con;
            cmd.CommandText = query;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    total = total + Convert.ToInt16(dr["quantity"].ToString());
                }

                if (total <= Convert.ToInt16(dr["minimum_level"].ToString()))
                {
                    status = true;
                    prod_name = dr["product_name"].ToString();
                }
                else
                {
                    status = false;
                    prod_name = "";
                }
            }// end while loop
            con.Close();
            if (status == true)
            {
                check_notification("Product Minimum Inventory Level Reached! Product name: " + prod_name, "min inv" );
            }
            total = 0;
            status = false;
        }// end for loop
    }

    protected void check_expiry(int[] ids, int count)
    {
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        string query = "";
        bool status = false;

        for (int i = 0; i <= count; i++)
        {
            query = "SELECT products.product_id, products.product_name, inventory_products.batch_id, inventory_products.quantity, inventory_products.expiry_date FROM products INNER JOIN inventory_products ON products.product_id = inventory_products.product_id WHERE products.product_id = '" + ids[i] + "'";
            cmd.Connection = con;
            cmd.CommandText = query;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            string prod_name = "", batch_no = "", msg = "";

            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    DateTime date = Convert.ToDateTime(dr["expiry_date"]);
                    DateTime now = DateTime.Now;
                    var datespan = DateTimeSpan.CompareDates(date, now);
                    if( date > now )
                    {
                        if( datespan.Months <= 1 )
                        {
                            prod_name = dr["product_name"].ToString();
                            batch_no = dr["batch_id"].ToString();
                            msg = "Product Name: "+prod_name+" Batch Number: "+batch_no+" Expiry date reaching! Months left: "+ (datespan.Months + 1);
                            status = true;
                        }// if months left are less than 2
                    }
                }
                
            }// end while loop
            con.Close();
            if (status == true)
            {   
                check_notification(msg, "exp date");
            }
            status = false;
            msg = "";
        }// end for loop

    }
}
public struct DateTimeSpan
{
    private readonly int years;
    private readonly int months;
    private readonly int days;
    private readonly int hours;
    private readonly int minutes;
    private readonly int seconds;
    private readonly int milliseconds;

    public DateTimeSpan(int years, int months, int days, int hours, int minutes, int seconds, int milliseconds)
    {
        this.years = years;
        this.months = months;
        this.days = days;
        this.hours = hours;
        this.minutes = minutes;
        this.seconds = seconds;
        this.milliseconds = milliseconds;
    }

    public int Years { get { return years; } }
    public int Months { get { return months; } }
    public int Days { get { return days; } }
    public int Hours { get { return hours; } }
    public int Minutes { get { return minutes; } }
    public int Seconds { get { return seconds; } }
    public int Milliseconds { get { return milliseconds; } }

    enum Phase { Years, Months, Days, Done }

    public static DateTimeSpan CompareDates(DateTime date1, DateTime date2)
    {
        if (date2 < date1)
        {
            var sub = date1;
            date1 = date2;
            date2 = sub;
        }

        DateTime current = date1;
        int years = 0;
        int months = 0;
        int days = 0;

        Phase phase = Phase.Years;
        DateTimeSpan span = new DateTimeSpan();

        while (phase != Phase.Done)
        {
            switch (phase)
            {
                case Phase.Years:
                    if (current.AddYears(years + 1) > date2)
                    {
                        phase = Phase.Months;
                        current = current.AddYears(years);
                    }
                    else
                    {
                        years++;
                    }
                    break;
                case Phase.Months:
                    if (current.AddMonths(months + 1) > date2)
                    {
                        phase = Phase.Days;
                        current = current.AddMonths(months);
                    }
                    else
                    {
                        months++;
                    }
                    break;
                case Phase.Days:
                    if (current.AddDays(days + 1) > date2)
                    {
                        current = current.AddDays(days);
                        var timespan = date2 - current;
                        span = new DateTimeSpan(years, months, days, timespan.Hours, timespan.Minutes, timespan.Seconds, timespan.Milliseconds);
                        phase = Phase.Done;
                    }
                    else
                    {
                        days++;
                    }
                    break;
            }
        }

        return span;
    }
}