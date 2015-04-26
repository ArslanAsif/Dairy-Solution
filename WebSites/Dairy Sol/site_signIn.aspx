<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="site_signIn.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container opaque">	
		<div class = 'center'>
				<div class = 'row'>
					<div class="col-md-4 col-md-offset-4 boxDesign">
						<div style="margin-top: 20%"">
							<h2 style="text-align: center">Sign In</h2>
							<br/>
							<form role="form">
                                <asp:TextBox ID="inputEmail" runat="server" style="width: 98%" type="email" class="form-control" placeholder="Enter email address"></asp:TextBox>
								<br/>
                                <asp:TextBox ID="inputPass" runat="server" type="password" style="width: 98%" class="form-control" placeholder="Enter Password"></asp:TextBox>
                                <br/>
                                <asp:Label ID="forgot_pass" runat="server" class ="pull-right"><a href='site_forgot_pass.aspx'>Forgot Password</a></asp:Label>
                                <br/>
								
                                <asp:RadioButtonList ID="radioOptions1" runat="server" RepeatLayout="Flow" class ="radio-inline">
                                    <asp:ListItem Value="Member">Member</asp:ListItem>
                                    <asp:ListItem Value="Employee">Employee</asp:ListItem>
                                </asp:RadioButtonList>
                                
								<div>
                                <asp:Button ID="signIn" runat="server" Text="Sign in" style="margin-top: -45px; margin-right: 6px" type="submit" class="btn btn-primary pull-right" name="signInBtn" OnClick="SignIn_Click"/>
								</div>

							</form>
							<br/>
                            <a href="site_cust_signup.aspx" class = "btn btn-success" style = "width: 98%; margin-left: 2px;">Not a member? Sign Up here</a>
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

