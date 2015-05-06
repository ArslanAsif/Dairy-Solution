<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="online_order.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
    <br/>
    <br/>
    <div class="col-md-8 col-md-offset-1">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="877px">
        <Columns>
            <asp:ImageField DataImageUrlField="product_picture" HeaderText="Product Picture" ReadOnly="True" ControlStyle-Width="150" ControlStyle-Height = "150">
            <ControlStyle Height="150px" Width="150px"></ControlStyle>
                <ItemStyle Wrap="True" />
            </asp:ImageField>
            <asp:BoundField DataField="product_picture" HeaderText="product_picture" SortExpression="product_picture" Visible="False"/>
            <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name" ReadOnly="True" />
            <asp:BoundField DataField="product_price" HeaderText="Product Price" SortExpression="product_price" ReadOnly="True" />
            
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text="1"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sub Total">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text=""><%# Eval("product_price")%></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" HeaderText="Remove Item" />
            
        </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand = "SELECT product_picture, product_name, product_price, quantity FROM order_page_info"></asp:SqlDataSource>
    <br/>
            <div class="row">
                <div class="col-md-3">
                    <asp:Button ID="continue_shop" runat="server" cssClass="btn btn-primary" formAction="site_products.aspx" Text="Continue Shopping" />
                </div>
                <div class="col-md-6 col-md-offset-3">
                    <asp:Button ID="clear_cart" runat="server" cssClass="btn btn-primary" Text="Clear Shopping Cart" OnClick="clear_cart_Click" />
                    <asp:Button ID="update_cart" runat="server" cssClass="btn btn-primary" Text="Update Shopping Cart" OnClick="update_cart_Click" />
                </div>
            </div>
    <br/>
    <br/>
    </div>
</asp:Content>