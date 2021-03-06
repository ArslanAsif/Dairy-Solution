﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="loan_details.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="page-wrapper" style="height: 92.5vh">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Loan <small>Details</small>
                        </h1>
                    </div>
                </div>
				
                <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <p>Request Submitted Successfully!</p>
                </div>

                <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_rejected">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <p>Request Rejected!</p>
                </div>

                <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <asp:Label runat="server" ID="error"></asp:Label>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Loan Request</h3>
                    </div>

                    <div class="panel-body" runat="server" id="prod">
                        
                        <div class="row">
				            <label class = "col-md-2 control-label">Employee Name: </label>
				            <div class = "col-md-4 ">
                                <asp:Label runat="server" ID="emp_id" class = "control-label" hidden="hidden">N.A.</asp:Label>
                                <asp:Label runat="server" ID="emp_name" class = "control-label">N.A.</asp:Label>

                                <asp:Button runat="server" CssClass="btn btn-sm btn-default" ID="redirect_profile" OnClick="redirect_profile_Click" Text="View Profile"></asp:Button>
				            </div>
                        </div>

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
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="Button1" Text="Reject" OnClick="refuse_req_Click"/>
                    
                    <asp:Button ID="add_inv" runat="server" Text="Accept" style = "margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="send_req_Click" />
                </div>
				
            </div>
            <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->

</asp:Content>

