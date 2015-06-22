<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:Panel ID="pnlTextBoxes" runat="server">
        </asp:Panel>
        <hr />
        <asp:Button ID="btnAdd" runat="server" Text="Add New" OnClick="AddTextBox" />
        <asp:Button ID="btnGet" runat="server" Text="Get Values" OnClick="GetTextBoxValues" />

</asp:Content>

