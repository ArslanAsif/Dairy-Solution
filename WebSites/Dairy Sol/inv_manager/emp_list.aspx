<%@ Page Title="" Language="C#" MasterPageFile="~/inv_manager/MasterInv.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="emp_list.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper" style="height:93vh">

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
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AllowPaging="true" AutoGenerateColumns="False" BackColor="White" CssClass="table table-bordered table-hover table-striped" GridLines="None"  DataKeyNames="employee_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="employee_id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="employee_id" />
                                <asp:BoundField DataField="employee_name" HeaderText="Employee Name" SortExpression="employee_name" />
                                <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                                <asp:BoundField DataField="email_id" HeaderText="Email ID" SortExpression="email_id" />
                                <asp:BoundField DataField="mobile_number" HeaderText="Mobile Number" SortExpression="mobile_number" />
                                <asp:HyperLinkField DataNavigateUrlFields="employee_id" DataNavigateUrlFormatString="emp_profile.aspx?id={0}" Text="View" HeaderText="Full Profile" />
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

				        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" 
                            DeleteCommand="DELETE FROM [employee_info] WHERE [employee_id] = @original_employee_id AND (([employee_name] = @original_employee_name) OR ([employee_name] IS NULL AND @original_employee_name IS NULL)) AND (([gender] = @original_gender) OR ([gender] IS NULL AND @original_gender IS NULL)) AND [email_id] = @original_email_id AND (([employee_picture] = @original_employee_picture) OR ([employee_picture] IS NULL AND @original_employee_picture IS NULL)) AND (([mobile_number] = @original_mobile_number) OR ([mobile_number] IS NULL AND @original_mobile_number IS NULL))" 
                            InsertCommand="INSERT INTO [employee_info] ([employee_name], [gender], [email_id], [employee_picture], [mobile_number]) VALUES (@employee_name, @gender, @email_id, @employee_picture, @mobile_number)" 
                            OldValuesParameterFormatString="original_{0}" 
                            SelectCommand="SELECT [employee_id], [employee_name], [gender], [email_id], [employee_picture], [mobile_number] FROM [employee_info]" 
                            UpdateCommand="UPDATE [employee_info] SET [employee_name] = @employee_name, [gender] = @gender, [email_id] = @email_id, [employee_picture] = @employee_picture, [mobile_number] = @mobile_number WHERE [employee_id] = @original_employee_id">
                            
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

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" 
                            DeleteCommand="DELETE FROM [employee_info] WHERE [employee_id] = @original_employee_id AND (([employee_name] = @original_employee_name) OR ([employee_name] IS NULL AND @original_employee_name IS NULL)) AND (([gender] = @original_gender) OR ([gender] IS NULL AND @original_gender IS NULL)) AND [email_id] = @original_email_id AND (([employee_picture] = @original_employee_picture) OR ([employee_picture] IS NULL AND @original_employee_picture IS NULL)) AND (([mobile_number] = @original_mobile_number) OR ([mobile_number] IS NULL AND @original_mobile_number IS NULL))" 
                            InsertCommand="INSERT INTO [employee_info] ([employee_name], [gender], [email_id], [employee_picture], [mobile_number]) VALUES (@employee_name, @gender, @email_id, @employee_picture, @mobile_number)" 
                            OldValuesParameterFormatString="original_{0}" 
                            SelectCommand="SELECT [employee_id], [employee_name], [gender], [email_id], [employee_picture], [mobile_number] FROM [employee_info] WHERE (employee_name LIKE '%' + @name + '%')" 
                            UpdateCommand="UPDATE [employee_info] SET [employee_name] = @employee_name, [gender] = @gender, [email_id] = @email_id, [employee_picture] = @employee_picture, [mobile_number] = @mobile_number WHERE [employee_id] = @original_employee_id">
                            
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
                            <SelectParameters>
                                <asp:ControlParameter ControlID="search" PropertyName="Text" Name="name" Type="String"></asp:ControlParameter>
                            </SelectParameters>
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

