<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="loan_request.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="page-wrapper" style="height: 92.5vh">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Loans <small></small>
                        </h1>
                    </div>
                </div>
				
                <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <p>Request Submitted Successfully!</p>
                </div>

                <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <asp:Label runat="server" ID="error"></asp:Label>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Loan Request Form</h3>
                    </div>

                    <div class="panel-body" runat="server" id="prod">
                        <div class="row">
				            <label class = "col-md-2 control-label">Loan Amount</label>
				            <div class = "col-md-4">
					            <asp:TextBox ID ="amount" runat="server" type="text" CssClass="form-control control-height"></asp:TextBox><br/>
				            </div>

                            <label class = "col-md-2 control-label">Time Span</label>
				            <div class = "col-md-4">
                                <asp:DropDownList CssClass="form-control control-height" runat="server" ID="loan_span">
                                    <asp:ListItem Value="6">6 Months</asp:ListItem>
                                    <asp:ListItem Value="12">1 Year</asp:ListItem>
                                    <asp:ListItem Value="18">1 Year 6 Months</asp:ListItem>
                                    <asp:ListItem Value="24">2 Years</asp:ListItem>
                                </asp:DropDownList>
                                <br/>
				            </div>
                        </div>

				    </div>
                </div>

                <div class="pull-right">
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="formReset" Text="Reset" OnClick="formReset_Click"/>
                    <asp:Button ID="add_inv" runat="server" Text="Submit" style = "margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="send_req_Click" />
                </div>
				
                <br /><br /><br />
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Request History</h3>
                    </div>

                    <div class="panel-body" runat="server" id="Div1">
                        
                        <div class="col-lg-12">

                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" CssClass="table table-bordered table-hover table-striped" GridLines="None" DataKeyNames="req_id" DataSourceID="SqlDataSource1" AllowPaging="True">
                                <Columns>
                                
                                    <asp:BoundField DataField="req_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="req_id" />
                                    <asp:BoundField DataField="employee_name" HeaderText="Employee Name" SortExpression="emp_id" />
                                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                                    <asp:BoundField DataField="req_date" HeaderText="Request Date" SortExpression="req_date" />
                                    <asp:BoundField DataField="span" HeaderText="Loan Span (Months)" SortExpression="span" />
                                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                                    
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
				            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT l.req_id, e.employee_name, l.amount, l.req_date, l.span, l.status FROM [loan_request] AS l INNER JOIN [employee_info] AS e ON l.emp_id = e.employee_id WHERE e.employee_id = @user_id">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="NULL" Name="user_id" SessionField="userId" Type="Int64" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
				    </div>

                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->

</asp:Content>