<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="post_manage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper" style="height:93vh">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-4">
                        <h1 class="page-header">
                            Manage Posts <small></small>
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
                    <div class="col-lg-12">

                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AllowPaging="true" AutoGenerateColumns="False" BackColor="White" CssClass="table table-bordered table-hover table-striped" GridLines="None"  DataKeyNames="post_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="post_id" HeaderText="Post Id" InsertVisible="False" ReadOnly="True" SortExpression="post_id" />
                                <asp:BoundField DataField="heading" HeaderText="Heading" SortExpression="heading" />
                                <asp:BoundField DataField="detail" HeaderText="Detail" SortExpression="detail" />
                                <asp:ImageField HeaderText="Picture" DataImageUrlField="picture" NullImageUrl="~/images/updates/update2.jpg">
                                    <ControlStyle Height="75px" Width="75px" />
                                </asp:ImageField>
                                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                                <asp:HyperLinkField Text="Update" DataNavigateUrlFields="post_id" DataNavigateUrlFormatString="post_update.aspx?id={0}"/>
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
				        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" DeleteCommand="DELETE FROM [posts] WHERE [post_id] = @original_post_id" InsertCommand="INSERT INTO [posts] ([summary], [heading], [detail], [picture]) VALUES (@summary, @heading, @detail, @picture)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [post_id], [summary], [heading], [detail], [picture] FROM [posts]" UpdateCommand="UPDATE [posts] SET [summary] = @summary, [heading] = @heading, [detail] = @detail, [picture] = @picture WHERE [post_id] = @original_post_id">
                            <DeleteParameters>
                                <asp:Parameter Name="original_post_id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="summary" Type="String" />
                                <asp:Parameter Name="heading" Type="String" />
                                <asp:Parameter Name="detail" Type="String" />
                                <asp:Parameter Name="picture" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="summary" Type="String" />
                                <asp:Parameter Name="heading" Type="String" />
                                <asp:Parameter Name="detail" Type="String" />
                                <asp:Parameter Name="picture" Type="String" />
                                <asp:Parameter Name="original_post_id" Type="Int64" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" DeleteCommand="DELETE FROM [posts] WHERE [post_id] = @original_post_id" InsertCommand="INSERT INTO [posts] ([summary], [heading], [detail], [picture]) VALUES (@summary, @heading, @detail, @picture)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [post_id], [summary], [heading], [detail], [picture] FROM [posts] WHERE ([heading] LIKE '%' + @name + '%')" UpdateCommand="UPDATE [posts] SET [summary] = @summary, [heading] = @heading, [detail] = @detail, [picture] = @picture WHERE [post_id] = @original_post_id">
                            <DeleteParameters>
                                <asp:Parameter Name="original_post_id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="summary" Type="String" />
                                <asp:Parameter Name="heading" Type="String" />
                                <asp:Parameter Name="detail" Type="String" />
                                <asp:Parameter Name="picture" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="summary" Type="String" />
                                <asp:Parameter Name="heading" Type="String" />
                                <asp:Parameter Name="detail" Type="String" />
                                <asp:Parameter Name="picture" Type="String" />
                                <asp:Parameter Name="original_post_id" Type="Int64" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="search" PropertyName="Text" Name="name" Type="String"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
				</div>
                <!-- /.row -->
                
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>