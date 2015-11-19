<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="site_products.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    	
<div class="container opaque">
<div class = 'center'>
    <form runat="server">
    <h2>Our Products & Services</h2>
           
	<div style="margin-top: -15px">
		<div class = 'row'>
                     
			<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">       
                <HeaderTemplate>
                    <table>
                </HeaderTemplate>


          <ItemTemplate>
          <tr>
            <div class="col-md-4 boxDesign">
                <h2 class = "h3"><%# Eval("product_name") %></h2><br>
                <div class="pBox" style = "margin-top: -20px;height: 390px">
	                <img class="img_border" src="<%# Eval("picture") %>" alt="Image Not Available" width="100%" height="240px"></img>
                    <br/><br/><asp:Label id="change_text" runat="server" class="boxAlign" style = "margin-top: 5px; text-align: center; position: absolute; padding-right: 10px" ></asp:Label>
	                <br/>
                    <div class="btnAlign" style="margin-top:60px">
		                <button class = "btn btn-success pdBtn" formaction="site_prod_detail.aspx?id=<%# Eval("product_id") %>">&nbsp;View Details</button>
		                <asp:Button id = "order_btn" cssClass = "btn btn-primary pdBtn" runat="server" CommandArgument='<%# Eval("product_id") %>' onClick="check_user" Text="Order now"></asp:Button>
	                </div>
                </div>
            </div>
            
          </tr>
          </ItemTemplate>


          <FooterTemplate>
              </table>
          </FooterTemplate>
      </asp:Repeater>

        
				</div>
				<br/>
				
		<div style="overflow: hidden;">
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
        </form>
		</div> 
    </div>
</asp:Content>