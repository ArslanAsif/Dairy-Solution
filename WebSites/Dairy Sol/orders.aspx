<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Balance Sheet<small>(Attendance)</small>
                        </h1>
                    </div>
                </div>
                
                <div class="row">
					<div class="col-lg-9">
						<h2>October 2014</h2>
					</div>
					<div class="col-lg-3" style="bottom: 10px">
						<div class="pull-right">
							<form role="search">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
									<div class="input-group-btn">
										<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-lg-3" style="bottom: 5px">
						<a href="#" class="btn btn-primary pull-right">Edit Attendance</a>
					</div>
				</div>
				<div class="row">	
					<div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Sr #</th>
                                        <th>Name</th>
                                        <th>Absentees This Month</th>
                                        <th>Attendance This Month</th>
										<th>Overall Attendance</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>23</td>
                                        <td>Amir Yasin</td>
                                        <td>2</td>
                                        <td>93%</td>
										<td>93%</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Yasin Anwar</td>
                                        <td>4</td>
                                        <td>75%</td>
										<td>93%</td>
                                    </tr>
                                    <tr>
                                        <td>13</td>
                                        <td>Asad Butt</td>
                                        <td>6</td>
                                        <td>70%</td>
										<td>93%</td>
                                    </tr>
                                    <tr>
                                        <td>31</td>
                                        <td>Ali Irtaza</td>
                                        <td>3</td>
                                        <td>80%</td>
										<td>93%</td>
                                    </tr>
                                    <tr>
                                        <td>16</td>
                                        <td>Aslam Rais</td>
                                        <td>2</td>
                                        <td>93%</td>
										<td>93%</td>
                                    </tr>
                                    <tr>
                                        <td>27</td>
                                        <td>Iqra Amjad</td>
                                        <td>4</td>
                                        <td>75%</td>
										<td>93%</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Mustajab Ramzan</td>
                                        <td>5</td>
                                        <td>93%</td>
										<td>93%</td>
                                    </tr>
									<tr>
                                        <td>16</td>
                                        <td>Aslam Rais</td>
                                        <td>2</td>
                                        <td>93%</td>
										<td>93%</td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
				</div>
                <!-- /.row -->
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<nav>
						  <ul class="pagination">
							<li><a href="#"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
							<li><a href="#">Jan</a></li>
							<li><a href="#">Feb</a></li>
							<li><a href="#">Mar</a></li>
							<li><a href="#">Apr</a></li>
							<li><a href="#">May</a></li>
							<li><a href="#">Jun</a></li>
							<li><a href="#">Jul</a></li>
							<li><a href="#">Aug</a></li>
							<li><a href="#">Sep</a></li>
							<li class="active"><a href="#">Oct</a></li>
							<li><a href="#">Nov</a></li>
							<li><a href="#">Dec</a></li>
							<li><a href="#"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
						  </ul>
						</nav>
					</div>
					<div class = "col-md-2">
						<div class = "pull-right">
							<div class="btn-group dropup" style = "margin-bottom: -55px;">
							  <button type="button" class="btn btn-default">Select Year</button>
							  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								<span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu" role="menu">
								<li><a>2015</a></li>
								<li><a>2014</a></li>
								<li><a>2013</a></li>
							  </ul>
							</div>
						</div>
					</div>
				</div>
				
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

</asp:Content>