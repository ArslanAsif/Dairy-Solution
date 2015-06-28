<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="site_signIn.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
            $('.input-validation-error').parents('.form-group').addClass('has-error');
            $('.field-validation-error').addClass('text-danger');
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container opaque">	
		<div class = 'center'>
				<div class = 'row'>
					<div class="col-md-4 col-md-offset-4 boxDesign">
						<div style="margin-top: 20%"">
							<h2 style="text-align: center">Sign In</h2>
							<br/>

							<form role="form" runat="server" id="signIn_form">
                                <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>

                                <div class="input-group">
                                  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user"></i></span>
                                  <input type="email" class="form-control" runat="server" required="required" ID="inputEmail" placeholder="Email Address" aria-describedby="sizing-addon1">
                                </div>
                                <asp:RegularExpressionValidator ID="EmailExpressionValidator" runat="server" ForeColor="Red" ErrorMessage="Email Incorrect" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" ControlToValidate="inputEmail"></asp:RegularExpressionValidator>
                                <br/>

                                <div class="input-group">
                                  <span class="input-group-addon" id="sizing-addon2"><i class="fa fa-lock"></i></span>
                                  <input ID="inputPass" runat="server" required="required" type="password" class="form-control" placeholder="Enter Password" aria-describedby="sizing-addon2">
                                </div>
                                <br/>
                                <asp:Label ID="err_msg" runat="server"></asp:Label>
                                <asp:Label ID="forgot_pass" runat="server" class ="pull-right"><a href='site_forgot_pass.aspx'>Forgot Password</a></asp:Label>
                                <br/><br />
								
								<div>
                                    <a href="site_cust_signup.aspx" class = "btn btn-lg btn-success  pull-left" style = "margin: 0px; width: 48%">Sign Up</a>
                                    <asp:Button ID="signIn" runat="server" Text="Sign in" style="margin: 0px; width: 48%" type="submit" class="btn btn-lg btn-primary pull-right" name="signInBtn" OnClick="SignIn_Click"/>
								</div>

							</form>
							
						</div>
					</div>
					
				</div>
		</div>  
    </div>

    <style>
        #footer{
            margin-top: -40px;
            bottom: 0; 
            position: fixed;
        }
    </style>
</asp:Content>

