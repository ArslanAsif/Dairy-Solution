<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="prod_manage.aspx.cs" Inherits="_Default" %>

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

            <asp:GridView ID="product_GridView" runat="server" AutoGenerateColumns="False" AllowPaging="true" DataKeyNames="product_id" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" OnSelectedIndexChanged="product_GridView1_SelectedIndexChanged" CssClass="table table-bordered table-hover table-striped" PageSize="10">
                <Columns>
                    <asp:BoundField DataField="product_id" HeaderText="Product ID" SortExpression="product_id" ReadOnly="True" InsertVisible="False" />
                    <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name">
                    </asp:BoundField>
                    <asp:BoundField DataField="minimum_level" HeaderText="Minimum Level" SortExpression="minimum_level"/>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
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

                <pagersettings mode="Numeric"
                    position="Bottom"           
                    pagebuttoncount="10"/>

                <pagerstyle BackColor="#808080"
                    height="30px"
                    verticalalign="Bottom"
                    horizontalalign="Center"
                    CssClass = "GridPager"/>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" DeleteCommand="DELETE FROM [products] WHERE [product_id] = @original_product_id AND (([product_name] = @original_product_name) OR ([product_name] IS NULL AND @original_product_name IS NULL)) AND (([minimum_level] = @original_minimum_level) OR ([minimum_level] IS NULL AND @original_minimum_level IS NULL))" InsertCommand="INSERT INTO [products] ([product_name], [minimum_level]) VALUES (@product_name, @minimum_level)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [product_name], [product_id], [minimum_level] FROM [products]" UpdateCommand="UPDATE [products] SET [product_name] = @product_name, [minimum_level] = @minimum_level WHERE [product_id] = @original_product_id AND (([product_name] = @original_product_name) OR ([product_name] IS NULL AND @original_product_name IS NULL)) AND (([minimum_level] = @original_minimum_level) OR ([minimum_level] IS NULL AND @original_minimum_level IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_product_id" Type="Int32" />
                    <asp:Parameter Name="original_product_name" Type="String" />
                    <asp:Parameter Name="original_minimum_level" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="product_name" Type="String" />
                    <asp:Parameter Name="minimum_level" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="product_name" Type="String" />
                    <asp:Parameter Name="minimum_level" Type="Int32" />
                    <asp:Parameter Name="original_product_id" Type="Int32" />
                    <asp:Parameter Name="original_product_name" Type="String" />
                    <asp:Parameter Name="original_minimum_level" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

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

