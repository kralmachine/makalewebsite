<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="YorumDetay.aspx.cs" Inherits="Admin_YorumDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%" border="1" frame="border"  cellpadding="1" cellspacing="2"
        rules="rows">
        <tr>
            <td   bgColor="#80ff00"  Height="25px"
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px" 
                colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td  align="center" 
                
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:Label ID="Label1" runat="server" Text="KATEGORI AD"></asp:Label>
            </td>
            <td scope="row" 
                
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px" 
                colspan="3">
                <asp:TextBox ID="txtKategoriAd" runat="server" Width="580px" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="center" 
                
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:Label ID="Label3" runat="server" Text="YORUM BAŞLIK"></asp:Label>
            </td>
            <td scope="row" 
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:TextBox ID="txtYorumBaslik" runat="server"  Width="200px"></asp:TextBox>
            </td>
            <td scope="row" 
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:Label ID="Label4" runat="server" Text="YORUM EKLEYEN"></asp:Label>
            </td>
            <td scope="row" 
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:TextBox ID="txtYorumEkleyen" runat="server"  Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td   align="center" 
                
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:Label ID="Label5" runat="server" Text="EKLEYEN EMAIL"></asp:Label>
            </td>
            <td scope="row" 
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:TextBox ID="txtEkleyenEmail" runat="server"  Width="200px"></asp:TextBox>
            </td>
            <td scope="row"  
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:Label ID="Label6" runat="server" Text="YORUM ONAY"></asp:Label>
            </td>
            <td scope="row" 
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:CheckBox ID="chcYorumOnay" runat="server" />
            </td>
        </tr>
        <tr>
            <td   align="center" 
                
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:Label ID="Label2" runat="server" Text="MAKALE AD"></asp:Label>
            </td>
            <td scope="row" 
                
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px" 
                colspan="3">
                <asp:TextBox ID="txtMakaleAdi" runat="server"  Width="580px" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="center"   
                
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:Label ID="Label7" runat="server" Text="YORUM DETAY"></asp:Label>
            </td>
            <td colspan="3" scope="row" 
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:TextBox ID="txtYorumDetay" runat="server"  Width="580px" Height="100px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center"   bgColor="#80ff00"
                
                style="border-style: 1; border-color: 1; text-decoration: none; border-width: 1px; padding: 1px; margin: 1px">
                <asp:Button ID="btnYorumGuncelle" runat="server" Text="YORUM GÜNCELLE" 
                    Width="150px"  Height="25px" onclick="btnYorumGuncelle_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

