<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="product_view.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-md-4">
                    <h1 class="page-header">
                        Products <small>(Manage)</small>
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

            <asp:GridView ID="product_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="product_id" DataSourceID="ACER" AllowPaging="True" AllowSorting="True" BackColor="White" OnSelectedIndexChanged="product_GridView1_SelectedIndexChanged" CssClass="table table-bordered table-hover table-striped">
                <Columns>
                    <asp:BoundField DataField="product_id" HeaderText="product_id" SortExpression="product_id" ReadOnly="True" />
                    <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name">
                    </asp:BoundField>
                    <asp:BoundField DataField="minimum_level" HeaderText="minimum_level" SortExpression="minimum_level"/>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                    <asp:CommandField EditText="Update" HeaderText="Edit" ShowEditButton="True" />
                    <asp:HyperLinkField NavigateUrl="~/products.aspx" Text="View" HeaderText="Details" />
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

            <asp:SqlDataSource ID="ACER" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT * FROM products" UpdateCommand="UPDATE products SET product_name = @product_name, minimum_level = @minimum_level 
WHERE (product_id = @product_id)">
                <UpdateParameters>
                    <asp:Parameter Name="product_name" />
                    <asp:Parameter Name="minimum_level" />
                    <asp:Parameter Name="product_id" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <!-- /.row -->
				
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.page-wrapper -->

</asp:Content>

