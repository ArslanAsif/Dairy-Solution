<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="messages.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
        <div class="container-fluid">
             <!-- Page Heading -->
            <div class="row">
                <div class="col-md-4">
                    <h1 class="page-header">
                        Messages <small></small>
                    </h1>
                </div>
                    
                <!--search table-->
                <div class="col-md-4 col-md-offset-4">
				    <div class="input-group" style="margin-top: 55px">
					
					    <input type="text" class="form-control control-height" placeholder="Search" name="srch-term" id="srch-term">
					    <div class="input-group-btn">
						    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
					    </div>
				    </div>
                </div>
            </div>

            <div>
                <div class="list-group" style="cursor: pointer; cursor: hand">
                    <div class="list-group-item" data-toggle="modal" data-target="#messagesModal">
                        <div class="media">
                            <button type="button" class="close"><span>&times;</span></button>
                            <div class="media-left">
                            <a href="">
                                <img class="media-object" src="images\profile_default.jpg" alt="" width="65px" height="65px">
                            </a>
                            </div>
                            <div class="media-body" style="padding-right: 75px">
                            <h4 class="media-heading">Khalid Mansoor <span class="badge">New</span></h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                            </div>
                        </div>
                    </div>

                    <div class="list-group-item" data-toggle="modal" data-target="#messagesModal">
                        <div class="media">
                            <button type="button" class="close"><span>&times;</span></button>
                            <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="images\profile_default.jpg" alt="" width="65px" height="65px">
                            </a>
                            </div>
                            <div class="media-body" style="padding-right: 75px">
                            <h4 class="media-heading">Abdul Wahab</h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
