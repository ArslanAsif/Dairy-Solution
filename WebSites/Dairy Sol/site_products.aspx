<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="site_products.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    	
<div class="container opaque">
<div class = 'center'>
			
    <h2>Our Products & Services</h2>
           
	<div style="margin-top: -15px">
		<div class = 'row'>
                     
			<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">       
                <HeaderTemplate>
                    <table>
                </HeaderTemplate>

          <ItemTemplate>
          <tr>
              <div class="col-md-4 boxDesign">
						<h2 class = "h3"><%# Eval("product_name") %></h3><br>
						<div class="pBox" style = "margin-top: -20px">
							<img class="img_border" src="<%# Eval("picture") %>" alt="Image Not Available" width="100%" height="240px"></img>
                            <br/><br/><p id="change_text" runat="server" class="boxAlign" style = "margin-top: 5px; text-align: center" ><%# Eval("description") %></p>
							<br/>
                            <div class="btnAlign">
								<button class = "btn btn-success pdBtn" formaction="site_prod_detail.aspx?id=<%# Eval("product_id") %>"><span class = "glyphicon glyphicon-list"></span>&nbsp;View Details</button>
								<button class = "btn btn-primary pdBtn" formaction="#"><span class = "glyphicon glyphicon-shopping-cart"></span>&nbsp;Order now</button>
							</div>
						</div>
			</div>
            
          </tr>
          </ItemTemplate>

          <AlternatingItemTemplate>
                <tr>
                     <div class="col-md-4 boxDesign">
						<h2 class = "h3"><%# Eval("product_name") %></h3><br>
						<div class="pBox" style = "margin-top: -20px">
							<img class="img_border" src="<%# Eval("picture") %>" alt="Image Not Available" width="100%" height="240px"></img>
							<br><br><p class="boxAlign" style = "margin-top: 5px; text-align: center"><%# Eval("description") %></p>
							<br>
							<div class="btnAlign">
								<button class = "btn btn-success pdBtn" formaction="site_prod_detail.aspx?id=<%# Eval("product_id") %>"><span class = "glyphicon glyphicon-list"></span>&nbsp;View Details</button>
								<button class = "btn btn-primary pdBtn" formaction="#"><span class = "glyphicon glyphicon-shopping-cart"></span>&nbsp;Order now</button>
							</div>
						</div>
					</div>
                </tr>
          </AlternatingItemTemplate>

          <FooterTemplate>
              </table>
          </FooterTemplate>
      </asp:Repeater>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT * FROM [products]"></asp:SqlDataSource>
    
				</div>
				<br/>
				
		<nav  style = "float: right">
			<ul class="pagination">
			<li class="disabled"><a href="#" aria-label="Previous">&laquo;</a></li>
			<li class="active"><a href="#">1 </a></li>
			<li class=""><a href="#">2</a></li>
			<li class=""><a href="#" aria-label="Next">&raquo;</a></li>
			</ul>
		</nav>
			</div>
		</div> 
    </div>
</asp:Content>