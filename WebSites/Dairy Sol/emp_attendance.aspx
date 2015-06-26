<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="emp_attendance.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-4">
                        <h1 class="page-header">
                            Manage Employees <small>(Attendance)</small>
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
					<div class="col-lg-12">
                        
                        <asp:GridView ID="emp_attendance_GridView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" DataKeyNames="employee_id,date_time" CssClass="table table-bordered table-hover table-striped">
                            <Columns>
                                <asp:BoundField DataField="employee_id" HeaderText="Employee ID" SortExpression="employee_id" ReadOnly="True" />
                                <asp:BoundField DataField="employee_name" HeaderText="Employee Name" SortExpression="employee_name" ReadOnly="True" />
                                <asp:BoundField DataField="designation" HeaderText="Designation" SortExpression="designation" ReadOnly="True" />
                                <asp:BoundField DataField="date_time" HeaderText="Date &amp; Time" SortExpression="date_time" />
                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
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

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" OldValuesParameterFormatString="original_{0}"
                            SelectCommand="SELECT a.employee_id, i.employee_name, c.designation, a.date_time 
                                           FROM employee_attendance AS a
                                           INNER JOIN employee_info AS i
                                           ON a.employee_id = i.employee_id
                                           INNER JOIN employee_company_info AS c
                                           ON a.employee_id = c.employee_id" 
                            
                            DeleteCommand="DELETE FROM [employee_attendance] WHERE [employee_id] = @employee_id AND [date_time] = @date_time" 
                            InsertCommand="INSERT INTO [employee_attendance] ([employee_id], [date_time]) VALUES (@employee_id, @date_time)" 
                            UpdateCommand="UPDATE [employee_attendance] SET [date_time] = @date_time WHERE [date_time] = @original_date_time">
                            
                            <DeleteParameters>
                                <asp:Parameter Name="employee_id" Type="Int32" />
                                <asp:Parameter Name="date_time" Type="DateTime" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="employee_id" Type="Int32" />
                                <asp:Parameter Name="date_time" Type="DateTime" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="date_time" />
                                <asp:Parameter Name="original_date_time" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </div>
				</div>
                <!-- /.row -->
				
				</div>
				
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

</asp:Content>

