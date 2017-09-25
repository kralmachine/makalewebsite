<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Site.master" AutoEventWireup="true" CodeFile="WebProgramlama.aspx.cs" Inherits="WebProgramlama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                       <a href='<%#String.Format("makaleler/{0}_{1}",ToUrl.UrlDonustur(Eval("MAKALEBASLIK").ToString()),Eval("MAKALEID").ToString())%>'><asp:Label ID="lblMakaleBaslik" runat="server" Text=<%#Eval("MAKALEBASLIK")%>  Font-Bold="true" Font-Names="Verdana"  Font-Underline="false" BorderStyle="None" ForeColor="Black" Font-Size="Smaller"> </asp:Label> </a>
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
</asp:Content>

