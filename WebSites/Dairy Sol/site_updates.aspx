<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="site_updates.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
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
				                    <img src="<%# Eval("picture") %>" width="100%">
			                    </div>
                                <div class="col-md-8 boxDesign">
				                    <p runat="server" id="parag"><%# Eval("detail") %></p>
                                </div>
			                </div>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                        
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT * FROM [posts]"></asp:SqlDataSource>

                    <nav  style = "float: right">
					    <ul class="pagination">
					    <li class="disabled"><a href="#" aria-label="Previous">&laquo;</span></a></li>
					    <li class="active"><a href="#">1 </a></li>
					    <li class=""><a href="#">2</a></li>
					    <li class=""><a href="#" aria-label="Next">&raquo;</span></a></li>
					    </ul>
				    </nav>
			    </div>

			    <div class="col-md-3 boxDesign">
				    <h3 class = "flatBox flat">Archive</h3>
                        
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="category" style="list-style-type: square">
                        </HeaderTemplate>

                        <ItemTemplate>
                            <li class="catAlign"><a href="#"><%# Eval("heading") %></a></li>
                        </ItemTemplate>
                  
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT heading FROM [posts] ORDER BY heading ASC"></asp:SqlDataSource>
			    </div>	
		    </div>
		    <!--end of row-->	
	    </div>
    </div>
</asp:Content>

