<%@ Page Title="" Language="C#" MasterPageFile="~/inv_manager/MasterInv.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile ="inv_add.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="page-wrapper" style="height: 92.5vh">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Inventory <small></small>
                        </h1>
                    </div>
                </div>
				
                <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <p>Inventory Added Successfully!</p>
                </div>

                <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <asp:Label runat="server" ID="error"></asp:Label>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Add Product in Inventory</h3>    
                    </div>

                    <div class="panel-body" runat="server" id="prod">
				        <label class = "col-md-2 control-label">Product Name</label>
				        <div class = "col-md-4">
                            <asp:DropDownList ID="ProdDropDownList" CssClass="form-control control-height" DataSourceID="prod_list" DataTextField="product_name" DataValueField="product_id" runat="server"></asp:DropDownList>
                            <asp:SqlDataSource ID="prod_list" runat="server" ConnectionString='<%$ ConnectionStrings:Dairy_SolutionConnectionString %>' SelectCommand="SELECT [product_id], [product_name] FROM [products]">
                            </asp:SqlDataSource>
					        
				        </div>
				        <label class = "col-md-2 control-label">Quantity</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="quantity" runat="server" type="number" required="required" CssClass="form-control control-height"></asp:TextBox><br/>
				        </div>
				    

				        <label class = "col-md-2 control-label">Price</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="price" runat="server" type="number" required="required" CssClass="form-control control-height"></asp:TextBox>
				        </div>
				        
                        <label class = "col-md-2 control-label">Discount ( % )</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="discount" type="number" runat="server" CssClass="form-control control-height"></asp:TextBox><br/>
				        </div>
                        
                        <label class = "col-md-2 control-label">Expiry Date</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="expiry" runat="server" type="date" CssClass="form-control control-height"></asp:TextBox><br/>
				        </div>
				    </div>
                </div>

                <div class="pull-right">
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="formReset" Text="Reset" OnClick="formReset_Click"/>
                    <asp:Button ID="add_inv" runat="server" Text="Submit Order" style = "margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="add_inv_Click"/>
                </div>
				
            </div>
            <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->
</asp:Content>