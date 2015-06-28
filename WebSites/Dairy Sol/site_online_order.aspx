<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="site_online_order.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
		<div class="container opaque">
			
            <div class = 'row'>
				<div class = "col-md-12">
					<h3 class = "h3">Order Details</h3>
                    <br/>
                    <label id="customer_name" runat="server"><strong>Customer Name: </strong></label><asp:Label style="padding-left:53px" ID="name_txt" runat="server"></asp:Label><br>
					<label id="total_products" runat="server"><strong>Total Products: </strong></label><asp:Label style="padding-left:60px" ID="total_prd_text" runat="server"></asp:Label><br>
					<label id="date_time" runat="server"><strong>Date and Time: </strong></label><asp:Label style="padding-left:62px" ID="time_txt" runat="server"></asp:Label><br>
                    <label id="total_amount" runat="server"><strong>Total Amount Payable: </strong></label><asp:Label style="padding-left:10px" ID="amount_txt" runat="server"></asp:Label><br>
				</div>
			</div>

			<div class = 'row'>
				<div class = "col-md-12">
					<h3 class = "h3">Payment Method</h3>
					<div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class=""></i>Payment Info</h3>
                    </div>

                    <div class="panel-body" >
				        <label class = "col-md-2 control-label">Payment Method</label>
				        <div class = "col-md-4">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control control-height">
                                <asp:ListItem>--Please Choose--</asp:ListItem>
                                <asp:ListItem>Cheque</asp:ListItem>
                                <asp:ListItem>Cash</asp:ListItem>
                            </asp:DropDownList>
					    </div>
				        <label class = "col-md-2 control-label">Amount Payable</label>
				        <div class = "col-md-4">
					        <asp:TextBox ID ="total" runat="server" CssClass="form-control control-height"></asp:TextBox><br/>
				        </div>
                        <div class = "col-md-4 col-md-offset-8">
					        <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="submit_Click" />
				        </div>
				    </div>
                </div>
					
				</div>
			</div>
		</div> 
		</div>
    </form>
	<br>
</asp:Content>