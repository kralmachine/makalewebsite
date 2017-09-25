<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="Duyurular.aspx.cs" Inherits="Admin_Duyurular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%" rules="rows">
        <tr bgColor="#80ff00">
            <td colspan="2">
                <asp:Label ID="lblDuyuruEkleBilgilendirme" runat="server" 
                    Text="lblDuyuruEkleBilgilendirme"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" Text="DUYURU RESİM"></asp:Label>
            </td>
            <td>
                <asp:Image ID="imgDuyuruResim" runat="server" Height="100px" Width="100px" />
                <br />
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;</td>
            <td>
                <asp:FileUpload ID="fuDuyuruResimEkle" runat="server" Width="250px" />
                <asp:Button ID="btnDuyuruFotoEkle" runat="server" Text="DUYURU RESİM EKLE" 
                    onclick="btnDuyuruFotoEkle_Click" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label2" runat="server" Text="DUYURU BAŞLIK"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDuyuruBaslik" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label3" runat="server" Text="DUYURU ÖZET"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDuyuruOzet" runat="server" Height="75px" 
                    TextMode="MultiLine" Width="500px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label4" runat="server" Text="DUYURU DETAY"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDuyuruDetay" runat="server" Height="100px" Width="500px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label5" runat="server" Text="DUYURU ONAY"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="chcDuyuruOnay" runat="server" />
            </td>
        </tr>
        <tr bgColor="#80ff00">
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnDuyuruEkle" runat="server" Text="DUYURU EKLE" 
                    Width="150px" onclick="btnDuyuruEkle_Click" />
            </td>
        </tr>
        </table>
</asp:Content>

