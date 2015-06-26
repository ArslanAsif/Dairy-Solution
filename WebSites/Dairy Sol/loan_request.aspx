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
				
            </div>
            <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->

</asp:Content>