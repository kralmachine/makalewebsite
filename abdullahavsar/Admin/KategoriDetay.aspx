<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="KategoriDetay.aspx.cs" Inherits="Admin_KategoriDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
   
  

  
   
  
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%">
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td bgcolor="#FFFF99">
                <asp:LinkButton ID="lbMakaleEkle" runat="server" Font-Names="Verdana" 
                    Font-Underline="False" onclick="lbMakaleEkle_Click">MAKALE EKLE</asp:LinkButton>
            </td>
            <td bgcolor="#FFFF99">
                <asp:LinkButton ID="lbMakaleSunumu" runat="server">MAKALE SUNUMU</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DataList ID="dlGelenKategoriMakale" runat="server" Width="100%" 
                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" CellSpacing="2" GridLines="Both">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <ItemTemplate>
                        <table align="center" cellspacing="1" width="100%" height="100px" rules="all">
                            <tr>
                                <td width="125px" rowspan="4" valign="top">
                                    
                                    <table align="center" cellspacing="1" width="150px">
                                        <tr align="left">
                                            <td align="center" valign="center" >
                                                <asp:Image ID="imgGelenKategoriMakaleResim" Width="150px" Height="150px"   ImageUrl='<%#Eval("KATEGORIRESIM")%>'
                                                    runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="385px" align="right" valign="center" height="10px" colspan="4" 
                                    style="width: 625px" bgcolor="#BBFFFF">
                                   <a href="KategoriDetay.aspx?VitrinDurum=true&makaleid=<%#Eval("MAKALEID")%>&kategoriId=<%#Eval("KATEGORIID") %>"><asp:Image ID="imgVitrin" runat="server" ImageUrl="~/Resimler/vitrin.png" BorderStyle="None" ToolTip="Vitrin Güncelleme Durumu" align="absmiddle" /></a> 
                                   <a href="KategoriDetay.aspx?OnayDurum=true&makaleid=<%#Eval("MAKALEID")%>&kategoriId=<%#Eval("KATEGORIID") %>"> <asp:Image ID="imgOnay" runat="server" ImageUrl="~/Resimler/onay.png" align="absmiddle" ToolTip="Onay Güncelleme Durumu" BorderStyle="None" /></a>
                                </td>
                            </tr>
                            <tr height="25px">
                                <td height="25px" valign="top" width="385px" colspan="3">
                                    <asp:Label ID="lblMakaleBaslik" runat="server" Text=<%#Eval("MAKALEBASLIK")%>></asp:Label>
                                </td>
                                <td height="25px" valign="top" width="450px">
                                  
                                    <asp:Label ID="lbMakaleTarih" runat="server" Text=<%#Eval("EKLEMETARIHI")%>></asp:Label>
                                  
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" valign="top" align="left" height="50px">
                                    <asp:Label ID="lblMakaleOzet" runat="server" Text=<%#Eval("MAKALEOZET")%>></asp:Label>
                                </td>
                            </tr>
                            <tr align="center" height="15px">
                                <td width="385px" bgcolor="#BBFFFF">
                                    <asp:Label ID="lblMakaleYorumSayisi" runat="server" ToolTip="YORUM SAYISI" Text=<%#Eval("YORUMSAYISI")%>></asp:Label>
                                </td>
                                <td bgcolor="#BBFFFF" width="385px">
                                    <asp:Label ID="lblMakaleSoruSayisi" runat="server"  ToolTip="SORU SAYISI" Text=<%#Eval("SORUSAYISI")%>></asp:Label>
                                </td>
                                <td bgcolor="#BBFFFF" width="385px">
                                    <asp:Label ID="lblMakaleCevapSayisi" runat="server"  ToolTip="CEVAP SAYISI" Text=<%#Eval("CEVAPSAYISI")%>></asp:Label>
                                </td>
                                <td bgcolor="#BBFFFF">
                                    <asp:Label ID="lblMakaleOkunmaSayisi" runat="server"  ToolTip="OKUNMA SAYISI" Text=<%#Eval("OKUNMASAYISI")%>></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />

                </asp:DataList>
            </td>
        </tr>
        </table>
</asp:Content>

