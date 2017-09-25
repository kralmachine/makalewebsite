<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Site.master" AutoEventWireup="true" CodeFile="Duyurular.aspx.cs" Inherits="Site_Duyurular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:DataList ID="dlGelenDuyurular" runat="server" RepeatColumns="2"  
                    Font-Names="Arial" Font-Size="10pt"
                    Width="100%" BackColor="#D7EFF7">
                    <ItemTemplate>
                        <table align="center" cellspacing="1" width="100%">
                            <tr>
                                <td width="120px" height="120px" valign="top">
                                    <asp:Image ID="imgGelenDuyurularFoto" runat="server" Height="120px"  ImageUrl='<%#Eval("DUYURURESIM")%>'
                                        Width="120px" />
                                </td>
                                <td valign="top">
                                    <table align="center" cellspacing="1" width="100%">
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="ltGelenDuyurularOzet" runat="server" Text=<%#Eval("DUYURUOZET")%> Font-Names="Verdana" Font-Size="Smaller" Height="100px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Font-Names="Verdana" Font-Size="Smaller" 
                                                    Text='<%#Eval("DUYURUEKLEMETARIHI")%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Font-Size="Smaller" 
                                                    Text='<%#Eval("DUYURUYAZAN")%>'></asp:Label>
                                            </td>
                                            <td align="center">
                                                <a href="DuyuruDetay.aspx?gelenDuyuruID=<%#Eval("DUYURUID") %>"><asp:Image ID="imgDuyuruDetay" runat="server" ImageUrl="~/Resimler/detay.png" BorderStyle="None"  align="absmiddle" /></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <hr />
                                </td>
                               
                            </tr>
                         
                        </table>
                    </ItemTemplate>
                </asp:DataList>

</asp:Content>

