<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="site_cust_signup.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container opaque">	
		<div class = 'center'>
				<div class = 'row'>
                    <br />
                    <h2 style="text-align: center">Sign Up</h2>
					<br />
					<div class="col-md-9 col-md-offset-3 boxDesign">
							<form role="form" runat="server">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox ID="cust_su_inputFirstName" runat="server" type="text" class="form-control" placeholder="First Name"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:RequiredFieldValidator CssClass="validateAlign" ID="FnameRequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="cust_su_inputFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator CssClass="validateAlign reAlign" ID="FnameRegularExpressionValidator" runat="server" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Initials must be capital" ControlToValidate="cust_su_inputFirstName" ValidationExpression="([A-Z][a-z]*[ ]?)+$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
								<br/>

                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox ID="cust_su_inputLastName" runat="server" type="text" class="form-control" placeholder="Last Name"></asp:TextBox>
                                    </div>

                                    <div class="col-md-4">
                                        <asp:RequiredFieldValidator CssClass="validateAlign" ID="LnameRequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="cust_su_inputLastName" ForeColor="Red"></asp:RequiredFieldValidator>
								        <asp:RegularExpressionValidator CssClass="validateAlign reAlign" ID="LnameRegularExpressionValidator" runat="server" ForeColor="Red" ErrorMessage="Initials must be capital" ControlToValidate="cust_su_inputLastName" ValidationExpression="([A-Z][a-z]*[ ]?)+$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <br/>
                                
                                <div class="row">
                                    <div class="col-md-8">
								        <label>Gender:</label>&nbsp; &nbsp;<br/>
								        <label class="radio-inline">
                                            <asp:RadioButton ID="radioOptions1" runat="server" type ="radio"/>
                                            <input type="radio" name="radioOptions" value="member"> Male
								        </label>
								        <label class="radio-inline">
                                            <asp:RadioButton ID="radioOptions2" runat="server" type ="radio"/>
                                            <input type="radio" name="radioOptions" value="member"> Female
								        </label>
                                    </div>
                                </div>
								<br/><br/>

                                <div class="row">
                                    <div class="col-md-8">
								        <asp:TextBox ID="cust_su_inputEmail" runat="server" type="text" class="form-control" placeholder="Enter email address"></asp:TextBox>
                                    </div>

                                    <div class="col-md-4">
                                        <asp:RequiredFieldValidator CssClass="validateAlign" ID="EmailRequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="cust_su_inputEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator CssClass="validateAlign reAlign" ID="EmailRegularExpressionValidator" runat="server" ForeColor="Red" ErrorMessage="Invalid Email" ControlToValidate="cust_su_inputEmail" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"></asp:RegularExpressionValidator>
								    </div>
                                </div>
                                <br/>

                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox ID="cust_su_inputPass" runat="server" type="text" class="form-control" placeholder="Enter Password"></asp:TextBox>
                                    </div>

                                    <div class="col-md-4">
                                        <asp:RequiredFieldValidator CssClass="validateAlign" ID="PassRequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="cust_su_inputPass" ForeColor="Red"></asp:RequiredFieldValidator>
								    </div>
                                </div>
                                <br/>

                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox ID="cust_inputPass_cnfrm" runat="server" type="text" class="form-control" placeholder="Enter Password again"></asp:TextBox>
                                    </div>

                                    <div class="col-md-4">
                                        <asp:RequiredFieldValidator CssClass="validateAlign" ID="PassCnfrmRequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="cust_su_inputPass" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator CssClass="validateAlign reAlign" ID="PassCnfrmCompareValidator" runat="server" ErrorMessage="Password mismatch" ControlToValidate="cust_inputPass_cnfrm" ForeColor="Red" ControlToCompare="cust_su_inputPass" SetFocusOnError="True"></asp:CompareValidator>
								    </div>
                                </div>
                                <br/>

                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox ID="cust_su_inputCNIC" runat="server" type="text" class="form-control" placeholder="CNIC"></asp:TextBox>
                                    </div>

                                    <div class="col-md-4">
                                        <asp:RequiredFieldValidator CssClass="validateAlign" ID="CNICRequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="cust_su_inputCNIC" ForeColor="Red"></asp:RequiredFieldValidator>
								        <asp:RegularExpressionValidator CssClass="validateAlign reAlign" ID="CNICRegularExpressionValidator" runat="server" ForeColor="Red" ErrorMessage="Incorrect CNIC" ControlToValidate="cust_su_inputCNIC" ValidationExpression="^[\d]{5}-[\d]{7}-[\d]$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <br/>

                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox ID="cust_phone_number" runat="server" type="text" class="form-control" placeholder="Mobile Number"></asp:TextBox>
                                    </div>

                                    <div class="col-md-4">
                                        <asp:RequiredFieldValidator CssClass="validateAlign" ID="PnumRequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="cust_phone_number" ForeColor="Red"></asp:RequiredFieldValidator>
								    </div>
                                </div>
                                <br/>

                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox ID="cust_su_inputAddress" runat="server" type="text" class="form-control" placeholder="Address"></asp:TextBox>
								    </div>
                                </div>
                                <br/>
                                
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList ID="DropDownList1" runat="server" placeholder ="Secret Question" CssClass ="form-control">
                                            <asp:ListItem>What is your favourite pet&#39;s name?</asp:ListItem>
                                            <asp:ListItem>What is your favourite uncle&#39;s name?</asp:ListItem>
                                            <asp:ListItem>What is your hobby?</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <br/>

                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox ID="inputAnswer" runat="server" type="text" class="form-control" placeholder="Your Answer"></asp:TextBox>
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-md-8">
								        <label>Attach Picture</label>&nbsp; &nbsp;<asp:FileUpload ID="cust_image" runat="server" />
                                    </div>
                                </div>
                                <br/>

                                <div class="row">
                                    <div class="col-md-8">
								        <label>Date of birth :</label>
                                        <asp:TextBox ID="cust_su_inputDob" runat="server" type="date" class="form-control"></asp:TextBox><br />
                                    </div>

                                    <div class="col-md-4">
                                        <asp:RegularExpressionValidator CssClass="validateAlign reAlign" ID="DateRegularExpressionValidator" runat="server" ForeColor="Red" ErrorMessage="Incorrect Date Format" ControlToValidate="cust_su_inputDob" ValidationExpression="^[\d]{4}[-][\d]{2}[-][\d]{2}$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:Button ID="cust_signUp" runat="server" Text="Sign Up" style = "width: 100%" type = "submit" class = "btn btn-primary" OnClick="cust_signUp_Click"/>
							        </div>
                                </div>
                            </form>
						</div>
				</div>
		</div>  
    </div>		
	<br/><br/>
</asp:Content>