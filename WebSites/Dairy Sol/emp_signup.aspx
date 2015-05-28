<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" enableEventValidation="false" AutoEventWireup="true" CodeFile="emp_signup.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container opaque">	
		<div class = 'center'>
				<div class = 'row'>
                    <div class="col-md-4 col-md-offset-2">
                        <br/><br/>
                        <asp:Image ID="emp_img" ImageUrl="~/images/updates/update1.jpg " runat="server" width="250" Height="250"/><br/>
                        <label>Attach Picture</label>&nbsp; &nbsp;<asp:FileUpload ID="empl_image" runat="server" />
                        <asp:Button runat="server" cssClass="btn btn-xs btn-primary" OnClick="changePic" Text="Upload"/>
                        <asp:Label runat="server" ID="label1"></asp:Label>
                        <br/>
                    </div>

					<div class="col-md-4 col-md-offset-1 boxDesign">
						<div style="margin-top: 10%"">
							<h2 style="text-align: center">Update Employee Info</h2>
							<br/>
							<form role="form">
                                <label>Name: </label>
                                <asp:TextBox ID="empl_Name" runat="server" style="width: 98%" type="text" class="form-control" placeholder="First Name"></asp:TextBox>
								<br/>
                                <label>Email Id: </label>
								<asp:TextBox ID="empl_Email" runat="server" style="width: 98%" type="text" class="form-control"></asp:TextBox>
								<br/>
                                <label>Password: </label>
                                <asp:TextBox ID="empl_Pass" runat="server" style="width: 98%" type="text" class="form-control"></asp:TextBox>
								<br/>
                                <label>CNIC: </label>
                                <asp:TextBox ID="empl_CNIC" runat="server" style="width: 98%" type="text" class="form-control"></asp:TextBox>
								<br/>
                                <label>Marital Status: </label>
                                <asp:TextBox ID="empl_marital_status" runat="server" style="width: 98%" type="text" class="form-control"></asp:TextBox>
                                <br />
                                <label>Number Of Children: </label>
                                <asp:TextBox ID="empl_no_children" runat="server" style="width: 98%" type="text" class="form-control" ></asp:TextBox>
                                <br/>
                                <label>Number of Siblings: </label>
                                <asp:TextBox ID="empl_no_siblings" runat="server" style="width: 98%" type="text" class="form-control" ></asp:TextBox>
                                <br/>
                                <label>Phone Number: </label>
                                <asp:TextBox ID="empl_phone_number" runat="server" style="width: 98%" type="text" class="form-control"></asp:TextBox>
                                <br/>
                                <label>Moblile Number: </label>
                                <asp:TextBox ID="empl_mobile_number" runat="server" style="width: 98%" type="text" class="form-control"></asp:TextBox>
                                <br />
                                <label>Address: </label>
                                <asp:TextBox ID="empl_Address" runat="server" style="width: 98%" type="text" class="form-control" ></asp:TextBox>
								<br/>
                                <label>Other Address: </label>
                                <asp:TextBox ID="empl_other_address" runat="server" style="width: 98%" type="text" class="form-control" placeholder="No Other Address"></asp:TextBox>
								<br/>
                                <label>City: </label>
                                <asp:TextBox ID="empl_city" runat="server" style="width: 98%" type="text" class="form-control"></asp:TextBox>
								<br/>
								<label>Date of birth :</label>
                                <asp:TextBox ID="empl_Dob" runat="server" style="width: 98%" type="text" class="form-control"></asp:TextBox><br />
                                <br />
                                <asp:Button ID="empl_signUp" runat="server" Text="Update" style = "width: 98%; margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="updatePost_Click"/>
                                
							</form>
						</div>
					</div>		
				</div>
		</div>  
    </div>
	<br/><br/>
</asp:Content>