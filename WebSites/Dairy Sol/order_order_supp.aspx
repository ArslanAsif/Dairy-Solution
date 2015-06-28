<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" enableEventValidation="false" CodeFile ="order_order_supp.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper" style="height:93vh">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        Place Order <small>Supplier</small>
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
                    <h3 class="panel-title"><i class=""></i>Supplier Info</h3>
                </div>

                <div class="panel-body" >
                    <label runat="server" id="supplier_id" hidden="hidden"></label>
				    <label class = "col-md-2 control-label">Email ID</label>
				    <div class = "col-md-4">
                        <asp:TextBox ID ="email" runat="server" OnTextChanged="email_TextChanged" AutoPostBack="true" CssClass="form-control control-height"></asp:TextBox>
				    </div>
				    <label class = "col-md-2 control-label">Name</label>
				    <div class = "col-md-4">
					    <asp:TextBox ID ="name" runat="server" CssClass="form-control control-height"></asp:TextBox><br />
				    </div>
				    <label class = "col-md-2 control-label">Contact #</label>
				    <div class = "col-md-4">
					    <asp:TextBox ID ="contact_num" runat="server" CssClass="form-control control-height"></asp:TextBox>
				    </div>
				    <label class = "col-md-2 control-label">Other Contact</label>
				    <div class = "col-md-4">
					    <asp:TextBox ID ="contact_num2" runat="server" CssClass="form-control control-height"></asp:TextBox><br />
				    </div>
                        
                    <!--<div class="col-md-12" style="padding-top: 30px; padding-bottom: 20px"><p style="width: 100%; height: 1px; background-color: grey;"></p></div>-->

				    <label class = "col-md-2 control-label">Address</label>
				    <div class = "col-md-4">
					    <asp:TextBox ID ="address" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control control-height"></asp:TextBox>
				    </div>
                    
			    </div>
            </div>
				
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class=""></i>Products</h3>
                    <asp:Button runat="server" ID="addProd" CssClass="pull-right btn btn-sm btn-default" style="margin-top: -23px; margin-right: -12px" Text="+ Add More" OnClick="add_textbox_Click"/>
                </div>

                <div class="panel-body" runat="server" id="prod">
				    <div>
                        <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
                    </div>
			    </div>
            </div>

            <asp:SqlDataSource ID="prod_list" runat="server" ConnectionString='<%$ ConnectionStrings:Dairy_SolutionConnectionString %>' SelectCommand="SELECT [product_id], [product_name] FROM [products]">
            </asp:SqlDataSource>
        
            <div class="pull-right">
                <asp:Button runat="server" CssClass="btn btn-danger" ID="formReset" Text="Reset" OnClick="formReset_Click"/>
                <asp:Button ID="Button2" runat="server" Text="Submit Order" style = "margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="add_order_Click"/>
            </div>
	
        </div>
            <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->
</asp:Content>