<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="online_order.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
    <br/>
    <br/>
    <form runat="server">
    <div class="col-md-8 col-md-offset-1">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="product_name" DataSourceID="SqlDataSource1" Width="877px">
        <Columns>
            <asp:ImageField DataImageUrlField="product_picture" ControlStyle-Width="150"  ControlStyle-Height="150" ReadOnly="True">
<ControlStyle Height="150px" Width="150px"></ControlStyle>
            </asp:ImageField>
            <asp:BoundField DataField="product_picture" HeaderText="product_picture" SortExpression="product_picture" Visible="False"/>
            <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name" ReadOnly="True" />
            <asp:BoundField DataField="product_price" HeaderText="product_price" SortExpression="product_price" ReadOnly="True" />
            
            <asp:CommandField ShowEditButton="True" HeaderText="Edit Quantity" />
            
            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
            
            <asp:CommandField ShowDeleteButton="True" DeleteText="Remove" />
            
        </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand = "SELECT [product_picture], [product_name], [product_price], [quantity] FROM [order_page_info] WHERE ([session_id] = @session_id)" InsertCommand="INSERT INTO [order_page_info] ([product_picture], [product_name], [product_price], [quantity]) VALUES (@product_picture, @product_name, @product_price, @quantity)" DeleteCommand="DELETE FROM order_page_info WHERE [product_name]=@product_name" UpdateCommand="UPDATE order_page_info SET quantity=@quantity WHERE product_name=@product_name">
        <DeleteParameters>
            <asp:Parameter Name="product_name" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="product_picture" Type="String" />
            <asp:Parameter Name="product_name" Type="String" />
            <asp:Parameter Name="product_price" Type="Int32" />
            <asp:Parameter Name="quantity" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="session_id" SessionField="cust_userId" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="quantity" />
            <asp:Parameter Name="product_name" />
        </UpdateParameters>
        </asp:SqlDataSource>
    <br/>
            <div class="row">
                <div class="col-md-3">
                    <asp:Button ID="continue_shop" runat="server" cssClass="btn btn-primary" formAction="site_products.aspx" Text="Buy More Products" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="check_out" runat="server" cssClass="btn btn-primary" Text="Check Out" onClick="check_out_btn_click"/>
                </div>
                <div class="col-md-7">
                    <asp:Button ID="clear_cart" runat="server" cssClass="btn btn-primary" style="float:right" Text="Clear Cart" onClick="clear_cart_Click"/>
                </div>
            </div>
        </form>
    <br/>
    <br/>
    </div>
</asp:Content>