using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (IsPostBack == true)
        {
            Label lb1 = ((Label)Repeater1.Items[0].FindControl("Label1"));
           
            Label2.Text = lb1.Text;
        }
        char[] arr = new char[30];
        string query = "SELECT description FROM products";
        string constring = @"Data Source=ACER;Initial Catalog=Dairy_Solution;Integrated Security=True";
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = query;

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            //for insert remove data reader and replace cmd.executenonquery()
            if (dr.HasRows)
            {
                //string str = dr["description"].ToString();
                //arr = str.ToCharArray(1, 26);
                //arr[27] = '.';
                //arr[28] = '.';
                //arr[29] = '.';
                //string new_str = new string(arr);
                Label lb1 = ((Label) Repeater1.Items[0].FindControl("Label1"));
                string str = "hello";
                lb1.Text = str;
                
            }// end if
            else
                Response.Redirect("products.aspx");
        }
        con.Close();*/
        
    }

}