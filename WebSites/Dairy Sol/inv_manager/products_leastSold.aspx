<%@ Page Title="" Language="C#" MasterPageFile="~/inv_manager/MasterInv.master" AutoEventWireup="true" CodeFile="products_leastSold.aspx.cs" Inherits="products_leastSold" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="page-wrapper">
        <div style="margin-left:150px">       
            
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            From:
            <asp:TextBox ID="txtFrom" type="date" runat="server"></asp:TextBox>
&nbsp;To:
            <asp:TextBox ID="txtTo" type="date" runat="server"></asp:TextBox>
&nbsp;
            <asp:Button ID="btnShow" runat="server" CssClass="btn btn-primary" OnClick ="btnShow_Click" Text="Show Report" />
            <br />
            <br />
            <rsweb:ReportViewer ID="rptViewer" runat="server" SizeToReportContent="True">
            </rsweb:ReportViewer>
            
        </div>
    </div>
</asp:Content>