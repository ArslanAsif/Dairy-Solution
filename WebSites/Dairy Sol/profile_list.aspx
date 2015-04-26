<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="profile_list.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">

            <div class="container-fluid">
  
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-4">
                        <h1 class="page-header">
                            Manage Employees <small>(Profile)</small>
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
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" CssClass="table table-bordered table-hover table-striped" GridLines="None"  DataKeyNames="employee_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="employee_id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                                <asp:ImageField ControlStyle-CssClass="padding: 50px" AccessibleHeaderText="Image" DataImageUrlField="employee_picture" HeaderText="Picture" NullImageUrl="~/images/profile_default.jpg">
                                    <ControlStyle CssClass="padding: 50px" Height="75px" Width="75px"></ControlStyle>
                                </asp:ImageField>
                                <asp:BoundField DataField="employee_name" HeaderText="Employee Name" SortExpression="employee_name" />
                                <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                                <asp:BoundField DataField="email_id" HeaderText="Email ID" SortExpression="email_id" />
                                <asp:BoundField DataField="mobile_number" HeaderText="Mobile Number" SortExpression="mobile_number" />
                                <asp:CommandField ShowEditButton="True" HeaderText="Edit" />
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
				        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" DeleteCommand="DELETE FROM [employee_info] WHERE [employee_id] = @original_employee_id AND (([employee_name] = @original_employee_name) OR ([employee_name] IS NULL AND @original_employee_name IS NULL)) AND (([gender] = @original_gender) OR ([gender] IS NULL AND @original_gender IS NULL)) AND [email_id] = @original_email_id AND (([employee_picture] = @original_employee_picture) OR ([employee_picture] IS NULL AND @original_employee_picture IS NULL)) AND (([mobile_number] = @original_mobile_number) OR ([mobile_number] IS NULL AND @original_mobile_number IS NULL))" InsertCommand="INSERT INTO [employee_info] ([employee_name], [gender], [email_id], [employee_picture], [mobile_number]) VALUES (@employee_name, @gender, @email_id, @employee_picture, @mobile_number)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [employee_id], [employee_name], [gender], [email_id], [employee_picture], [mobile_number] FROM [employee_info]" UpdateCommand="UPDATE [employee_info] SET [employee_name] = @employee_name, [gender] = @gender, [email_id] = @email_id, [employee_picture] = @employee_picture, [mobile_number] = @mobile_number WHERE [employee_id] = @original_employee_id">
                            <DeleteParameters>
                                <asp:Parameter Name="original_employee_id" Type="Int32" />
                                <asp:Parameter Name="original_employee_name" Type="String" />
                                <asp:Parameter Name="original_gender" Type="String" />
                                <asp:Parameter Name="original_email_id" Type="String" />
                                <asp:Parameter Name="original_employee_picture" Type="String" />
                                <asp:Parameter Name="original_mobile_number" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="employee_name" Type="String" />
                                <asp:Parameter Name="gender" Type="String" />
                                <asp:Parameter Name="email_id" Type="String" />
                                <asp:Parameter Name="employee_picture" Type="String" />
                                <asp:Parameter Name="mobile_number" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="employee_name" Type="String" />
                                <asp:Parameter Name="gender" Type="String" />
                                <asp:Parameter Name="email_id" Type="String" />
                                <asp:Parameter Name="employee_picture" Type="String" />
                                <asp:Parameter Name="mobile_number" Type="String" />
                                <asp:Parameter Name="original_employee_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
				</div>
				<br>
                <!-- /.row -->
				
				
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>

