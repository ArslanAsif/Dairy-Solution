<%@ Page Title="" Language="C#" MasterPageFile="~/receptionist/MasterRecept.master" AutoEventWireup="true" enableEventValidation="false" CodeFile="emp_edit_myprofile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper" style="height: 92.5vh">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Edit Profile <small>(<asp:Label runat="server" id="emp_name"></asp:Label>)</small>
                    </h1>
                </div>
            </div>
				
            <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <p>Profile Successfully Updated!</p>
            </div>

            <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <asp:Label runat="server" ID="error"></asp:Label>
            </div>

            <form role="form">
				<div class = 'row'>
                    <div class="col-md-2 col-md-offset-2">
                        <h3>Change Picture</h3><hr />
                        <br/>
                        <asp:Image ID="emp_img" runat="server" width="250" Height="250"/><br/>
                        <label>Attach Picture</label>&nbsp; &nbsp;<asp:FileUpload ID="empl_image" runat="server" />
                        <asp:Button runat="server" ID="load_pic" cssClass="btn btn-xs btn-primary" onclick="load_pic_Click" Text="Upload"/>                        
                        <br/>
                    </div>

					<div class="col-md-5 col-md-offset-1">
						<div>
							<h3>Change Password</h3><hr />
							<br/>
							
                            <label>Old Password: </label>
                            <asp:TextBox ID="emp_pass" runat="server" type="password" class="form-control control-height"></asp:TextBox>
							<br/>

                            <label>New Password: </label>
                            <asp:TextBox ID="new_pass1" runat="server" type="password" class="form-control control-height"></asp:TextBox>
							<br/>

                            <label>Rewrite New Password: </label>
                            <asp:TextBox ID="new_pass2" runat="server" type="password" class="form-control control-height"></asp:TextBox>
							<br/><br />

                            <asp:Button ID="update_info" runat="server" OnClick="update_info_Click" Text="Update" style = "width: 100%" type = "submit" class = "btn btn-primary" />
                                
						</div>
					</div>		
				</div>
            </form>
        </div>
    </div>
</asp:Content>

