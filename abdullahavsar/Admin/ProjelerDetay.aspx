<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="ProjelerDetay.aspx.cs" Inherits="Admin_ProjelerDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%" rules="rows">
            <tr bgColor="#80ff00">
            <td colspan="2">
                &nbsp;</td>
        </tr>
            <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Proje Başlık"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtProjeBaslik" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Proje Özet"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtProjeOzet" runat="server" Height="70px" 
                    TextMode="MultiLine" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Proje Detay"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtProjeDetay" runat="server" Height="200px" 
                    TextMode="MultiLine" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr bgColor="#80ff00">
            <td align="center" colspan="2">
                <asp:Button ID="btnHakkimdaProjeEkle" runat="server" 
                    Text="HAKKIMDA PROJE EKLE" onclick="btnHakkimdaProjeEkle_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>

