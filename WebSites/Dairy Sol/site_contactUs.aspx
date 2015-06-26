<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="site_contactUs.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
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
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3403.1464983708215!2d74.294422!3d31.46515600000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0000000000000000%3A0x7f4af9fb13c1f1b8!2sDairy+Solution+Pvt+Limited!5e0!3m2!1sen!2s!4v1431445844967" width="100%" height="400px" frameborder="0" style="border:0"></iframe>
                        
					</div>
					
					<div class="col-md-4">
					<h3 class="h3" style="margin-top: 0px; margin-bottom: 15px">Send us Inquiry</h3>
						<form role="form" runat="server">
                            <div class="alert alert-success alert-dismissible" role="alert" runat="server" id="alertMsg" visible="false">
                                <button type="button" class="close" data-dismiss="alert"><span>&times;</span></button>
                                <strong><asp:Label runat="server" ID="submitMsg" Text=""></asp:Label></strong>
                            </div>
                            
                            <asp:TextBox ID="sender_name" runat="server" type="text" class="form-control" placeholder="Name"></asp:TextBox>
							<br/>
                            <asp:TextBox ID="sender_email" runat="server" type="text" class="form-control" placeholder="Email"></asp:TextBox>
							<br/>
                            <asp:TextBox ID="sender_subject" runat="server" type="text" class="form-control" placeholder="Subject"></asp:TextBox>
							<br/>
                            <asp:TextBox ID="message" runat="server" type="text" TextMode="MultiLine" Rows="5" class="form-control" placeholder="Message"></asp:TextBox>
                            <br/>
                            <asp:Button ID="add_order" runat="server" Width="100%" Text="Submit" type = "submit" class = "btn btn-primary" OnClick="add_query_Click"/>
						</form>
					</div>
				</div>
			</div>
		</div>   
    </div>
	<br>

</asp:Content>

