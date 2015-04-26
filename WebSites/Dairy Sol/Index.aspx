<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Dairy Solution|Index</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container opaque">
		<div class = 'center'>
				<br>
				<div id = 'slider' style = "box-shadow: 2px 2px 7px #5C5C5C;">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					  <!-- Indicators -->
					  <ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						<li data-target="#carousel-example-generic" data-slide-to="3"></li>
					  </ol>

					  <!-- Wrapper for slides -->
					  <div class="carousel-inner" role="listbox">
						<div class="item active">
						  <img src="images\slider\slide1.png" width="100%">
						  <div class="carousel-caption">
							<!--Any text etc on slide-->
						  </div>
						</div>
						<div class="item">
						  <img src="images\slider\slide2.png" width="100%">
						  <div class="carousel-caption">
							<!--Any text etc on slide-->
						  </div>
						</div>
						<div class="item">
						  <img src="images\slider\slide3.png" width="100%">
						  <div class="carousel-caption">
							<!--Any text etc on slide-->
						  </div>
						</div>
						<div class="item">
						  <img src="images\slider\slide4.png" width="100%">
						  <div class="carousel-caption">
							<!--Any text etc on slide-->
						  </div>
						</div>
						
					  </div>
					</div>
				</div>
				<br>
				
				<div class = 'row'>
					<div class="col-md-4 boxDesign">
						<div class = " pBox">
							<h2 class = "h3">Our Team</h3>
							<p class="boxAlign">I'm a Paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me and you can start adding your own content and make changes to the font.<br>I’m a great place for you to let your users know a little more about you. If you want to delete me just click on me and press delete.</p>
							<button class="btn btn-default">More</button>
						</div>
					</div>
					<div class="col-md-4 boxDesign">
						<div class = " pBox">
							<h3 class = "h3">Our Team</h3>
							<p class="boxAlign">I'm a Paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me and you can start adding your own content and make changes to the font.<br>I’m a great place for you to let your users know a little more about you. If you want to delete me just click on me and press delete.</p>
							<button class="btn btn-default">More</button>
						</div>
					</div>
					<div class="col-md-4">
						<div class = "flatBox cntBox">
							<h3>Connect with Us</h3>
							<p>We are here to help your issue and inquires.</p>
							<p><a href="#"><span class="glyphicon glyphicon-phone-alt" style="color: white"></span></a><strong> 123 456 789</strong></p>
							<p><a href="#"><span class="glyphicon glyphicon-envelope" style="color: white"></span></a><strong> info@mysite.com</strong></p>
							<p>FOLLOW US:</p>
							<ul id="socialList" style="padding-bottom: 10px">
								<li><a href="#"><img src="images\social\fb.png" width="50" height="50"></img></a></li>
								<li><a href="#"><img src="images\social\g.png" width="50" height="50"></img></a></li>
								<li><a href="#"><img src="images\social\tw.png" width="50" height="50"></img></a></li>
							</ul>
						</div>
					</div>
					
					<div class="col-md-8 boxDesign">
						<div class = "pBox">
							<h3 class = "flatBox flat">Updates</h3>
							<div class = "boxAlign" style="margin-top: 20px">
								<img src="images\updates\update1.jpg" class"update"></img>
								<div class="uSpace">
									<p type"datetime">10-25-2014</p>
									<p>I'm a Paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me and you can start adding your own content and make changes to the font.<br>I’m a great place for you to let your users know a little more about you. If you want to delete me just click on me and press delete.</p>
									<a href="#" class="more">Read more...</a>
								</div>
							</div>
							
							<div class = "boxAlign" style="margin-top: -20px; padding-bottom: 1px;">
								<img src="images\updates\update2.jpg" class"update"></img>
								<div class="uSpace uS2">
									<p type"datetime">10-25-2014</p>
									<p>I'm a Paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me and you can start adding your own content and make changes to the font.<br>I’m a great place for you to let your users know a little more about you. If you want to delete me just click on me and press delete.</p>
									<a href="#" class="more">Read more...</a>
									
								</div>
							</div>
							
						</div>
					</div>
					<div class="col-md-4 boxDesign">
						<div class = "pBox" style = "padding-bottom: 8px;">
							<h3 class = "h3">Products & Services</h3>
							<ul class="category" style = " padding-top: 1px;">
								<li class="catAlign"><a href="#">Automatic Foot Bath</a></li>
								<li class="catAlign"><a href="#">Bulk Cooling Tanks</a></li>
								<li class="catAlign"><a href="#">Extraction Units</a></li>
								<li class="catAlign"><a href="#">Feeding & Breeding</a></li>
								<li class="catAlign"><a href="#">Chemicals & Supplies</a></li>
								<li class="catAlign"><a href="#">Hi-Tech Equipments</a></li>
								<li class="catAlign"><a href="#">Milk Processing Machinery</a></li>
								<li class="catAlign"><a href="#">Mobile Milking Machine</a></li>
								<li class="catAlign"><a href="#">Farm Installations</a></li>
								<li class="catAlign"><a href="#">Slurry Tanker</a></li>
							</ul>
						</div>
					</div>
				</div>
				<br>
		</div>   
    </div>
</asp:Content>

