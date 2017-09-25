<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="Kategoriler.aspx.cs" Inherits="Admin_Kategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%" cellpadding="2" 
    cellspacing="1" rules="rows" 
    
        style="padding: 1px; margin: 1px; border-style: 1; border-color: 1; border-width: 1px;" >
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td  align="right">
                <asp:Label ID="Label1" runat="server" Text="Kategori Adı"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtKategoriAd" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label2" runat="server" Text="Kategori Açıklama"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="txtKategoriAciklama" runat="server" Width="350px" Height="75" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td>
                <asp:Button ID="btnKategoriEkle" runat="server"  Width="125px" 
                    Text="Kategori Ekle" onclick="btnKategoriEkle_Click" />
            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" >
                <asp:Repeater ID="rpKategoriler" runat="server" >
                    <HeaderTemplate>
                        <table border="1" width="100%">
                            <tr bgColor="#F7DFB5">
                                <th align="left">Kategori Adı</th>
                                 <th>Makale Sayısı</th>
                                 <th>Yorum Sayısı</th>
                                  <th>Okunma Sayısı</th>
                                   <th>Soru Sayısı</th>
                                    <th>Cevap Sayısı</th>
                                    <th>İşlem Yap</th>
                                   
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr align="center" bgColor="#bbff77">
                            <td align="left"><%#Eval("KATEGORIAD")%></td>
                            <td><%#Eval("MAKALESAYISI")%></td>
                            <td><%#Eval("YORUMSAYISI")%></td>
                            <td><%#Eval("OKUNMASAYISI")%></td>
                            <td><%#Eval("SORUSAYISI")%></td>
                            <td><%#Eval("CEVAPSAYISI")%></td>
                            <td><a href="KategoriDetay.aspx?kategoriId=<%#Eval("KATEGORIID")%>"><asp:Image runat="server" ID="imgIslem1" ImageUrl="~/Resimler/kategori_calistir.png" BorderStyle="None" align="absmiddle"/></a></td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr bgColor="#bbff77" align="center">
                            <td align="left">
                                <%#Eval("KATEGORIAD")%>
                            </td>
                             <td>
                                <%#Eval("MAKALESAYISI")%>
                            </td>
                             <td>
                                <%#Eval("YORUMSAYISI")%>
                            </td>
                             <td>
                                <%#Eval("OKUNMASAYISI")%>
                            </td>
                             <td>
                                <%#Eval("SORUSAYISI")%>
                            </td>
                             <td>
                                <%#Eval("CEVAPSAYISI")%>
                            </td>

                            <td>
                                <a href="KategoriDetay.aspx?kategoriId=<%#Eval("KATEGORIID")%>"><asp:Image  runat="server" ID="imgIslem2"  ImageUrl="~/Resimler/kategori_calistir.png" BorderStyle="None" align="absmiddle"/></a>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <SeparatorTemplate>
                        <tr bgColor="#F7DFB5">
                            <td colspan="7">
                                <hr />
                            </td>
                        </tr>
                    </SeparatorTemplate>
                   <FooterTemplate >
                        </table>
                   </FooterTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

