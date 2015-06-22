using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    List<DropDownList> ddlArray = new List<DropDownList>();
    List<TextBox> tbArray = new List<TextBox>();
    
    int count_tb = 0;

    string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;

    protected Boolean check_customer_email()
    {
        SqlConnection con = new SqlConnection(constring);

        String query = "SELECT customer_email_id FROM customer_info where customer_email_id = '"+ email.Text +"'";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Connection = con;
        SqlDataReader dr;
        
        con.Open();
        
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            con.Close();
            return true;
        }
        else
        {
            con.Close();
            return false;
        }
        
        
    }

    protected String return_customer_id(string x)
    {
        SqlConnection con = new SqlConnection(constring);

        String query = "SELECT customer_id FROM customer_info where customer_email_id = '" + x + "'";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Connection = con;
        SqlDataReader dr;

        con.Open();

        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            String id = dr["customer_id"].ToString();
            con.Close();
            return id;
        }

        else
        {
            con.Close();
            return null;
        }
    }

    protected String return_order_id()
    {
        SqlConnection con = new SqlConnection(constring);

        String query = "SELECT TOP 1 order_id FROM orders ORDER BY order_id DESC";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Connection = con;
        SqlDataReader dr;

        con.Open();

        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            String id = dr["order_id"].ToString();
            con.Close();
            return id;
        }

        else
        {
            con.Close();
            return null;
        }
    }

    protected void email_TextChanged(object sender, EventArgs e)
    {
        string query = "SELECT i.customer_id, i.customer_name, i.customer_phone_number, i.customer_email_id, a.permanent_address, a.city, a.country FROM customer_info AS i INNER JOIN customer_address AS a ON i.customer_id = a.customer_id where i.customer_email_id = '" + email.Text + "'";

        string constring = ConfigurationManager.ConnectionStrings["Dairy_SolutionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constring);

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Connection = con;
        SqlDataReader dr;

        con.Open();

        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            cust_id.InnerText = dr["customer_id"].ToString();
            f_name.Text = dr["customer_name"].ToString();
            contact_num.Text = dr["customer_phone_number"].ToString();
            cnic.Text = "123456789";
            street_add.Text = dr["permanent_address"].ToString();
            city_add.Text = dr["city"].ToString();
            prov_add.Text = dr["country"].ToString();
            postal_add.Text = "1234";
        }

        else
        {
            f_name.Text = "";
            contact_num.Text = "";
            cnic.Text = "";
            street_add.Text = "";
            city_add.Text = "";
            prov_add.Text = "";
            postal_add.Text = "";
        }

        con.Close();
    }

    protected void add_order_Click(object sender, EventArgs e)
    {
        foreach (DropDownList ddl in prod.Controls.OfType<DropDownList>())
        {
            ddlArray.Add(ddl);
        }

        foreach (TextBox tb in prod.Controls.OfType<TextBox>())
        {
            tbArray.Add(tb);
            count_tb++;
        }

        try
        {
            if (check_customer_email())
            {
                SqlConnection con = new SqlConnection(constring);
                String cust_info_update_query = "UPDATE customer_info SET customer_name = @f_name, customer_phone_number = @contact_num WHERE customer_email_id = @email;" +
                                                "UPDATE customer_address SET permanent_address = @street_add, city = @city_add, country = @prov_add WHERE customer_id = @id";

                SqlCommand cmd = new SqlCommand(cust_info_update_query, con);

                cmd.Parameters.AddWithValue("@id", cust_id.InnerText);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@f_name", f_name.Text);
                cmd.Parameters.AddWithValue("@contact_num", contact_num.Text);
                cmd.Parameters.AddWithValue("@cnic", cnic.Text);

                cmd.Parameters.AddWithValue("@street_add", street_add.Text);
                cmd.Parameters.AddWithValue("@city_add", city_add.Text);
                cmd.Parameters.AddWithValue("@prov_add", prov_add.Text);
                cmd.Parameters.AddWithValue("@postal_add", postal_add.Text);

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            else
            {
                SqlConnection con = new SqlConnection(constring);
                String cust_info_insert_query = "INSERT INTO customer_info(customer_email_id, customer_name, customer_phone_number) VALUES(@email, @f_name, @contact_num)";
                SqlCommand cmd = new SqlCommand(cust_info_insert_query, con);

                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@f_name", f_name.Text);
                cmd.Parameters.AddWithValue("@contact_num", contact_num.Text);
                cmd.Parameters.AddWithValue("@cnic", cnic.Text);

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                cust_id.InnerText = return_customer_id(email.Text);

                SqlConnection con0 = new SqlConnection(constring);
                string cust_addr_insert_query = "INSERT INTO customer_address(customer_id, permanent_address, city, country) VALUES(@id, @street_add, @city_add, @prov_add)";
                SqlCommand cmd0 = new SqlCommand(cust_addr_insert_query, con0);

                cmd0.Parameters.AddWithValue("@id", cust_id.InnerText);
                cmd0.Parameters.AddWithValue("@street_add", street_add.Text);
                cmd0.Parameters.AddWithValue("@city_add", city_add.Text);
                cmd0.Parameters.AddWithValue("@prov_add", prov_add.Text);
                cmd0.Parameters.AddWithValue("@postal_add", postal_add.Text);

                cmd0.Connection = con0;
                con0.Open();
                cmd0.ExecuteNonQuery();
                con0.Close();
            }

            SqlConnection con1 = new SqlConnection(constring);
            String order_insert_query = " INSERT INTO orders(employee_id, order_date, customer_id) VALUES(@employee_id, @date, @customer_id)";

            SqlCommand cmd1 = new SqlCommand(order_insert_query, con1);

            cmd1.Parameters.AddWithValue("@employee_id", Session["userId"].ToString());
            cmd1.Parameters.AddWithValue("@date", DateTime.Now.ToString());
            cmd1.Parameters.AddWithValue("@customer_id", cust_id.InnerText);

            cmd1.Connection = con1;
            con1.Open();
            cmd1.ExecuteNonQuery();
            con1.Close();

            if (NumberOfControls != 0) 
            {
                insert_product();
            }

            alert_success.Visible = true;
        }
        catch (Exception ex)
        {
            alert_fail.Visible = true;
            error.Text = "Error! " + ex.ToString();
        }
    }

    //Dynamically create text boxes for products
    protected int NumberOfControls
    {
        get { return (int)ViewState["NumControls"]; }
        set { ViewState["NumControls"] = value; }
    }

    private void Page_Load(object sender, System.EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //Initiate the counter of dynamically added controls
            this.NumberOfControls = 0;

            add_product(NumberOfControls);
            this.NumberOfControls++;
        }
        else
            //Controls must be repeatedly be created on postback
            this.createControls();
    }


    protected void create_dropDown(int i)
    {
        DropDownList MyTextBox = new DropDownList();
        //Assigning the textbox ID name 
        MyTextBox.ID = "prod_name" + i.ToString();
        MyTextBox.CssClass = "form-control control-height";
        MyTextBox.DataSourceID = "prod_list";
        MyTextBox.DataTextField = "product_name";
        MyTextBox.DataValueField = "product_id";
        prod.Controls.Add(MyTextBox);
    }

    protected void create_textBox(string s)
    {
        TextBox MyTextBox = new TextBox();
        //Assigning the textbox ID name 
        MyTextBox.ID = s;
        MyTextBox.CssClass = "form-control control-height";
        prod.Controls.Add(MyTextBox);
    }

    protected void add_product(int i)
    {
        prod.Controls.Add(new LiteralControl("<label class = 'col-md-2 control-label'>Product Name</label><div class = 'col-md-4'>"));
        create_dropDown(i);
        prod.Controls.Add(new LiteralControl("</div>"));

        prod.Controls.Add(new LiteralControl("<label class = 'col-md-2 control-label'>Quantity</label><div class = 'col-md-4'>"));
        create_textBox("prod_quantity" + i.ToString());
        prod.Controls.Add(new LiteralControl("<br/></div>"));

        prod.Controls.Add(new LiteralControl("<label class = 'col-md-2 control-label'>Description</label><div class = 'col-md-4'>"));
        create_textBox("prod_spec" + i.ToString());
        prod.Controls.Add(new LiteralControl("</div>"));

        prod.Controls.Add(new LiteralControl("<label class = 'col-md-2 control-label'>Specification</label><div class = 'col-md-4'>"));
        create_textBox("prod_desc" + i.ToString());
        prod.Controls.Add(new LiteralControl("<br/></div>"));
    }

    // This routine creates the controls and assigns a generic ID
    private void createControls()
    {
        int count = this.NumberOfControls;

        for (int i = 0; i < count; i++)
        {
            add_product(i);
            prod.Controls.Add(new LiteralControl("<div class='col-md-12' style='padding-top: 10px; padding-bottom: 20px'><p style='width: 100%; height: 1px; background-color: grey;'></p></div>"));
        }
    }

    protected void add_textbox_Click(object sender, EventArgs e)
    {
        add_product(NumberOfControls);

        this.NumberOfControls++;
    }

    protected void insert_product()
    {
        String order_id = return_order_id();
        int tb_count = 0; 

        SqlConnection con2 = new SqlConnection(constring);
        for (int x = 0; x < NumberOfControls; x++)
        {
            string order_prod_insert_query = "INSERT INTO services_or_products (product_id, quantity, services, order_id) VALUES(@ProdDropDownList, @quantity, @services, @order_id)";
            SqlCommand cmd2 = new SqlCommand(order_prod_insert_query, con2);

            cmd2.Parameters.AddWithValue("@ProdDropDownList", int.Parse(ddlArray[x].SelectedValue));
            cmd2.Parameters.AddWithValue("@quantity", int.Parse(tbArray[tb_count].Text));
            cmd2.Parameters.AddWithValue("@services", tbArray[tb_count + 1].Text);
            cmd2.Parameters.AddWithValue("@order_id", int.Parse(order_id));

            cmd2.Connection = con2;
            con2.Open();
            cmd2.ExecuteNonQuery();
            con2.Close();

            tb_count += 3;
        }
        alert_success.Visible = true;
    }

    //On click reset form
    protected void formReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("order_cust_add.aspx");
    }
}