<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="reports.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="page-wrapper">

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
					<div class="col-md-12">
						
						<h2>Balance Sheet</h2>
						<div style = " float: right; margin-top: -45px" class="btn-group" role="group">
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							  Type
							  <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
							  <li><a href="#">Balance Sheet</a></li>
							  <li><a href="#">Income Statement</a></li>
							  <li><a href="#">Cash Flow Statement</a></li>
							</ul>
						  </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="#">57</a></td>
                                        <td>Nov 1, 2014</td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">57</a></td>
                                        <td>Nov 1, 2014</td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">57</a></td>
                                        <td>Nov 1, 2014</td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">57</a></td>
                                        <td>Nov 1, 2014</td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">57</a></td>
                                        <td>Nov 1, 2014</td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">57</a></td>
                                        <td>Nov 1, 2014</td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">57</a></td>
                                        <td>Nov 1, 2014</td>
                                    </tr>
									<tr>
                                        <td><a href="#">57</a></td>
                                        <td>Nov 1, 2014</td>
                                    </tr>
                                    
                                </tbody>
                            </table>
							<div class="pull-right" style="margin-top: -25px;">
								<nav>
								  <ul class="pagination">
									<li><a href="#"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
									<li><a href="#">1</a></li>
									<li class="active"><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
								  </ul>
								</nav>
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