<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile ="inv_add.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Add Inventory <small></small>
                        </h1>
                    </div>
                </div>
				
				<div class = 'row'>
					<div class="col-md-4 col-md-offset-4 boxDesign" style = " margin-top: -35px"">
						<div style="margin-top: 10%"">
							<br/>
							<form role="form">
                                <asp:Label ID="validate" runat="server" Text="Label" EnableViewState="false" Visible="false"></asp:Label>
                                <asp:TextBox ID="inventory_name" runat="server" type="text" class="form-control control-height" placeholder="Product Name"></asp:TextBox>
								<br/>
                                <asp:TextBox ID="inventory_entry_date" runat="server" type="text" class="form-control control-height"></asp:TextBox>
								<br/>
                                <asp:TextBox ID="inventory_product_id" runat="server" type="text" class="form-control control-height" placeholder="Product ID"></asp:TextBox>
								<br/>
								<asp:TextBox ID="inventory_quantity" runat="server" type="text" class="form-control control-height" placeholder="Product Quantity"></asp:TextBox>
								<br/>
                                <asp:TextBox ID="product_price" runat="server" type="text" class="form-control control-height" placeholder="Product Price"></asp:TextBox>
								<br/>
                                <asp:TextBox ID="product_discount" runat="server" type="text" class="form-control control-height" placeholder="Product Discount"></asp:TextBox>
								<br/>
								<asp:TextBox ID="expiry_date" runat="server" type="date" class="form-control control-height"></asp:TextBox><br />
                                <asp:Button ID="inventory_button" runat="server" Text="Add Inventory" style = "width: 100%" type = "submit" class = "btn btn-primary" OnClick="inventory_button_Click"/>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
							</form>
						</div>
					</div>
				</div>
				
            </div>
            <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->
</asp:Content>