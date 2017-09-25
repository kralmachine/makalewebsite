<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Site_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
   
   
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%">
        <tr>
            <td>
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
            </td>
        </tr>
         <tr>
                <td height="25px" align="center" bgColor="#465c71" ></td>
        </tr>
        <tr>
            <td>
            <asp:Repeater ID="rpAnaKategori" runat="server" 
                    onitemdatabound="rpAnaKategori_ItemDataBound">
                <ItemTemplate>
                <table width="100%">
                <tr align="center"  bgColor="#D7EFF7" >
                            <td align="left"><asp:Label ID="lblKategoriAd" runat="server" Text=<%#Eval("KATEGORIAD")%> Font-Bold="true" Font-Names="Verdana" Font-Size="Small"></asp:Label>
                                <hr />
                            </td>
                        </tr>
                </table>
            <asp:Repeater ID="rpAltKategori" runat="server"> 
              <ItemTemplate>  
               
                  <table align="center" cellspacing="1" width="100%">
                  <tr>
                    <td colspan="3" align="left">
                      <a  href="MakaleDetay.aspx?gelenMakaleID=<%#Eval("MAKALEID")%>"><asp:Label ID="lblMakaleBaslik" runat="server" Text=<%#Eval("MAKALEBASLIK")%>  Font-Bold="true" Font-Names="Verdana" Font-Size="Smaller" ForeColor="Black" Font-Underline="false" BorderStyle="None"> </asp:Label></a>
                    </td>
                  </tr>
                            <tr>
                                <td width="50px" valign="center" width="50px">
                                    <asp:Image ID="imgYorumFoto" runat="server" Height="50px" Width="50px" 
                                        ImageUrl='<%#Eval("KATEGORIRESIM")%>'/>
                                </td>
                                <td valign="center" height="50px">
                                     &nbsp; &nbsp;<asp:Label ID="lblGelenYorum" runat="server" Text='<%#Eval("MAKALEOZET")%>'  Font-Names="Verdana" Font-Size="Smaller"></asp:Label>
                                </td>
                                <td width="155px" valign="right" height="50px">
                                    <asp:Label ID="lblGelenTarih" runat="server" Text='<%#Eval("EKLEMETARIHI")%>'  Font-Names="Verdana" Font-Size="Smaller"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <hr />
                                </td>
                            </tr>
                        </table>
          
              </ItemTemplate>
  </asp:Repeater>
</ItemTemplate>
</asp:Repeater>
                
              
            </td>
        </tr>
      
    </table>
</asp:Content>

