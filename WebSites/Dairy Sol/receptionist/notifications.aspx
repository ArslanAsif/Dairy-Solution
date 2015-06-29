<%@ Page Title="" Language="C#" MasterPageFile="~/receptionist/MasterRecept.master" AutoEventWireup="true" CodeFile="notifications.aspx.cs" Inherits="notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Notifications
                </h1>
            </div>
        </div>		
        

			<div class = 'row'>
				<div class = "col-md-12">
					<h3 class = "h3">Tasks</h3>
					<p id="description_para" runat="server">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="task_id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="874px">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="task_id" HeaderText="Task ID" InsertVisible="False" ReadOnly="True" SortExpression="task_id" />
                                <asp:BoundField DataField="task_desc" HeaderText="Task Description" SortExpression="task_desc" />
                                <asp:BoundField DataField="task_date" HeaderText="Task Date" SortExpression="task_date" />
                                <asp:BoundField DataField="task_type" HeaderText="Task Type" SortExpression="task_type" />
                                <asp:BoundField DataField="added_by" HeaderText="Added By" SortExpression="added_by" />
                                <asp:BoundField DataField="added_to" HeaderText="Added To" SortExpression="added_to" />
                                <asp:BoundField DataField="added_on" HeaderText="Added On" SortExpression="added_on" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT * FROM tasks where task_status = '0'"></asp:SqlDataSource>
                    </p>
                    <p runat="server">
                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" OnClick="Button1_Click" Text="Clear Notifications" />
                    </p>
					
				</div>
			</div>
		</div> 
		</div>
	<br>
</asp:Content>