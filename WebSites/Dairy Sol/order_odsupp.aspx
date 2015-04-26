<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" enableEventValidation="false" CodeFile ="order_odsupp.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
    <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Place Order <small>Supplier</small>
                        </h1>
                    </div>
                </div>
        
        <form class="form-group">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <br />

                    <asp:TextBox ID="supplier_name" runat="server" type="text" class="form-control control-height" placeholder="Supplier Name"></asp:TextBox>
					<br/>
                    <asp:TextBox class="form-control control-height" id="product_id" runat="server" name="product_id" placeholder="Product ID or Name"/><br />
                    <asp:TextBox class="form-control control-height" id="prod_quantity" runat="server" name="quantity" placeholder="Quantity"/><br />
                    <asp:TextBox class="form-control control-height" id="order_date" type="date" runat="server" name="date" placeholder="Date"/><br />
                    
                    <asp:Button ID="Button1" runat="server" Width ="100%" Text="Submit Order" CssClass="btn btn-primary pull-right" OnClick="Button1_Click" />
                </div>
            </div>
            <br />
        </form>
				
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>