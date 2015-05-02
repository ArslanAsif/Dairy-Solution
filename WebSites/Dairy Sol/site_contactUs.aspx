<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="site_contactUs.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    	<div class="container opaque">
		<div class = 'center'>
		
			<h2>Contact Us Now</h2>
			<div style = "margin-top: -15px">
				<div class = 'row'>
					<div class="col-md-8 boxDesign">
						<h3 class = "flatBox flat">Address</h3>
						<p class="boxAlign">177-B Johar Town, Lahore, Pakistan<br>info@dairysolution.com</p>
					</div>
					<div class="col-md-4 boxDesign">
						<h3 class = "h3">Telephone</h3>
						<p><a href="#"><span class="fa fa-phone" style="margin-left:10px; color: black"></span></a><strong> +92-42-35169450-51</strong></p>
                        <span class="glyphicons glyphicons-fax"></span>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-8">
						<img src="images\mapImg.png" width="100%"></img>
						<br><br>
					</div>
					
					<div class="col-md-4">
					<h3 class="h3" style="margin-top: 0px; margin-bottom: 15px">Send us Inquiry</h3>
						<form role="form">
							<input type="name" class="form-control" placeholder="Name">
							<br>
							<input type="name" class="form-control" placeholder="Email">
							<br>
							<input type="name" class="form-control" placeholder="Subject">
							<br>
							<textarea class="form-control" rows="5" placeholder="Message"></textarea>
							<br>
							<button class="btn btn-default" style="float: right">Send</button>
						</form>
					</div>
				</div>
			</div>
		</div>   
    </div>
	<br>

</asp:Content>

