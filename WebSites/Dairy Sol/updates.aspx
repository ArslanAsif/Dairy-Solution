<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="updates.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    		<div class="container opaque">
		<div class = 'center'>
			<h2>News & Updates</h2>
			<div style = "margin-top: -15px">
				<div class = 'row'>
					<div class="col-md-9 boxDesign">
				
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">       
                     
                        <HeaderTemplate>
                            <table>
                        </HeaderTemplate>

                      <ItemTemplate>
                      <tr>
                         <div class="col-md-12 boxDesign">
				            <h3 class = "h3"><%# Eval("heading") %></h3><br>
                            <div class="col-md-4 boxDesign">
				                <img src="<%# Eval("picture") %>" width="150px" height="150px">
			                </div>
                            <div class="col-md-8 boxDesign">
				                <p runat="server" id="parag"><%# Eval("detail") %></p>
                            </div>
			             </div>
                      </tr>
                      </ItemTemplate>

                    <AlternatingItemTemplate>
                    <tr>
                        <div class="col-md-12 boxDesign">
				            <h3 class = "h3"><%# Eval("heading") %></h3><br>
                            <div class="col-md-4 boxDesign">
				                <img src="<%# Eval("picture") %>" width="150px" height="150px">
			                </div>
                            <div class="col-md-8 boxDesign">
				                <p runat="server" id="parag"><%# Eval("detail") %></p>
                            </div>
			             </div>
                    </tr>
                   </AlternatingItemTemplate>

                  <FooterTemplate>
                      </table>
                  </FooterTemplate>
              </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT * FROM [posts]"></asp:SqlDataSource>
    
				</div>
					<div class="col-md-3 boxDesign">
						<h3 class = "flatBox flat">Archive</h3>
						<ul class="category">
							<li class="catAlign"><a href="#">Update 10</a></li>
							<li class="catAlign"><a href="#">Update 9</a></li>
							<li class="catAlign"><a href="#">Update 8</a></li>
							<li class="catAlign"><a href="#">Update 7</a></li>
							<li class="catAlign"><a href="#">Update 6</a></li>
							<li class="catAlign"><a href="#">Update 5</a></li>
							<li class="catAlign"><a href="#">Update 4</a></li>
							<li class="catAlign"><a href="#">Update 3</a></li>
							<li class="catAlign"><a href="#">Update 2</a></li>
							<li class="catAlign"><a href="#">Update 1</a></li>
						</ul>
					</div>	
				</div>
				<!--end of row-->	

                <nav  style = "float: right">
					<ul class="pagination">
					<li class="disabled"><a href="#" aria-label="Previous">&laquo;</span></a></li>
					<li class="active"><a href="#">1 </a></li>
					<li class=""><a href="#">2</a></li>
					<li class=""><a href="#" aria-label="Next">&raquo;</span></a></li>
					</ul>
				</nav>
				</div>
			</div>
		</div>  
    </div>
</asp:Content>

