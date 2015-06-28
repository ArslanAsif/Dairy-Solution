<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="loan_manage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-4">
                        <h1 class="page-header">
                            Loan <small>Requests</small>
                        </h1>
                    </div>
                    
                    <!--search table-->
                    <div class="col-md-4 col-md-offset-4">
				        <div class="input-group" style="margin-top: 55px">
					
					        <input type="text" class="form-control control-height" placeholder="Search" name="srch-term" id="srch-term">
					        <div class="input-group-btn">
						        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
					        </div>
				        </div>
                    </div>
                </div>
				
				<div class="row">
                    <div class="col-lg-12">

                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" CssClass="table table-bordered table-hover table-striped" GridLines="None" DataKeyNames="req_id" DataSourceID="SqlDataSource1" AllowPaging="True">
                            <Columns>
                                
                                <asp:BoundField DataField="req_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="req_id" />
                                <asp:BoundField DataField="employee_name" HeaderText="Employee Name" SortExpression="emp_id" />
                                <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                                <asp:BoundField DataField="req_date" HeaderText="Request Date" SortExpression="req_date" />
                                <asp:BoundField DataField="span" HeaderText="Loan Span (Months)" SortExpression="span" />
                                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                                <asp:CommandField ShowDeleteButton="True" HeaderText="Delete"></asp:CommandField>
                                <asp:HyperLinkField HeaderText="Action" Text="Details" DataNavigateUrlFields="req_id" DataNavigateUrlFormatString="loan_details.aspx?id={0}" />
                                
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

				        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT l.req_id, e.employee_name, l.amount, l.req_date, l.span, l.status FROM [loan_request] AS l INNER JOIN [employee_info] AS e ON l.emp_id = e.employee_id" DeleteCommand="DELETE FROM loan_request WHERE req_id = @req_id">
                            <DeleteParameters>
                                <asp:Parameter Name="req_id" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </div>
				</div>
                <!-- /.row -->
                
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>

