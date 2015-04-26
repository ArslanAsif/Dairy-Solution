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
                            <asp:GridView ID="order_customer_GridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" DataKeyNames="order_id" DataSourceID="SqlDataSource1"  CssClass="table table-bordered table-hover table-striped">
                                <Columns>
                                    <asp:BoundField DataField="order_id" HeaderText="Order Id" ReadOnly="True" SortExpression="order_id" InsertVisible="False" />
                                    <asp:BoundField DataField="product_id" HeaderText="Product Id" SortExpression="product_id" />
                                    <asp:BoundField DataField="employee_id" HeaderText="Employee Id" SortExpression="employee_id" />
                                    <asp:BoundField DataField="customer_id" HeaderText="Customer Id" SortExpression="customer_id" />
                                    <asp:BoundField DataField="order_date" HeaderText="Order Date" SortExpression="order_date" />
                                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                                    <asp:CommandField HeaderText="Edit row" ShowEditButton="True" />
                                    <asp:CommandField ShowDeleteButton="True" HeaderText="Delete row" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" DeleteCommand="DELETE FROM [orders] WHERE [order_id] = @order_id" InsertCommand="INSERT INTO [orders] ([order_id], [product_id], [employee_id], [customer_id], [order_date], [description]) VALUES (@order_id, @product_id, @employee_id, @customer_id, @order_date, @description)" SelectCommand="SELECT [order_id], [product_id], [employee_id], [customer_id], [order_date], [description] FROM [orders]" UpdateCommand="UPDATE orders SET product_id = @product_id, employee_id = @employee_id, customer_id = @customer_id, order_date = @order_date, description = @description WHERE (order_id = @order_id)">
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

