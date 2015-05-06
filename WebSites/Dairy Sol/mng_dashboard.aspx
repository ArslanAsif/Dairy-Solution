<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="mng_dashboard.aspx.cs" enableEventValidation="false" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Dashboard <small>(Management)</small>
                        </h1>
                    </div>
                </div>
                    
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-envelope fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">6</div>
                                        <div>New Messages!</div>
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
                                        <div class="huge">12</div>
                                        <div>New Tasks!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-truck fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">124</div>
                                        <div>New Orders!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-cube fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">13</div>
                                        <div>New Products!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
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
                                    
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT TOP 5 * FROM tasks ORDER BY task_date ASC;"></asp:SqlDataSource>
                                </div>
                                <div class="text-right">
                                    <a href="#">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Recent Orders</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive" style="height: 245px">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Order #</th>
                                                <th>Customer Name</th>
                                                <th>Items</th>
                                                <th>Order Date</th>
                                                <th>Amount (RS)</th>
                                            </tr>
                                        </thead>

                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">       
                                            <HeaderTemplate>
                                                <tbody>
                                            </HeaderTemplate>

                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("order_id") %></td>
                                                    <td><%# Eval("customer_name") %></td>
                                                    <td><%# Eval("product_name") %></td>
                                                    <td><%# Eval("order_date") %></td>
                                                    <td><%# Eval("price") %></td>
                                                </tr>
                                            </ItemTemplate>
											
                                            <FooterTemplate>
                                                </tbody>
                                            </FooterTemplate>
                                        </asp:Repeater>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT TOP 5 o.order_id, c.customer_name, p.product_name, o.order_date, i.price FROM orders AS o INNER JOIN products AS p ON o.product_id = p.product_id INNER JOIN customer_info AS c ON o.customer_id = c.customer_id INNER JOIN inventory_products AS i ON i.product_id = o.product_id WHERE i.product_id IN (SELECT TOP 1 i.product_id WHERE i.quantity != 0 ORDER BY i.batch_id ASC) ORDER BY o.order_date DESC;"></asp:SqlDataSource>
                                        
                                    </table>
                                </div>
                                <div class="text-right">
                                    <a href="order_cust.aspx">View All Orders <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
				
                <div class="row">
                    <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Progress</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-bar-chart" style="height: 367px"></div>
                            </div>
                        </div>
                    </div>
					<div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Monthly Sales</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-donut-chart"></div>
                                <div class="text-right">
                                    <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
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
                            <asp:TextBox ID ="task_desc" runat="server" CssClass="form-control control-height" placeholder="Task Description" type="text"></asp:TextBox></br>
                            <asp:TextBox ID ="task_date" runat="server" CssClass="form-control control-height" placeholder="Due Date" type="date"></asp:TextBox></br>
                            <asp:TextBox ID ="task_type" runat="server" CssClass="form-control control-height" placeholder="Type" type="text"></asp:TextBox></br>
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

