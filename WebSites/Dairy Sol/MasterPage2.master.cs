using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.VisualBasic;
using System.Globalization;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            user_name.Text = "Login";
            Response.Redirect("site_signIn.aspx");
        }
        else
        {
            user_name.Text = Session["username"].ToString();
        }
        //count_products();
        //select_notifications();
    }// end function page_load

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

    protected void check_min_level( int[] ids, int count ) 
    {
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        string query = "";
        int total = 0;
        bool status = false;

        for (int i = 0; i <= count; i++ )
        {
            query = "SELECT inventory_products.quantity, products.minimum_level FROM products INNER JOIN inventory_products ON products.product_id = inventory_products.product_id WHERE products.product_id = '" + ids[i] + "'";
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
                }
                else 
                {
                    status = false;
                }
            }// end while loop
            con.Close();
            total = 0;
        }// end for loop
        if (status == true)
        {
            insert_notification();
        }
        else 
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('All Products above Minimum Level!')", true);
        }
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
        check_min_level( product_ids, i );
        check_expiry( product_ids, i );
      }

    protected void check_expiry( int[] ids, int count ) 
    {
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        string query = "";
        bool status = false;

        for (int i = 0; i <= count; i++)
        {
            query = "SELECT products.product_id, inventory_products.quantity, inventory_products.expiry_date FROM products INNER JOIN inventory_products ON products.product_id = inventory_products.product_id WHERE products.product_id = '" + ids[i] + "'";
            cmd.Connection = con;
            cmd.CommandText = query;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    DateTime d = Convert.ToDateTime(dr["expiry_date"]);
                    DateTime now = DateTime.Now;

                    var datespan = DateTimeSpan.CompareDates(d,now);
                    
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert("+datespan.Months+")", true);
                }

            }// end while loop
            con.Close();
        }// end for loop
        
    }

    protected void insert_notification() 
    {
        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        String query = "insert into notifications (description, date_time, status) values (@description, @date_time, @status)";
        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@description", "Product Minimum Inventory Level Reached!");
        cmd.Parameters.AddWithValue("@date_time", DateTime.Now);
        cmd.Parameters.AddWithValue("@status", "0");

        cmd.Connection = con;

        con.Open();
        cmd.ExecuteNonQuery();

        con.Close();
    }

    protected void select_notifications()
    {
        string query = "SELECT description, date_time FROM notifications";
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
               notify.InnerText = dr["description"].ToString();
            }
        }// end while loop
        con.Close();
    }
}