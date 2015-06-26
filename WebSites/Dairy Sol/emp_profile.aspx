<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="emp_profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="page-wrapper">
        <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Profile <small></small>
                </h1>
            </div>
        </div>

		<div class = 'row'>

            <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <asp:Label runat="server" ID="error"></asp:Label>

				<br/>
            </div>

            <div class="col-md-2 col-md-offset-2">
                <br/>
                <asp:Image ID="emp_img" runat="server" width="200" Height="200"/><br/>

                <h2><asp:Label ID="name" runat="server">N.A.</asp:Label></h2>
                <h4><asp:Label ID="desig" runat="server">N.A.</asp:Label></h4>
            </div>

			<div class="col-md-5 col-md-offset-1">
				<div>
						
                    <hr /><h3>Basic information</h3><hr />
                        
                    <div class = 'row'>
                    <div class="col-md-4">
                    <label>Father Name: </label></div>

                    <div class="col-md-8">
                    <asp:Label ID="father" runat="server">N.A.</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
                    <label>Gender: </label></div>

                    <div class="col-md-8">
                    <asp:Label ID="gender" runat="server">N.A.</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
                    <label>CNIC: </label></div>

                    <div class="col-md-8">
                    <asp:Label ID="cnic" runat="server">N.A.</asp:Label></div></div>
						
                    <div class = 'row'>
                    <div class="col-md-4">
                    <label>Date of Birth: </label></div>

                    <div class="col-md-8">
					<asp:Label ID="dob" runat="server">N.A.</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
                    <label>Marital Status: </label></div>

                    <div class="col-md-8">
                    <asp:Label ID="ms" runat="server">N.A.</asp:Label></div></div>
						
                    <div class = 'row'>
                    <div class="col-md-4">
                    <label>Number Of Children: </label></div>

                    <div class="col-md-8">
                    <asp:Label ID="noc" runat="server">0</asp:Label></div></div>

                    <br />
                    <hr /><h3>Contact Information</h3><hr />

                    <div class = 'row'>
                    <div class="col-md-4">
                    <label>Phone Number: </label></div>

                    <div class="col-md-8">
                    <asp:Label ID="phone" runat="server">N.A.</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
                    <label>Moblile Number: </label></div>

                    <div class="col-md-8">
                    <asp:Label ID="mobile" runat="server">N.A.</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
                    <label>Email: </label></div>

                    <div class="col-md-8">
                    <asp:Label ID="email" runat="server">N.A.</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
                    <label>Address: </label></div>

                    <div class="col-md-8">
                    <asp:Label ID="add" runat="server">N.A.</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
                    <label>Other Address: </label></div>

                    <div class="col-md-8">
                    <asp:Label ID="other_add" runat="server">N.A.</asp:Label></div></div>


                    <br />
                    <hr /><h3>Company Record</h3><hr />
                    <div class = 'row'>
                    <div class="col-md-4">
					<label>Date of Joining :</label></div>

                    <div class="col-md-8">
                    <asp:Label ID="doj" runat="server">N.A.</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
					<label>Salary :</label></div>

                    <div class="col-md-8">
                    <asp:Label ID="salary" runat="server">0</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
					<label>Allowance :</label></div>

                    <div class="col-md-8">
                    <asp:Label ID="allow" runat="server">0</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
					<label>Medical Allowance :</label></div>

                    <div class="col-md-8">
                    <asp:Label ID="med_allow" runat="server">0</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
					<label>Loan :</label></div>

                    <div class="col-md-8">
                    <asp:Label ID="loan" runat="server">0</asp:Label></div></div>

                    <div class = 'row'>
                    <div class="col-md-4">
					<label>Loan Deduction :</label></div>

                    <div class="col-md-8">
                    <asp:Label ID="loan_deduct" runat="server">0</asp:Label></div></div>

                    <br /><br />
				</div>
			</div>		
		</div>
        </div>
	</div>  
	<br/><br/>

</asp:Content>

