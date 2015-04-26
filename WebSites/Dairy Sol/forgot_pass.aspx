<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="forgot_pass.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container opaque">
    	
		<div class = 'center'>
				<div class = 'row'>
					<div class="col-md-4 col-md-offset-4 boxDesign">
						<div style="margin-top: 20%"">
							<h2 style="text-align: center">Forgot Password</h2>
							<br/>
							<form class="form-group">
                                <asp:TextBox ID="email_id" runat="server" type="text" class="form-control" placeholder="Email ID"></asp:TextBox><br />
                                <asp:Label ID="secret_question" class="form-control" runat="server" Text="" Visible ="false" EnableViewState="False"></asp:Label>
                                <br/>
                                <asp:TextBox ID="secret_answer" class="form-control" runat="server" Text="" Visible ="false" EnableViewState="False"></asp:TextBox>
                                <br/>
                                <asp:Button ID="search_btn" runat="server" CssClass ="btn btn-primary pull-right" onclick="forgot_pass_btn_Click" Text="Search Email"/>
                                <asp:RadioButtonList ID="radioOptions1" runat="server" RepeatLayout="Flow" class ="radio-inline">
                                <asp:ListItem Value="Member">Member</asp:ListItem>
                                <asp:ListItem Value="Employee">Employee</asp:ListItem>
                                </asp:RadioButtonList>
                                <br/>
                                <br/>
                                <asp:Button id ="submit_btn" runat="server" class="btn btn-primary form-control" type="button" enableviewstate="false" visible="false" onclick="submit_btn_click" Text="Submit Answer"></asp:Button>
							
                                <asp:Label ID="pass_reveal" runat="server" EnableViewState="False" Visible="False" Font-Bold="True" Font-Size="Large"></asp:Label>
                            </form>
                        </div>
                        
					</div>
					
				</div>
            
		</div>
      
    </div>

    <style>
        #footer {
            margin-top: -40px;
            bottom: 0;
            position: fixed;
        }
      
    </style>
</asp:Content>