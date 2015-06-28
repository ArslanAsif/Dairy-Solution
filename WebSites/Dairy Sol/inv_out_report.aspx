<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="inv_out_report.aspx.cs" Inherits="inv_out_report" %>

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
            <asp:TextBox type="date" ID="txtFrom" runat="server"></asp:TextBox>
&nbsp;To:
            <asp:TextBox type="date" ID="txtTo" runat="server"></asp:TextBox>
&nbsp;
            <asp:Button ID="btnShow" CssClass="btn btn-primary" runat="server" OnClick="btnShow_Click" Text="Show Report" />
            <br />
            <br />
            <rsweb:ReportViewer ID="rptViewer" runat="server" SizeToReportContent="True">
            </rsweb:ReportViewer>
        </div>
    </div>
</asp:Content>

