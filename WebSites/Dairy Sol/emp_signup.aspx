<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" enableEventValidation="false" AutoEventWireup="true" CodeFile="emp_signup.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .validateAlign {
            position:absolute;
            margin-top: -1px;
        }
    </style>    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="page-wrapper">
    <div class="container-fluid">	
		<div class = 'center'>
            <h2 style="text-align: center">Add/Update Employee Info</h2>
            <form role="form">
				<div class = 'row'>

                    <div class="col-md-4 col-md-offset-2 col-sm-6 col-sm-offset-3">
                        <br/><br/>
                        <asp:Image ID="emp_img" runat="server" width="250" Height="250"/><br/>
                        <label>Attach Picture</label>&nbsp; &nbsp;<asp:FileUpload ID="empl_image" runat="server" />
                        <asp:Button runat="server" cssClass="btn btn-xs btn-primary" OnClick="changePic" Text="Upload"/>                        
                        <br/>
                    </div>

					<div class="col-md-4 col-sm-12 boxDesign">
						<div style="margin-top: 20px">
							
							<br/>
							
                                <label>Name: </label>
                                <asp:TextBox ID="empl_Name" runat="server" style="width: 100%" height="100%" type="text" class="form-control" placeholder="First Name"></asp:TextBox>
                                <div style="float:left">
                                    <asp:RequiredFieldValidator CssClass="validateAlign" ID="FnameRequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="empl_Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator CssClass="validateAlign reAlign" ID="FnameRegularExpressionValidator" runat="server" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Initials must be capital" ControlToValidate="empl_Name" ValidationExpression="([A-Z][a-z]*[ ]?)+$"></asp:RegularExpressionValidator>
								</div>
                                <br/>

                                <label>Email Id: </label>
								<asp:TextBox ID="empl_Email" runat="server" style="width: 100%" height="100%" type="text" class="form-control"></asp:TextBox>
                                <div style="float:left">
                                    <asp:RequiredFieldValidator CssClass="validateAlign" ID="EmailRequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="empl_Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator CssClass="validateAlign reAlign" ID="EmailRegularExpressionValidator" runat="server" ForeColor="Red" ErrorMessage="Invalid Email" ControlToValidate="empl_Email" ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"></asp:RegularExpressionValidator>
								</div>
                                <br/>
                                
                                <label>Password: </label>
                                <asp:TextBox ID="empl_Pass" runat="server" style="width: 100%" height="100%" type="text" class="form-control"></asp:TextBox>
                                <div style="float:left">
                                    <asp:RequiredFieldValidator CssClass="validateAlign" ID="PassRequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="empl_Pass" ForeColor="Red"></asp:RequiredFieldValidator>
								</div>
                                <br/>
                                
                                <label>CNIC: </label>
                                <asp:TextBox ID="empl_CNIC" runat="server" style="width: 100%" height="100%" type="text" class="form-control"></asp:TextBox>
                                <div style="float:left">
                                    <asp:RequiredFieldValidator CssClass="validateAlign" ID="CNICRequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="empl_CNIC" ForeColor="Red"></asp:RequiredFieldValidator>
								    <asp:RegularExpressionValidator CssClass="validateAlign reAlign" ID="CNICRegularExpressionValidator" runat="server" ForeColor="Red" ErrorMessage="Incorrect CNIC" ControlToValidate="empl_CNIC" ValidationExpression="^[\d]{5}-[\d]{7}-[\d]$"></asp:RegularExpressionValidator>
								</div>
                                <br/>
                                <label>Marital Status: </label>
                                <asp:TextBox ID="empl_marital_status" runat="server" style="width: 100%" height="100%" type="text" class="form-control"></asp:TextBox>
                                <br />
                                <label>Number Of Children: </label>
                                <asp:TextBox ID="empl_no_children" runat="server" style="width: 100%" height="100%" type="text" class="form-control" ></asp:TextBox>
                                <br/>
                                <label>Number of Siblings: </label>
                                <asp:TextBox ID="empl_no_siblings" runat="server" style="width: 100%" height="100%" type="text" class="form-control" ></asp:TextBox>
                                <br/>
                                <label>Phone Number: </label>
                                <asp:TextBox ID="empl_phone_number" runat="server" style="width: 100%" height="100%" type="text" class="form-control"></asp:TextBox>
                                <div style="float:left">
                                    <asp:RequiredFieldValidator CssClass="validateAlign" ID="RequiredFieldValidator" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="empl_phone_number" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <br/>
                                
                                <label>Moblile Number: </label>
                                <asp:TextBox ID="empl_mobile_number" runat="server" style="width: 100%" height="100%" type="text" class="form-control"></asp:TextBox>
                                <div style="float:left">
                                    <asp:RequiredFieldValidator CssClass="validateAlign" ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="empl_mobile_number" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <br />
                                
                                <label>Current Address: </label>
					            <asp:TextBox ID ="empl_addr" runat="server" style="width: 100%" height="100%" type="text" class="form-control"></asp:TextBox>
                                <div style="float:left">
                                    <asp:RequiredFieldValidator CssClass="validateAlign" ID="RequiredFieldValidator2" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="empl_addr" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <br/>    

                                <label>City: </label>
                                <asp:TextBox ID="empl_city" runat="server" style="width: 100%" height="100%" type="text" class="form-control"></asp:TextBox>
								<div style="float:left">
                                    <asp:RequiredFieldValidator CssClass="validateAlign" ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="empl_city" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <br/>    

				                <label>Province: </label>
					            <asp:TextBox ID ="empl_province" runat="server" style="width: 100%" height="100%" type="text" class="form-control"></asp:TextBox>
                                <div style="float:left">
                                    <asp:RequiredFieldValidator CssClass="validateAlign" ID="RequiredFieldValidator5" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="empl_province" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <br/>    

								<label>Date of birth :</label>
                                <asp:TextBox ID="empl_Dob" runat="server" style="width: 100%" height="100%" type="text" class="form-control"></asp:TextBox>
                                <div style="float:left">
                                    <asp:RequiredFieldValidator CssClass="validateAlign" ID="RequiredFieldValidator3" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="empl_Dob" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator CssClass="validateAlign reAlign" ID="DateRegularExpressionValidator" runat="server" ForeColor="Red" ErrorMessage="Incorrect Date Format" ControlToValidate="empl_Dob" ValidationExpression="^[\d]{4}[-][\d]{2}[-][\d]{2}$"></asp:RegularExpressionValidator>
                                </div>
                                <br /><br />
                                <asp:Button ID="empl_signUp" runat="server" Text="Update" style = "width: 100%; margin-left: 2px" height="100%" type = "submit" class = "btn btn-primary" OnClick="updatePost_Click"/>
                                
						</div>
					</div>		
				</div>
            </form>
		</div>  
    </div>
	<br/><br/>
</div>

</asp:Content>