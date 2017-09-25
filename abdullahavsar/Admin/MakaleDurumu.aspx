<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="MakaleDurumu.aspx.cs" Inherits="Admin_MakaleDurumu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
   
  
    <style type="text/css">
        .style1
        {
            height: 19px;
        }
    </style>
  
   
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%">
        <tr>
            <td class="style1">
                </td>
            <td colspan="3" class="style1">
                <asp:Label ID="lblMakaleDurumBilgilendirme" runat="server" Font-Bold="True" 
                    Font-Names="Verdana" Font-Size="Smaller" Text="lblMakaleDurumBilgilendirme" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Kategori Resim"></asp:Label>
            </td>
            <td colspan="3">
                <asp:Image ID="imgKategoriResim" Width="150px" Height="150px" runat="server"  />
                <br />
                <asp:FileUpload ID="fuKategoriResimMakaleResim" runat="server" Width="250px" />
                <br />
                <asp:Button ID="btnKategoriMakaleResimYukle" runat="server" 
                    Text="KATEGORİ MAKALE RESİM YÜKLE" width="250px" 
                    onclick="btnKategoriMakaleResimYukle_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" runat="server" Text="Kategori Resim Durumu"></asp:Label>
            </td>
            <td colspan="3">
                <asp:DropDownList ID="ddLTumKategoriList" Width="250px" runat="server" 
                    AutoPostBack="True" 
                    onselectedindexchanged="ddLTumKategoriList_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Kategori Adı"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtKategoriAd" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Makele Başlık"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtMakaleBaslik" runat="server" Width="450px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Makale Özet"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtMakaleOzet" runat="server" Height="100px" 
                    TextMode="MultiLine" Width="450px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Makale Yazan"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtMakaleYazanKisi" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Makale İçerik"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtMakaleIcerik" align="left" runat="server" Height="500px" 
                    TextMode="MultiLine" Width="95%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Onay"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="chOnay" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Vitrin"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="chVitrin" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Okunma Sayısı"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtOkunmaSayisi" runat="server" Width="75px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Soru Sayısı"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtSoruSayisi" runat="server" Width="75px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Cevap Sayısı"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtCevapSayisi" runat="server" Width="75px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Yorum Sayısı"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtYorumSayisi" runat="server" Width="75px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="3">
                <asp:Button ID="btnMakaleKaydet" runat="server" Text="MAKALE KAYDET" 
                    Width="150px" onclick="btnMakaleKaydet_Click" />
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

