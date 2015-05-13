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

                <div class = "form-group" id="formHoriz">
                <div class="alert alert-danger alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <strong>Oh snap!</strong> Change a few things up and try submitting again.
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Personal Info</h3>
                    </div>

                    <div class="panel-body" >
				        <label class = "col-md-2 control-label">Full Name</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/>
				        </div>
				        <label class = "col-md-2 control-label">Email ID</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/><br/>
				        </div>
				    

				        <label class = "col-md-2 control-label">Contact Number</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/>
				        </div>
				        <label class = "col-md-2 control-label">CNIC</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/><br/>
				        </div>
				    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Customer Address</h3>
                    </div>

                    <div class="panel-body" >
				        <label class = "col-md-2 control-label">Street</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/>
				        </div>
				        <label class = "col-md-2 control-label">City</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/><br/>
				        </div>
                        
				        <label class = "col-md-2 control-label">Province</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/>
				        </div>
                        <label class = "col-md-2 control-label">Postal Address</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/><br/>
				        </div>
				    </div>
                </div>
				
				<div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Sales Person</h3>
                    </div>

                    <div class="panel-body" >
				
				        <label class = "col-md-2 control-label">Name</label>
				
				        <div class = "col-md-4">
					        <select class = "form-control control-height">
                                <option>--Please Choose--</option>
						        <option>Option 1</option>
						        <option>Option 2</option>
					        </select>
				        </div>
				        <label class = "col-md-2 control-label">Email ID</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/>
				        </div>
                    </div>
			    </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Products</h3>
                    </div>

                    <div class="panel-body" >
				        <label class = "col-md-2 control-label">Product Name</label>
				        <div class = "col-md-4">
					        <select class = "form-control control-height">
                                <option>--Please Choose--</option>
						        <option>Option 1</option>
						        <option>Option 2</option>
					        </select>
				        </div>
				        <label class = "col-md-2 control-label">Quantity</label>
				        <div class = "col-md-4">
					        <input class = "form-control control-height" type = "text"/><br/>
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
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="formReset" Text="Reset" />
                    <asp:Button ID="Button1" runat="server" Text="Submit Order" style = "margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="add_order_Click"/>
                </div>
                

                <form class="form-group">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                                <br />
                                <asp:TextBox ID ="customer_id" runat="server" CssClass="form-control control-height" placeholder="Customer ID"></asp:TextBox>
						        <br/>
                                <asp:TextBox ID="employee_id" runat="server" type="text" class="form-control control-height" placeholder="Employee ID"></asp:TextBox>
						        <br/>

                                <asp:TextBox ID="date" runat="server" type="date" class="form-control control-height" placeholder="Date"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="product_id" runat="server" type="text" class="form-control control-height" placeholder="Product ID"></asp:TextBox>
                                <br />
							    <asp:TextBox ID="product_quantity" runat="server" type="text" class="form-control control-height" placeholder="Product Quantity"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="product_description" runat="server" type="text" class="form-control control-height" placeholder="Product Desription"></asp:TextBox>
							    <br/>
                                <asp:TextBox ID="services" runat="server" type="text" class="form-control control-height" placeholder="Services"></asp:TextBox>
							    <br/>
                                <asp:Button ID="add_order" runat="server" Width="100%" Text="Submit Order" style = "margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="add_order_Click"/>
                        </div>
                    </div>
                    <br />
                </form>	
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>

