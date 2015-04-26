<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="prod_add.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Add Products <small></small>
                </h1>
            </div>
        </div>
				
		<div class="row">
			<div class="col-md-12"><div class = 'row'>
			<div class="col-md-6 col-md-offset-3">
				<div style="margin-top: 5%"">
					<br/>
					<form role="form">
                        <asp:TextBox ID="product_name" runat="server" type="text" class="form-control control-height" placeholder="Product Name"></asp:TextBox>
						<br/>
						<asp:TextBox ID="product_min_level" runat="server" type="text" class="form-control control-height" placeholder="Product Minimum Level For Inventory"></asp:TextBox>
                        <br/>
                        <textarea id="product_description" runat="server" class="form-control" rows="4" placeholder ="Product Description"></textarea>
                        <br/>
                        <textarea id="product_spec" runat="server"  class="form-control" rows="4" placeholder ="Product Specifications"></textarea>
                        <br/>
                        <label>Add Product Picture</label><asp:FileUpload ID="product_picture" runat="server"/>
                        <br/>
                        <asp:Button ID="add_product_button" runat="server" Text="Add Product" style = "width: 100%; margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="add_product_button_Click"/>
                        <br/>
                                
					</form>
				</div>
			</div>
		    </div></div>
		</div>
        <!-- /.row -->
				
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
</asp:Content>