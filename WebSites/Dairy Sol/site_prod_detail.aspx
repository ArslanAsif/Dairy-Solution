<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="site_prod_detail.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

		<div class="container opaque">
		<div class = 'center'>
			<div class = 'row'>
				<div class = "col-md-5">
					<div style = "margin: 20px" id = "prd_img">
                        <asp:Image ID="prod_image" CssClass="pBox" runat="server" width="400px" Height="400px"/>
						</div>
				</div>
				
				<div class = "col-md-7">
					<div id = "prd_des">
						<h2 runat="server" id="heading" class = "flatBox h2" style="text-align: center"></h2>
						<div class = "" style = "margin-left: 30%; margin-top: 20px">
							</br>
							<asp:label runat="server"><strong>Product ID: </strong>&nbsp;&nbsp;&nbsp;</asp:label><asp:Label runat="server" ID="product_id"></asp:Label><br>
							<asp:label runat="server"><strong>Availability: </strong>&nbsp;&nbsp;</asp:label><asp:Label runat="server" ID="availability"></asp:Label><br>
							<asp:label runat="server"><strong>Quantity: </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:label><asp:Label runat="server" ID="quantity"></asp:Label><br>
							<asp:label runat="server"><strong>Unit Price: </strong>&nbsp;&nbsp;&nbsp;&nbsp;Rs.</asp:label><asp:Label runat="server" ID="price"></asp:Label><br><br>
						</div>
						
						<div class = "" style="margin-left:27%">
							<asp:Button id = "order_btn" cssClass = "btn btn-primary" runat="server" CommandArgument='<%# Eval("product_id") %>' onClick="check_user" Text="Add To Cart"></asp:Button>
							<asp:Button id = "query_btn" cssClass = "btn btn-primary" runat="server" CommandArgument='<%# Eval("product_id") %>' onClick="check_user" Text="Send Query"></asp:Button>
						</div>
						
					</div>
				</div>
			</div>
			
            <div class = 'row'>
				<div class = "col-md-12">
					<h3 class = "h3">Specifications</h3>
					<p  id="specs_para" runat="server"></p>
					
				</div>
			</div>

			<div class = 'row'>
				<div class = "col-md-12">
					<h3 class = "h3">Description</h3>
					<p id="description_para" runat="server"></p>
					
				</div>
			</div>
		</div> 
		</div>
	    <br>
</asp:Content>