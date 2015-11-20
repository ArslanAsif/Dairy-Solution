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

    protected void email_TextChanged(object sender, EventArgs e)
    {
        string query = "SELECT supplier_id, supplier_name, supplier_phone, supplier_phone2, supplier_email, supplier_address, supplier_postal_addr FROM supplier_info WHERE supplier_email = '" + email.Text + "'";

        SqlConnection con = new SqlConnection(constring);

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Connection = con;
        SqlDataReader dr;

        con.Open();

        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            supplier_id.InnerText = dr["supplier_id"].ToString();
            name.Text = dr["supplier_name"].ToString();
            contact_num.Text = dr["supplier_phone"].ToString();
            contact_num2.Text = dr["supplier_phone2"].ToString();
            address.Text = dr["supplier_address"].ToString();
        }

        else
        {
            name.Text = "";
            contact_num.Text = "";
            contact_num2.Text = "";
            address.Text = "";
        }

        con.Close();
    }

    protected Boolean check_supplier_email()
    {
        SqlConnection con = new SqlConnection(constring);

        String query = "SELECT supplier_email FROM supplier_info where supplier_email = '" + email.Text + "'";

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

    protected String return_supplier_id(string x)
    {
        SqlConnection con = new SqlConnection(constring);

        String query = "SELECT supplier_id FROM supplier_info where supplier_email = '" + x + "'";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Connection = con;
        SqlDataReader dr;

        con.Open();

        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            String id = dr["supplier_id"].ToString();
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

        String query = "SELECT TOP 1 order_id FROM supplier_order ORDER BY order_id DESC;";

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

            if (check_supplier_email())
            {
                SqlConnection con = new SqlConnection(constring);
                String cust_info_update_query = "UPDATE supplier_info SET supplier_name = @name, supplier_phone = @contact_num, supplier_phone2 = @contact_num2, supplier_address = @address WHERE supplier_email = @email";
                SqlCommand cmd = new SqlCommand(cust_info_update_query, con);

                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@name", name.Text);
                cmd.Parameters.AddWithValue("@contact_num", contact_num.Text);
                cmd.Parameters.AddWithValue("@contact_num2", contact_num2.Text);
                cmd.Parameters.AddWithValue("@address", address.Text);

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            else
            {
                SqlConnection con = new SqlConnection(constring);
                String cust_info_insert_query = "INSERT INTO supplier_info(supplier_email, supplier_name, supplier_phone, supplier_phone2, supplier_address) VALUES(@email, @name, @contact_num, @contact_num2, @address)";
                SqlCommand cmd = new SqlCommand(cust_info_insert_query, con);

                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@name", name.Text);
                cmd.Parameters.AddWithValue("@contact_num", contact_num.Text);
                cmd.Parameters.AddWithValue("@contact_num2", contact_num2.Text);
                cmd.Parameters.AddWithValue("@address", address.Text);

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                supplier_id.InnerText = return_supplier_id(email.Text);
            }

            SqlConnection con1 = new SqlConnection(constring);
            String order_insert_query = " INSERT INTO supplier_order(supplier_id, order_date) VALUES(@supplier_id, @date)";

            SqlCommand cmd1 = new SqlCommand(order_insert_query, con1);

            cmd1.Parameters.AddWithValue("@supplier_id", supplier_id.InnerText);
            cmd1.Parameters.AddWithValue("@date", DateTime.Now.ToString());

            cmd1.Connection = con1;
            con1.Open();
            cmd1.ExecuteNonQuery();
            con1.Close();


            if (NumberOfControls != 0)
            {
                insert_product();
            }

            alert_success.Visible = true;

            alert_success.Visible = true;
        }
        catch (Exception ex)
        {
            alert_fail.Visible = true;
            error.Text = "Error! " + ex.ToString();
        }
    }

    //Add product textboxes dynamically
    protected int NumberOfControls
    {
        get { return (int)ViewState["NumControls"]; }
        set { ViewState["NumControls"] = value; }
    }

    private void Page_Load(object sender, System.EventArgs e)
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
                    break;

                default:
                    Response.Redirect("site_signIn.aspx");
                    break;

            }
        }

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
            string order_prod_insert_query = "INSERT INTO ordered_products (product_id, quantity, add_details, order_id) VALUES(@ProdDropDownList, @quantity, @details, @order_id)";
            SqlCommand cmd2 = new SqlCommand(order_prod_insert_query, con2);

            cmd2.Parameters.AddWithValue("@ProdDropDownList", int.Parse(ddlArray[x].SelectedValue));
            cmd2.Parameters.AddWithValue("@quantity", int.Parse(tbArray[tb_count].Text));
            cmd2.Parameters.AddWithValue("@details", tbArray[tb_count + 1].Text);
            cmd2.Parameters.AddWithValue("@order_id", int.Parse(order_id));

            cmd2.Connection = con2;
            con2.Open();
            cmd2.ExecuteNonQuery();
            con2.Close();

            tb_count += 3;
        }
        alert_success.Visible = true;
    }

    protected void formReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("order_order_supp.aspx");
    }
}