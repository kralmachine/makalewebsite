<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    
    <script type="text/javascript">

        function isBosmu() {
            var bilgiAd = document.getElementById('<%=txtBilgiAdi.ClientID%>').value;
            var bilgiAciklama = document.getElementById('<%=txtBilgiAciklama.ClientID%>').value;
            if (bilgiAd == "" || bilgiAciklama == "")
                alert('Lütfen Boş Alanları Doldurunuz.');
            
         }

    </script>
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%" border="0.5px" 
        cellpadding="1" frame="border" style="padding: 1px; margin: 1px">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="lblBilgi" runat="server" Text="#HOŞ GELDİNİZ#" Font-Bold="True" 
                    Font-Names="Verdana" Font-Size="Medium" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" height="20px">
                <asp:Image ID="imgCizgi" runat="server" ImageAlign="AbsMiddle" Width="95%" 
                    ImageUrl="~/Resimler/cizgi.png" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblTextBilgiAdi" runat="server" Text="Bilgi Adı" ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBilgiAdi" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right">
                <asp:Label ID="lblTextBilgiAciklama" runat="server" Text="Bilgi Açıklama"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBilgiAciklama" runat="server" Width="350px" Height="100px" 
                    TextMode="MultiLine" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnBilgiEkle" runat="server" Text="BİLGİ EKLE" Width="150px" 
                  OnClientClick="isBosmu();"  onclick="btnBilgiEkle_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                
                <div width="100%">
                
                    <asp:Label ID="lblBilgilendirme" runat="server" Font-Names="Verdana" 
                        Font-Size="Smaller" ForeColor="Red" Text="lblBilgilendirme" Visible="False"></asp:Label>
                
                </div>
                
                </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DataList ID="dlBilgilendirme" runat="server" BackColor="#DEBA84"  Width="100%"
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Both" RepeatDirection="Horizontal" RepeatColumns="2" 
                    CellSpacing="2">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <ItemTemplate>
                    <div align="left" width="50%" style="height: 175px">
                        <table align="left" cellspacing="1" width="100%">
                            <tr>
                                <td colspan="2" valign="top" align="left">
                                   <a href="Default.aspx?gidenBilgiSilinecekid=<%#Eval("BILGIID")%>" align="absmiddle">
                                    <asp:Image ID="imgSil" runat="server" 
                                        ImageUrl="~/Resimler/delete.png" BorderStyle="None" /></a> 
                                    &nbsp;<a href="Default.aspx?gelenBilgiGuncelleDurum=true&gelenBilgiGuncelle=<%#Eval("BILGIID")%>" align="absmiddle"><asp:Image ID="imgDuzenle" runat="server" 
                                        ImageUrl="~/Resimler/update.png" BorderStyle="None" /></a>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td height="30px" bgColor="#80ff00" width="450px">
                                    <asp:Label ID="lblBilgiAdi" runat="server" Text=""><%#Eval("BILGIAD")%></asp:Label>
                                </td>
                                <td  bgColor="#80ff00" align="left" width="300px">
                                    <asp:Label ID="lblBilgiTarih" runat="server" Text=""><%#Eval("BILGIEKLEMETARIHI")%></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"  width="450px" height="100px" valign="top" align="left">
                                    <asp:Label ID="lblBilgiAciklama" runat="server" Text=""><%#Eval("BILGIACIKLAMA")%></asp:Label>
                                </td>
                            </tr>
                            
                            <tr>
                                <td width="100px" colspan="2">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        </div>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

