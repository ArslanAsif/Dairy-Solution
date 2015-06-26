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
						<div class = " pBox" style="padding-bottom: 87px">
							<h2 class = "h3">Mission Statement</h3>
							<p class="boxAlign">Our mission is to be the one stop shop for the Farmers. To work with the best companies in the world and to bring best quality products at best price from all over the world for our farmers.<br></p>
							<a href="http://localhost:64820/site_about.aspx#mStatement"><button class="btn btn-default" style="float: right; margin-top: 45px">More</button></a>
						</div>
					</div>
					<div class="col-md-4 boxDesign">
						<div class = " pBox" style="padding-bottom: 67px">
							<h3 class = "h3">Our Team</h3>
							<p class="boxAlign">Our highly trained project team understands the essential elements to balance costs with time-to-market and rollout requirements. We optimize the coordination, communications, and resource usage to turn tight rollout project plans into reality.</p>
							<a href="http://localhost:64820/site_about.aspx#into"><button class="btn btn-default" style="float: right; margin-top: 25px">More</button></a>
						</div>
					</div>
					<div class="col-md-4">
						<div class = "flatBox cntBox" style="padding-bottom: 3px">
							<h3>Connect with Us</h3>
							<p>We are here to help resolve your issue and inquires.</p>
							<p><a href="#"><span class="fa fa-phone" style="color: white"></span></a><strong> +92-42-35169450-51</strong></p>
							<p><a href="#"><span class="fa fa-envelope" style="color: white"></span></a><strong> info@dairysolution.com</strong></p>
							<p>FOLLOW US:</p>
							<ul id="socialList" style="padding-bottom: 0px">
								<li><a href="#"><img src="images\social\fb.png" width="50" height="50"></img></a></li>
								<li><a href="#"><img src="images\social\g.png" width="50" height="50"></img></a></li>
								<li><a href="#"><img src="images\social\tw.png" width="50" height="50"></img></a></li>
							</ul>
						</div>
					</div>
					
					<div class="col-md-8 boxDesign">
						<div class = "pBox">
							<h3 class = "flatBox flat">Updates</h3>
							<div class = "boxAlign" style="">
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">       
                                <HeaderTemplate>
                                    <table>
                                </HeaderTemplate>

                                <ItemTemplate>
                                    <tr>
                                    <div class="media">
                                        <div class="media-left">
                                            <a href="#">
                                            <img class="media-object" height="100px" width="100px" src="<%# Eval("picture") %>" alt="...">
                                            </a>
                                        &nbsp;&nbsp;</div>
                                        <div class="media-body">
                                            <h4 class="media-heading"><%# Eval("heading") %></h4>
                                            <p><%# Eval("date") %></p>
                                            <p><%# Eval("detail") %></p>
                                            <a href="site_post_detail.aspx?id=<%# Eval("post_id") %>" class="more">Read more...</a>
                                        </div>
                                    </div>
                                    </tr>
                                </ItemTemplate>

                                  <FooterTemplate>
                                      </table>
                                  </FooterTemplate>
                                </asp:Repeater>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT TOP 2 * FROM [posts]"></asp:SqlDataSource>                        
                            </div>
						</div>
					</div>
					<div class="col-md-4 boxDesign">
						<div class = "pBox" style = "padding-bottom: 8px;">
							<h3 class = "h3">Products & Services</h3>
							
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">       
                                <HeaderTemplate>
                                    <ul class="category" style = " padding-top: 1px; list-style-type: square">
                                </HeaderTemplate>

                                <ItemTemplate>
                                    <li class="catAlign"><a href="site_prod_detail.aspx?id=<%# Eval("product_id") %>"><%# Eval("product_name") %></a></li>
                                </ItemTemplate>

                                  <FooterTemplate>
                                      </ul>
                                  </FooterTemplate>
                                </asp:Repeater>

                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT product_name, product_id FROM [products] ORDER BY product_name ASC"></asp:SqlDataSource>
						</div>
					</div>
				</div>
				<br>
		</div>   
    </div>
</asp:Content>

