<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="emp_add_attendance.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Mark Attendance <small></small>
                        </h1>
                    </div>
                </div>
                
				
				<div class="row">
                 <div class="col-md-4 col-md-offset-4">                
                    <form class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Select Employee Name"></asp:Label>
                        <br/>
                        <asp:DropDownList CssClass="form-control control-height" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="employee_name" DataValueField="employee_id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT [employee_name], [employee_id] FROM [employee_info]"></asp:SqlDataSource>
                        <br/>
                        <asp:Label ID="Label1" runat="server" Text="Date and Time"></asp:Label>
                        <asp:TextBox CssClass="form-control control-height" ID="CurrentTime" runat="server"></asp:TextBox>
                        <asp:Label ID="Label2" runat="server" Text="*Note Edit date/time if it is not correct"></asp:Label>
                        
				        <br/>
                        <br/>
                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Mark Attendance" OnClick ="mark_attendance_Click"/>
                        <br/>
                        <br/>
                        <asp:Label ID="attendance_marked" runat="server" EnableViewState="False" Visible="False"></asp:Label>
                    </form>
                 </div>
                <!-- /.row -->
         	
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
</asp:Content>