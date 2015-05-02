<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="inv_manage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-4">
                        <h1 class="page-header">
                            Inventory <small></small>
                        </h1>
                    </div>
                    
                    <!--search table-->
                    <div class="col-md-4 col-md-offset-4">
				        <div class="input-group" style="margin-top: 55px">
					
					        <input type="text" class="form-control control-height" placeholder="Search by Product Name or ID" name="srch-term" id="srch-term">
					        <div class="input-group-btn">
						        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
					        </div>
				        </div>
                    </div>
                </div>
				
				<div class="row">
                    <div class="col-md-12">
                        <asp:GridView ID="del_product_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="product_id,batch_id" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" CssClass="table table-bordered table-hover table-striped">
                            <Columns>
                                <asp:BoundField DataField="batch_id" HeaderText="Batch Id" InsertVisible="False" ReadOnly="True" SortExpression="batch_id" />
                                <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name">
                                </asp:BoundField>
                                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity"/>
                                <asp:BoundField DataField="discount" HeaderText="Discount" SortExpression="discount" />
                                <asp:BoundField DataField="entry_date" HeaderText="Entry Date" SortExpression="entry_date" />
                                <asp:BoundField DataField="expiry_date" HeaderText="Expiry Date" SortExpression="expiry_date" />
                                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                                <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                                <asp:CommandField HeaderText="Update" ShowEditButton="True" />
                                <asp:HyperLinkField HeaderText="Details" NavigateUrl="~/site_products.aspx" Text="View" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#808080" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" DeleteCommand="DELETE
    FROM   inventory_products
    WHERE inventory_products.batch_id = @batch_id" SelectCommand="SELECT products.product_id, products.product_name, inventory_products.quantity, inventory_products.discount, inventory_products.entry_date, inventory_products.expiry_date, inventory_products.price, inventory_products.batch_id
    FROM products
    INNER JOIN inventory_products
    ON products.product_id = inventory_products.product_id;" UpdateCommand="UPDATE inventory_products SET price = @price, quantity = @quantity, discount = @discount, entry_date = @entry_date, expiry_date = @expiry_date
WHERE (product_id = @product_id)">
                            <DeleteParameters>
                                <asp:Parameter Name="batch_id" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="price" />
                                <asp:Parameter Name="quantity" />
                                <asp:Parameter Name="discount" />
                                <asp:Parameter Name="entry_date" />
                                <asp:Parameter Name="expiry_date" />
                                <asp:Parameter Name="product_id" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
				</div>
                <!-- /.row -->
				
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>

