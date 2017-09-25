<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Site.master" AutoEventWireup="true" CodeFile="DuyuruDetay.aspx.cs" Inherits="Site_DuyuruDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%">
        <tr>
            <td width="250px" height="250px" valign="top">
                <asp:Image ID="imgGelenDuyuruDetayFoto" runat="server" Height="250px"
                    Width="250px" />
            </td>
            <td valign="top" colspan="2">
                 &nbsp; &nbsp;<asp:Literal ID="ltGelenDuyuruDetay" runat="server" Text="ltGelenDuyuruDetay" ></asp:Literal>
            </td>
        </tr>
        <tr bgColor="#80ff00" align="center">
            <td>
                YAZAN</td>
            <td>
                TARİH</td>
            <td>
                OKUNMA SAYISI</td>
        </tr>
        <tr>
            <td width="30%" align="center">
                <asp:Label ID="lblDuyuruYazan" runat="server" Text="lblDuyuruYazan"  Font-Names="Verdana" Font-Size="Smaller"></asp:Label>
            </td>
            <td width="40%" align="center">
                <asp:Label ID="lblDuyuruTarih" runat="server" 
                    Text="lblDuyuruTarih"  Font-Names="Verdana" Font-Size="Smaller"></asp:Label>
            </td>
            <td width="30%" align="center">
                <asp:Label ID="lblDuyuruOkunmaSayisi" runat="server" 
                    Text="lblDuyuruOkunmaSayisi"  Font-Names="Verdana" Font-Size="Smaller"></asp:Label>
            </td>
        </tr>
        <tr bgColor="#80ff00">
            <td colspan="3" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" valign="center">
                <asp:Label ID="Label6" runat="server" Text="AD SOYAD"  Font-Names="Verdana" Font-Size="Smaller"></asp:Label> &nbsp;
            </td>
            <td colspan="2" >
                <asp:TextBox ID="txtAdSoyad" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="center">
                <asp:Label ID="Label7" runat="server" Text="EMAIL"  Font-Names="Verdana" Font-Size="Smaller"></asp:Label> &nbsp;
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="center">
                <asp:Label ID="Label8" runat="server" Text="YORUM"  Font-Names="Verdana" Font-Size="Smaller"></asp:Label> &nbsp;
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtYorum" runat="server" Height="75px" TextMode="MultiLine" 
                    Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
                <asp:Button ID="btnYorumGonder" runat="server" Text="YORUM GÖNDER" 
                    onclick="btnYorumGonder_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="lblDuyuruYorumBilgilendirme" runat="server"></asp:Label>
            </td>
        </tr>
        <tr bgColor="#80ff00">
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:DataList ID="dlGelenDuyuruIcinYorumlar" runat="server" Width="100%">
                    <ItemTemplate>
                        <table align="center" cellspacing="1" width="100%">
                        <tr>
                            <td colspan="3"><asp:Label ID="Label1" runat="server" Text='<%#Eval("DUYURUADSOYAD")%>'  Font-Names="Verdana" Font-Bold="true" Font-Size="Smaller"></asp:Label></td>
                        </tr>
                            <tr>
                                <td width="50px" valign="top" width="50px">
                                    <asp:Image ID="imgYorumFoto" runat="server" Height="50px" Width="50px" 
                                        ImageUrl="~/Resimler/useryorum.png" />
                                </td>
                                <td valign="center" height="50px">
                                     &nbsp; &nbsp;<asp:Label ID="lblGelenYorum" runat="server" Text='<%#Eval("DUYURUYORUM")%>'  Font-Names="Verdana" Font-Size="Smaller"></asp:Label>
                                </td>
                                <td width="155px" valign="center" height="50px">
                                    <asp:Label ID="lblGelenTarih" runat="server" Text='<%#Eval("DUYURUYORUMTARIH")%>'  Font-Names="Verdana" Font-Size="Smaller"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        </table>
</asp:Content>

