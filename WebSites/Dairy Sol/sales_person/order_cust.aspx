<%@ Page Title="" Language="C#" MasterPageFile="~/sales_person/MasterSales.master" AutoEventWireup="true" CodeFile="order_cust.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper" style="height:93vh">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-4">
                        <h1 class="page-header">
                            Orders <small>Customer</small>
                        </h1>
                    </div>
                    
                    <!--search table-->
                    <div class="col-md-4 col-md-offset-4">
				        <div class="input-group" style="margin-top: 55px">
					
					        <asp:TextBox runat="server" type="text" class="form-control control-height" placeholder="Search Product" ID="search"/>
					        <div class="input-group-btn">
                                <asp:Button runat="server" id="srch_btn" class="btn btn-default" type="submit" Text="Search" OnClick="srch_btn_Click"/>
						        <!--<button id="srch_btn" class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>-->
					        </div>
				        </div>
                    </div>
                </div>
                
				
				
				<div class="row">
					<div class="col-md-12">
                        
	                    <div>
                            <asp:GridView ID="order_customer_GridView" runat="server" AllowSorting="True" AllowPaging="true" AutoGenerateColumns="False" BackColor="White" DataKeyNames="order_id" DataSourceID="SqlDataSource1"  CssClass="table table-bordered table-hover table-striped" OnRowDataBound="order_customer_GridView_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="order_id" HeaderText="Order ID" ReadOnly="True" SortExpression="order_id" InsertVisible="False" />
                                    <asp:BoundField DataField="order_date" HeaderText="Order Date" SortExpression="order_date" />
                                    <asp:BoundField DataField="employee_name" HeaderText="Employee Name" SortExpression="employee_name" ReadOnly="True" />
                                    <asp:BoundField DataField="customer_name" HeaderText="Customer Name" SortExpression="customer_name" ReadOnly="True" />
                                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                                    <asp:TemplateField HeaderText="Products">
                                        <ItemTemplate>
                                            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" ShowHeader="False">
                                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                                <RowStyle BackColor="White" ForeColor="#330099" />
                                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                                <SortedDescendingHeaderStyle BackColor="#7E0000" />
                                            </asp:GridView>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" ReadOnly="True" />
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

                                <pagersettings mode="Numeric"
                                  position="Bottom"           
                                  pagebuttoncount="10"/>

                                <pagerstyle BackColor="#808080"
                                    height="30px"
                                    verticalalign="Bottom"
                                    horizontalalign="Center"
                                    CssClass = "GridPager"/>

                            </asp:GridView>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" 
                                DeleteCommand="DELETE FROM [services_or_products] WHERE [order_id] = @order_id DELETE FROM [payment_info] WHERE [order_id] = @order_id DELETE FROM [orders] WHERE [order_id] = @order_id" 
                                InsertCommand="INSERT INTO [orders] ([order_id], [product_id], [employee_id], [customer_id], [order_date], [description]) VALUES (@order_id, @product_id, @employee_id, @customer_id, @order_date, @description)" 
                                selectCommand ="select o.order_id, o.order_date, e.employee_name, c.customer_name, o.description, (SELECT sum(i.price) FROM inventory_products AS i INNER JOIN services_or_products AS s ON i.product_id = s.product_id WHERE s.order_id = o.order_id) AS price from orders o INNER JOIN employee_info e ON e.employee_id = o.employee_id INNER JOIN customer_info c ON c.customer_id = o.customer_id"
                                UpdateCommand="UPDATE orders SET product_id = @product_id, employee_id = @employee_id, customer_id = @customer_id, order_date = @order_date, description = @description WHERE (order_id = @order_id)">
                                
                                <DeleteParameters>
                                    <asp:Parameter Name="order_id" Type="Int64" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="order_id" Type="Int64" />
                                    <asp:Parameter Name="product_id" Type="Int32" />
                                    <asp:Parameter Name="employee_id" Type="Int32" />
                                    <asp:Parameter Name="customer_id" Type="Int64" />
                                    <asp:Parameter Name="order_date" />
                                    <asp:Parameter Name="description" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="product_id" Type="Int32" />
                                    <asp:Parameter Name="employee_id" Type="Int32" />
                                    <asp:Parameter Name="customer_id" Type="Int64" />
                                    <asp:Parameter Name="order_date" />
                                    <asp:Parameter Name="description" Type="String" />
                                    <asp:Parameter Name="order_id" Type="Int64" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" 
                                DeleteCommand="DELETE FROM [services_or_products] WHERE [order_id] = @order_id DELETE FROM [payment_info] WHERE [order_id] = @order_id DELETE FROM [orders] WHERE [order_id] = @order_id" 
                                InsertCommand="INSERT INTO [orders] ([order_id], [product_id], [employee_id], [customer_id], [order_date], [description]) VALUES (@order_id, @product_id, @employee_id, @customer_id, @order_date, @description)" 
                                selectCommand ="select o.order_id, o.order_date, e.employee_name, c.customer_name, o.description from orders o INNER JOIN employee_info e ON e.employee_id = o.employee_id INNER JOIN customer_info c ON c.customer_id = o.customer_id WHERE (employee_name LIKE '%' + @name + '%') OR (customer_name LIKE '%' + @name + '%')"
                                UpdateCommand="UPDATE orders SET product_id = @product_id, employee_id = @employee_id, customer_id = @customer_id, order_date = @order_date, description = @description WHERE (order_id = @order_id)">
                                
                                <DeleteParameters>
                                    <asp:Parameter Name="order_id" Type="Int64" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="order_id" Type="Int64" />
                                    <asp:Parameter Name="product_id" Type="Int32" />
                                    <asp:Parameter Name="employee_id" Type="Int32" />
                                    <asp:Parameter Name="customer_id" Type="Int64" />
                                    <asp:Parameter Name="order_date" />
                                    <asp:Parameter Name="description" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="product_id" Type="Int32" />
                                    <asp:Parameter Name="employee_id" Type="Int32" />
                                    <asp:Parameter Name="customer_id" Type="Int64" />
                                    <asp:Parameter Name="order_date" />
                                    <asp:Parameter Name="description" Type="String" />
                                    <asp:Parameter Name="order_id" Type="Int64" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="search" PropertyName="Text" Name="name" Type="String"></asp:ControlParameter>
                                </SelectParameters>
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

