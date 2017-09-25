<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Site.master" AutoEventWireup="true" CodeFile="MakaleDetay.aspx.cs" Inherits="Site_MakaleDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%">
        <tr>
            <td  valign="center"  bgColor="#465c71" height="25px">
                            &nbsp;&nbsp;<asp:Label ID="lblGelenMakaleBaslik" runat="server" 
                    Font-Names="Verdana" Font-Size="Small" 
                                Text="lblGelenMakaleBaslik" ForeColor="#00C663" Font-Bold="True" 
                    Font-Strikeout="False"></asp:Label>
                        </td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;<asp:Literal ID="ltGelenMakaleDetay" runat="server" Text="ltGelenMakaleDetay"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td>
                <table  align="center" cellspacing="1" width="100%">
                    
                       <tr bgColor="#80ff00">
            <td colspan="3" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" valign="center" width="30%">
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
                <asp:Button ID="btnYorumGonder" runat="server" onclick="btnYorumGonder_Click" 
                    Text="YORUM GÖNDER" />
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
                <asp:DataList ID="dlGelenMakaleIcinYorumlar" runat="server" Width="100%">
                    <ItemTemplate>
                        <table align="center" cellspacing="1" width="100%">
                            <tr>
                                <td width="50px" valign="top" width="50px">
                                    <asp:Image ID="imgYorumFoto" runat="server" Height="50px" Width="50px" 
                                        ImageUrl="~/Resimler/useryorum.png" />
                                </td>
                                <td valign="center" height="50px">
                                     &nbsp; &nbsp;<asp:Label ID="lblGelenYorum" runat="server" Text='<%#Eval("YORUMACIKLAMA")%>'  Font-Names="Verdana" Font-Size="Smaller"></asp:Label>
                                </td>
                                <td width="155px" valign="center" height="50px">
                                    <asp:Label ID="lblGelenTarih" runat="server" Text='<%#Eval("YORUMONAYONAYTARIHI")%>'  Font-Names="Verdana" Font-Size="Smaller"></asp:Label>
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
            
            </td>
        </tr>
    </table>
</asp:Content>

