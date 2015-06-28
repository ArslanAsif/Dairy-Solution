<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="order_cust.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">

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
                            <asp:GridView ID="order_customer_GridView" runat="server" AllowSorting="True" AllowPaging="true" AutoGenerateColumns="False" BackColor="White" DataKeyNames="order_id" DataSourceID="SqlDataSource1"  CssClass="table table-bordered table-hover table-striped" OnRowDataBound="order_customer_GridView_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="order_id" HeaderText="order_id" ReadOnly="True" SortExpression="order_id" InsertVisible="False" />
                                    <asp:BoundField DataField="order_date" HeaderText="order_date" SortExpression="order_date" />
                                    <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" ReadOnly="True" />
                                    <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" ReadOnly="True" />
                                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
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
                                    <asp:CommandField ShowDeleteButton="True" />
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

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" DeleteCommand="DELETE FROM [services_or_products] WHERE [order_id] = @order_id
DELETE FROM [payment_info] WHERE [order_id] = @order_id
DELETE FROM [orders] WHERE [order_id] = @order_id" InsertCommand="INSERT INTO [orders] ([order_id], [product_id], [employee_id], [customer_id], [order_date], [description]) VALUES (@order_id, @product_id, @employee_id, @customer_id, @order_date, @description)" SelectCommand="select o.order_id, o.order_date, (select e.employee_name from employee_info e where e.employee_id = o.employee_id) as EmployeeName, 
(select c.customer_name from customer_info c where c.customer_id = o.customer_id) as CustomerName,
o.description from orders o " UpdateCommand="UPDATE orders SET product_id = @product_id, employee_id = @employee_id, customer_id = @customer_id, order_date = @order_date, description = @description WHERE (order_id = @order_id)">
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
                        </div>
                    </div>
				</div>
                <!-- /.row -->
				
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

</asp:Content>

