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

    }
    protected void cust_signUp_Click(object sender, EventArgs e)
    {
        string constring = @"Data Source=ACER;Initial Catalog=Dairy_Solution;Integrated Security=True";
        SqlConnection con = new SqlConnection(constring);

        String query = "insert into customer_info (customer_id, customer_name,customer_phone_number, customer_email_id, customer_password,secret_question,customer_picture,secret_answer) values (@customer_id, @customer_name, @customer_phone_number, @customer_email_id, @customer_password,@secret_question,@customer_picture,@secret_answer);";
        SqlCommand cmd = new SqlCommand(query,con);
        
        cmd.Parameters.AddWithValue("@customer_name", cust_su_inputFirstName.Text);
        cmd.Parameters.AddWithValue("@customer_phone_number", cust_phone_number.Text);
        cmd.Parameters.AddWithValue("@customer_email_id", cust_su_inputEmail.Text);
        cmd.Parameters.AddWithValue("@customer_password", cust_su_inputPass.Text);
        cmd.Parameters.AddWithValue("@secret_question", DropDownList1.Text);
        cmd.Parameters.AddWithValue("@customer_picture", cust_image.PostedFile.FileName.ToString());
        cmd.Parameters.AddWithValue("@secret_answer", inputAnswer.Text);
        
        cmd.Connection = con;
       
        con.Open();
        //SqlDataReader dr = cmd.ExecuteReader();
        cmd.ExecuteNonQuery();
        //for insert remove data reader and replace cmd.executenonquery()
        
        Response.Redirect("signin.aspx");
        
        con.Close();
    }
    
}