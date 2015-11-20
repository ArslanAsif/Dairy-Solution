<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="order_cust_add.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Add Order <small>Customer</small>
                        </h1>
                    </div>
                </div>

                <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <p>Successfully Added!</p>
                </div>

                <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <asp:Label runat="server" ID="error"></asp:Label>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Customer Info</h3>
                    </div>

                    <div class="panel-body" >
                        <label runat="server" id="cust_id" hidden="hidden"></label>
				        <label class = "col-md-2 control-label">Email ID</label>
				        <div class = "col-md-4">
                            <asp:TextBox ID ="email" runat="server" OnTextChanged="email_TextChanged" AutoPostBack="true" CssClass="form-control control-height"></asp:TextBox>
				        </div>
				        <label class = "col-md-2 control-label">Full Name</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="f_name" runat="server" CssClass="form-control control-height"></asp:TextBox><br/>
				        </div>
				    

				        <label class = "col-md-2 control-label">Contact #</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="contact_num" runat="server" CssClass="form-control control-height"></asp:TextBox>
				        </div>
				        <label class = "col-md-2 control-label">CNIC</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="cnic" runat="server" CssClass="form-control control-height"></asp:TextBox><br />
				        </div>
                        
                        <!--<div class="col-md-12" style="padding-top: 30px; padding-bottom: 20px"><p style="width: 100%; height: 1px; background-color: grey;"></p></div>-->

				        <label class = "col-md-2 control-label">Street Addr.</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="street_add" runat="server" CssClass="form-control control-height"></asp:TextBox>
				        </div>
				        <label class = "col-md-2 control-label">City</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="city_add" runat="server" CssClass="form-control control-height"></asp:TextBox><br/>
				        </div>
                        
				        <label class = "col-md-2 control-label">Province</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="prov_add" runat="server" CssClass="form-control control-height"></asp:TextBox>
				        </div>
                        
				    </div>
                </div>
				
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Products</h3>
                        <asp:Button CssClass="btn btn-sm btn-default" runat="server" ID="addControl" OnClick="add_textbox_Click" Text="+ Add More" style="float:right; margin-top: -23px; margin-right: -12px"/>
                        </div>

                    <div class="panel-body" runat="server">
				        <div>
                            <asp:PlaceHolder runat="server" ID="prod"></asp:PlaceHolder>
                        </div>
                        
				    </div>
                    
                </div>

                <asp:SqlDataSource ID="prod_list" runat="server" ConnectionString='<%$ ConnectionStrings:Dairy_SolutionConnectionString %>' SelectCommand="SELECT [product_id], [product_name] FROM [products]">
                </asp:SqlDataSource>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Payment Info</h3>
                    </div>

                    <div class="panel-body" >
				        <label class = "col-md-2 control-label">Pay Method</label>
				        <div class = "col-md-4">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control control-height">
                                <asp:ListItem>--Please Choose--</asp:ListItem>
                                <asp:ListItem>Cheque</asp:ListItem>
                                <asp:ListItem>Bank Transfer</asp:ListItem>
                                <asp:ListItem>Credit/Debit Card</asp:ListItem>
                            </asp:DropDownList>
					    </div>
				        <label class = "col-md-2 control-label">Amount</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="total" runat="server" CssClass="form-control control-height"></asp:TextBox><br/>
				        </div>
				    

				        <label class = "col-md-2 control-label">Description</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/>
				        </div>
				        <label class = "col-md-2 control-label">Other Specifications</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/><br/>
				        </div>
				    </div>
                </div>

                <div class="pull-right">
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="formReset" Text="Reset" OnClick="formReset_Click"/>
                    <asp:Button ID="Button1" runat="server" Text="Submit Order" style = "margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="add_order_Click"/>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>

