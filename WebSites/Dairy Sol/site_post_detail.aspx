<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="site_post_detail.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
	    <h2>News & Updates</h2>
	    <div style = "margin-top: -15px">
		    <div class = 'row'>
			    <div class="col-md-9 boxDesign">
                    <div class="col-md-12 boxDesign">
                        <h3 runat="server" id="heading" class="h3"></h3><br>
                        <div class="col-md-4 boxDesign">
                            <asp:Image ID="post_image" runat="server" width="100%"/>
			            </div>
                        <div class="col-md-8 boxDesign">
				            <p runat="server" id="parag"></p>
                        </div>
			        </div>     
			    </div>

			    <div class="col-md-3 boxDesign">
				    <h3 class = "flatBox flat">Archive</h3>
                        
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="category" style="list-style-type: square">
                        </HeaderTemplate>

                        <ItemTemplate>
                            <li class="catAlign"><a href="site_post_detail.aspx?id=<%# Eval("post_id") %>"><%# Eval("heading") %></a></li>
                        </ItemTemplate>
                  
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT post_id, heading FROM [posts] ORDER BY heading ASC"></asp:SqlDataSource>
			    </div>	
		    </div>
		    <!--end of row-->	
	    </div>
    </div>
</asp:Content>