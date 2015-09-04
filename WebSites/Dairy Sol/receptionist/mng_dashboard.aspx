<%@ Page Title="" Language="C#" MasterPageFile="~/receptionist/MasterRecept.master" AutoEventWireup="true" CodeFile="mng_dashboard.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Dashboard <small>(Reception)</small>
                        </h1>
                        <label runat="server" id="lab2"></label>
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-envelope fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"></div>
                                        <div>Messages!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="messages.aspx">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"></div>
                                        <div>Tasks!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="tasks.aspx">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                </div>
                <!-- /.row -->
				
				<!-- /.row -->
				
				<div class="row">
                    
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i>Tasks Panel</h3>
                                <a href="#" class="pull-right" style="margin-top: -23px" data-toggle="modal" data-target="#addTask_modal"><i class="fa fa-2x fa-plus-square" style="color: grey"></i></a>
                            </div>
                            <div class="panel-body" >
                                <div class="list-group" style="height: 225px">
                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">       
                                        <HeaderTemplate></HeaderTemplate>

                                        <ItemTemplate>
                                            <a href="#" class="list-group-item">
                                                <span class="badge"><%# Eval("task_date") %></span>
                                                <i class="fa fa-fw fa-calendar"></i> <%# Eval("task_desc") %>
                                            </a>
                                        </ItemTemplate>
											
                                        <FooterTemplate></FooterTemplate>
                                    </asp:Repeater>
                                    
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT TOP 5 * FROM tasks WHERE added_to = @user_id ORDER BY task_date ASC">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="NULL" Name="user_id" SessionField="userId" Type="Int64" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="text-right">
                                    <a href="tasks.aspx">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                </div>
                <!-- /.row -->
				
                
				
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
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
</asp:Content>

