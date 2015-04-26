<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="order_add.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Add Order <small>Customer</small>
                        </h1>
                    </div>
                </div>

                <form class="form-group">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4">
                                <br />
                                <asp:TextBox ID ="customer_id" runat="server" CssClass="form-control control-height" placeholder="Customer ID"></asp:TextBox>
						        <br/>
                                <asp:TextBox ID="employee_id" runat="server" type="text" class="form-control control-height" placeholder="Employee ID"></asp:TextBox>
						        <br/>
                                <asp:TextBox ID="date" runat="server" type="date" class="form-control control-height" placeholder="Date"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="product_id" runat="server" type="text" class="form-control control-height" placeholder="Product ID"></asp:TextBox>
                                <br />
							    <asp:TextBox ID="product_quantity" runat="server" type="text" class="form-control control-height" placeholder="Product Quantity"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="product_description" runat="server" type="text" class="form-control control-height" placeholder="Product Desription"></asp:TextBox>
							    <br/>
                                <asp:TextBox ID="services" runat="server" type="text" class="form-control control-height" placeholder="Services"></asp:TextBox>
							    <br/>
                                <asp:Button ID="add_order" runat="server" Width="100%" Text="Submit Order" style = "margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="add_order_Click"/>
                        </div>
                    </div>
                    <br />
                </form>	
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>

