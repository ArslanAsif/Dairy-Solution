<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="order_supp.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-4">
                        <h1 class="page-header">
                            Orders <small>Supplier</small>
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
                        <div>
                            <asp:GridView ID="order_customer_GridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover table-striped">
                                <Columns>
                                    <asp:BoundField DataField="order_id" HeaderText="Order ID" SortExpression="order_id" />
                                    <asp:BoundField DataField="product_id" HeaderText="Product ID" SortExpression="product_id" />
                                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                                    <asp:BoundField DataField="order_date" HeaderText="Order Date" SortExpression="order_date" />
                                    <asp:BoundField DataField="supplier_id" HeaderText="Supplier ID" SortExpression="supplier_id" />
                                    <asp:CommandField HeaderText="Update" ShowEditButton="True" />
                                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                                    <asp:TemplateField HeaderText="Supplier Name">
                                        <ItemTemplate>
                                            
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="supplier_name" DataValueField="supplier_id">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT [supplier_name], [supplier_id] FROM [supplier_info]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT ordered_products.order_id, (select product_name from products where products.product_id = ordered_products.product_id) as product_id, supplier_order.quantity, (select supplier_name from supplier_info where supplier_id = supplier_order.supplier_id) as supplier_id, supplier_order.order_date FROM ordered_products INNER JOIN supplier_order ON ordered_products.order_id = supplier_order.order_id" UpdateCommand="UPDATE supplier_order SET supplier_name = @supplier_name, order_date = @order_date, quantity = @quantity FROM supplier_order INNER JOIN ordered_products ON supplier_order.order_id = ordered_products.order_id WHERE (supplier_order.order_id = @order_id) AND (ordered_products.product_id = @product_id)">
                                <UpdateParameters>
                                    <asp:Parameter Name="supplier_name" />
                                    <asp:Parameter Name="order_date" />
                                    <asp:Parameter Name="quantity" />
                                    <asp:Parameter Name="order_id" />
                                    <asp:Parameter Name="product_id" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            
                        </div>
                    </div>
				</div>
                <!-- /.row -->
				
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

</asp:Content>

