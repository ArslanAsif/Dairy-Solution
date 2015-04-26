<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Productsdisplay.aspx.cs" Inherits="Productsdisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
    <p>
        &nbsp;</p>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
        
         Products 1
        <asp:Label runat="server" Text="details" />
    </ItemTemplate>
    </asp:Repeater>
    
</asp:Content>

