<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="Hakkimda.aspx.cs" Inherits="Admin_Hakkimda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%" rules="rows" bgColor="#D7EFF7">
        <tr bgColor="#80ff00">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td height="150px" width="150px" valign="top">
                <asp:Image ID="imgHakkimdaFoto" runat="server" Height="150px" Width="150px" />
            </td>
            <td colspan="4" valign="top">
                <table align="center" cellspacing="1" width="100%">
                    <tr>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Literal ID="ltHakkimda" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr bgColor="#80ff00">
            <td width="20%">
                &nbsp;</td>
            <td width="20%">
            </td>
            <td width="20%">
            </td>
            <td width="20%">
            </td>
            <td width="20%">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Projeler"></asp:Label>
            </td>
            <td colspan="4" height="150px" valign="top">
                <table align="center" cellspacing="1" width="100%">
                    <tr>
                        <td>
                            <asp:Literal ID="ltProjeler" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr bgColor="#80ff00">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Resimler"></asp:Label>
            </td>
            <td colspan="4">
                <asp:DataList ID="dlResimler" runat="server" CellPadding="3" Width="100%" RepeatColumns="3" 
                    RepeatDirection="Horizontal" BackColor="#D7EFF7" BorderColor="#D7EFF7" 
                    BorderStyle="None" BorderWidth="1px" GridLines="Both">
                    <FooterStyle BackColor="#D7EFF7" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#D7EFF7" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#D7EFF7" ForeColor="#333333" />
                    <ItemTemplate>
                        <table align="center" width="100%">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="imgGelenHakkimdaResim"  Width="75px" Height="75px" runat="server" ImageUrl='<%#Eval("RESIMYOL")%>'/>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                 <a href="Hakkimda.aspx?gelenResimId=<%#Eval("RESIMID")%>"><asp:Image ID="imgResimSil" runat="server" ImageUrl="~/Resimler/delete.png" BorderStyle="None" ImageAlign="AbsMiddle" /></a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
            </td>
        </tr>
        <tr bgColor="#80ff00">
            <td colspan="5" align="center">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <asp:Image ID="imgHakkimdaDurumFoto" runat="server" Height="100px" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <asp:FileUpload ID="fuHakkimda" runat="server" Width="300px" />
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <asp:Button ID="btnHakkimdaFotoGuncelle" runat="server" 
                    onclick="btnHakkimdaFotoGuncelle_Click" Text="HAKKIMDA FOTO GÜNCELLE" />
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center" bgcolor="#80FF00">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <table align="center" cellspacing="1" width="100%">
                    <tr>
                        <td align="center">
                            <asp:TextBox ID="txtHakkimda" runat="server" Height="100px" 
                                TextMode="MultiLine" Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnHakkimdaGuncelle" runat="server" Text="HAKKIMDA GÜNCELLE" 
                                onclick="btnHakkimdaGuncelle_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#80FF00">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <table align="center" cellspacing="1" width="100%" rules="rows">
                                <tr>
                                    <td width="35%">
                                        <asp:Label ID="Label3" runat="server" Text="Proje Başlık"></asp:Label>
                                    </td>
                                    <td width="65%">
                                        <asp:TextBox ID="txtProjeBaslik" runat="server" Width="400px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Proje Özet"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProjeOzet" runat="server" TextMode="MultiLine" 
                                            Width="400px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Proje Detay"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProjeDetay" runat="server" Height="85px" 
                                            TextMode="MultiLine" Width="400px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Button ID="btnHakkimdaProjeEkle" runat="server" 
                                            Text="HAKKIMDA PROJE EKLE" onclick="btnHakkimdaProjeEkle_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#80FF00">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <table align="center" cellspacing="1" width="100%" rules="rows">
                                <tr>
                                    <td align="center">
                                        <asp:Image ID="imgFoto" runat="server" Height="75px" Width="75px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:FileUpload ID="fuHakkimdaFotoResimler" runat="server" Width="300px" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnHakkimdaResimEkle" runat="server" 
                                Text="HAKKIMDA RESİM EKLE" onclick="btnHakkimdaResimEkle_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#80FF00">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        </table>
</asp:Content>

