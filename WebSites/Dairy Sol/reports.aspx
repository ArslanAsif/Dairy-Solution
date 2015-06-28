<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="reports.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="page-wrapper" style="height:93vh">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Reports <small></small>
                        </h1>
                    </div>
                </div>
				
				<div class="row">
                    <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_error">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <p>No report selected! Please choose a report from dropdown and click generate.</p>
                    </div>

                    <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label runat="server" ID="error"></asp:Label>
                    </div>

                    <br /><br />

					<div class="col-md-6 col-md-offset-3">
				        <div class="input-group input-group-lg">
					        <asp:DropDownList runat="server" ID="report_list" type="text" class="form-control" style="height: auto">
                                <asp:ListItem Value="-1" Selected="True">---Please select an option---</asp:ListItem>
                                <asp:ListItem Value="inv_report">Inventory</asp:ListItem>
                                <asp:ListItem Value="inv_minLevel_report">Inventory Min Level</asp:ListItem>
                                <asp:ListItem Value="product_expiry_report">Product Expiry</asp:ListItem>
                                <asp:ListItem Value="products_leastSold" >Unsold Products</asp:ListItem>
                                <asp:ListItem Value="inventory_in">Inventory IN</asp:ListItem>
                                <asp:ListItem Value="inv_out_report">Inventory OUT</asp:ListItem>
                            </asp:DropDownList>
                            <div class="input-group-btn">
                                <asp:Button runat="server" ID="select_report_btn" Text="Generate Report" class="btn btn-default" type="submit" OnClick="select_report_btn_Click"/>
                            </div>
						</div>
                    </div>
				</div>
                <!-- /.row -->
				
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
    </asp:Content>