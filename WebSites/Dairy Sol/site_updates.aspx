<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="site_updates.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <form runat="server">
	    <h2>News & Updates</h2>
	    <div style = "margin-top: -15px">
		    <div class = 'row'>
			    <div class="col-md-9 boxDesign">
                    <asp:Repeater ID="Repeater3" runat="server" EnableViewState="False">
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
                    
                    <br /><br />
                             
                    <div>
                    <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand" OnItemDataBound="rptPaging_ItemDataBound">
                        <HeaderTemplate><ul class="pagination" style="margin-top: 0px; float: right"></HeaderTemplate>
                        <ItemTemplate>
                            
                            <li>
                                <asp:LinkButton ID="btnPage"
                                        
                                    CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                    runat="server"><%# Container.DataItem %>
                                </asp:LinkButton>
                            </li>
                            
                       </ItemTemplate>
                        <FooterTemplate></ul></FooterTemplate>
                    </asp:Repeater>
                    </div>
                    

			    </div>

			    <div class="col-md-3 boxDesign">
				    <h3 class = "flatBox flat">Archive</h3>
                        
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
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

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT heading, post_id FROM [posts] ORDER BY heading ASC"></asp:SqlDataSource>
			    </div>	
		    </div>
		    <!--end of row-->	
	    </div>
        </form>
    </div>
</asp:Content>

