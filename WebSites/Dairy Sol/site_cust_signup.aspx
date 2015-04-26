<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="site_cust_signup.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container opaque">	
		<div class = 'center'>
				<div class = 'row'>
					<div class="col-md-4 col-md-offset-4 boxDesign">
						<div style="margin-top: 10%"">
							<h2 style="text-align: center">Sign Up</h2>
							<br/>
							<form role="form">
                                <asp:TextBox ID="cust_su_inputFirstName" runat="server" style="width: 98%" type="text" class="form-control" placeholder="First Name"></asp:TextBox>
								<br/>
                                <asp:TextBox ID="cust_su_inputLastName" runat="server" style="width: 98%" type="text" class="form-control" placeholder="Last Name"></asp:TextBox>
								<br/>
                                
								<label>Gender:</label>&nbsp; &nbsp;<br/>
								<label class="radio-inline">
                                    <asp:RadioButton ID="radioOptions1" runat="server" type ="radio"/>
                                    <input type="radio" name="radioOptions" value="member" checked = "checked"> Male
								</label>
								<label class="radio-inline">
                                    <asp:RadioButton ID="radioOptions2" runat="server" type ="radio"/>
                                    <input type="radio" name="radioOptions" value="member" checked = "checked"> Female
								</label>
								<br/><br/>
								<asp:TextBox ID="cust_su_inputEmail" runat="server" style="width: 98%" type="text" class="form-control" placeholder="Enter email address"></asp:TextBox>
								<br/>
                                <asp:TextBox ID="cust_su_inputPass" runat="server" style="width: 98%" type="text" class="form-control" placeholder="Enter Password"></asp:TextBox>
								<br/>
                                <asp:TextBox ID="cust_inputPass_cnfrm" runat="server" style="width: 98%" type="text" class="form-control" placeholder="Enter Password again"></asp:TextBox>
								<br/>
                                <asp:TextBox ID="cust_su_inputCNIC" runat="server" style="width: 98%" type="text" class="form-control" placeholder="CNIC"></asp:TextBox>
								<br/>
                                <asp:TextBox ID="cust_phone_number" runat="server" style="width: 98%" type="text" class="form-control" placeholder="Mobile Number"></asp:TextBox>
								<br/>
                                <asp:TextBox ID="cust_su_inputAddress" runat="server" style="width: 98%" type="text" class="form-control" placeholder="Address"></asp:TextBox>
								<br/>
                                <asp:DropDownList ID="DropDownList1" runat="server" placeholder ="Secret Question" CssClass ="form-control" Width ="98%">
                                    <asp:ListItem>What is your favourite pet&#39;s name?</asp:ListItem>
                                    <asp:ListItem>What is your favourite uncle&#39;s name?</asp:ListItem>
                                    <asp:ListItem>What is your hobby?</asp:ListItem>
                                </asp:DropDownList>
                                <br/>
                                <asp:TextBox ID="inputAnswer" runat="server" type="text" style="width: 98%" class="form-control" placeholder="Your Answer"></asp:TextBox>
                                <br />
								<label>Attach Picture</label>&nbsp; &nbsp;<asp:FileUpload ID="cust_image" runat="server" />
                                <br/>
								<label>Date of birth :</label>
                                <asp:TextBox ID="cust_su_inputDob" runat="server" style="width: 98%" type="date" class="form-control"></asp:TextBox><br />
                                <asp:Button ID="cust_signUp" runat="server" Text="Sign Up" style = "width: 98%; margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="cust_signUp_Click"/>
                                
							</form>
						</div>
					</div>
				</div>
		</div>  
    </div>		
	<br/><br/>
</asp:Content>