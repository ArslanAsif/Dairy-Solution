<%@ Page Title="" Language="C#" MasterPageFile="~/sales_person/MasterSales.master" enableEventValidation="false" AutoEventWireup="true" CodeFile="tasks.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper" style="height: 93vh">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-4">
                        <h1 class="page-header">
                            My Tasks <small><a href="#" class="btn btn-sm btn-default" style="float: right; margin-right: 15px; margin-top: 5px" data-toggle="modal" data-target="#addTask_modal"><i class="fa fa-plus-square" style="color: grey"> Add Task</i></a></small>
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
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="task_id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" CssClass="table table-bordered table-hover table-striped">
                            <Columns>
                                <asp:BoundField DataField="task_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="task_id" />
                                <asp:BoundField DataField="task_desc" HeaderText="Task" SortExpression="task_desc">
                                </asp:BoundField>
                                <asp:BoundField DataField="task_date" HeaderText="Scheduled Date" SortExpression="task_date"/>
                                <asp:BoundField DataField="task_type" HeaderText="Type" SortExpression="task_type" />
                                <asp:BoundField DataField="employee_name" HeaderText="Given By" SortExpression="employee_name" />
                                <asp:BoundField DataField="added_on" HeaderText="Assigned On" SortExpression="added_on" />
                                <asp:BoundField DataField="task_status" HeaderText="Status" SortExpression="task_status" />
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

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT t.[task_id], t.[task_desc], t.[task_date], t.[task_type], e.[employee_name], t.[added_on], t.[task_status] FROM [tasks] AS t INNER JOIN [employee_info] AS e ON t.[added_by]=e.[employee_id] WHERE t.[added_to] = @user_id ORDER BY t.[task_date] DESC">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="NULL" Name="user_id" SessionField="userId" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT t.[task_id], t.[task_desc], t.[task_date], t.[task_type], e.[employee_name], t.[added_on], t.[task_status] FROM [tasks] AS t INNER JOIN [employee_info] AS e ON t.[added_by]=e.[employee_id] WHERE (t.[added_to] = @user_id) AND (employee_name LIKE '%' + @name + '%') OR (task_desc LIKE '%' + @name + '%') ORDER BY t.[task_date] DESC">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="NULL" Name="user_id" SessionField="userId" Type="Int64" />
                                <asp:ControlParameter ControlID="search" PropertyName="Text" Name="name" Type="String"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
				</div>
                <!-- /.row -->
				
            </div>
            <!-- /.container-fluid -->

        <div class="modal fade" id="addTask_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title"><i class="fa fa-clock-o"></i> New Task</h4>
                    </div>

                    <div class="modal-body">
                        <form class="form-group">
                            <asp:TextBox ID ="task_type" runat="server" CssClass="form-control control-height" placeholder="Type" type="text"></asp:TextBox><br />
                            <asp:TextBox ID ="task_desc" runat="server" CssClass="form-control control-height" TextMode="MultiLine" Rows="3" placeholder="Task Description" type="text"></asp:TextBox><br />
                            <asp:TextBox ID ="task_date" runat="server" CssClass="form-control control-height" placeholder="Due Date" type="date"></asp:TextBox><br />
                            
                        </form>
                    </div>

                    <div class="modal-footer">
                        <div class="pull-right">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text="Cancel" data-dismiss="modal" />
                            <asp:Button ID="task_submit" runat="server" Text="Submit" type = "submit" class = "btn btn-primary" OnClick="add_task_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </div>
        <!-- /#page-wrapper -->
</asp:Content>

