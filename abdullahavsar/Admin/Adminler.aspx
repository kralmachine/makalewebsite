<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="Adminler.aspx.cs" Inherits="Admin_Adminler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="1" width="100%">
        <tr>
            <td>
                <asp:DataList ID="dlAdminler" runat="server" Width="100%" BackColor="#DEBA84" 
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    CellSpacing="2" GridLines="Both">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <ItemTemplate>
                        <table cellspacing="1" width="100%">
                            <tr>
                                <td align="left" width="15%">
                                    <asp:Label ID="Label1" runat="server" Text=<%#Eval("AD")%>></asp:Label>
                                </td>
                                <td align="left"  width="15%">
                                    <asp:Label ID="Label2" runat="server" Text=<%#Eval("SOYAD")%>></asp:Label>
                                </td>
                                <td align="left"  width="15%">
                                    <asp:Label ID="Label3" runat="server" Text=<%#Eval("SIFRE")%>></asp:Label>
                                </td>
                                <td align="left"  width="15%">
                                    <asp:Label ID="Label4" runat="server" Text=<%#Eval("GOREVI")%>></asp:Label>
                                </td>
                                <td align="center"  width="32%">
                                    <asp:Label ID="Label5" runat="server" Text=<%#Eval("EMAIL")%>></asp:Label>
                                </td>
                                <td align="center"  width="18%">
                                   <a href="KayitEkle.aspx?adminGuncelleOnay=true&adminGuncelleId=<%#Eval("ADMINID") %>"><asp:Image ID="imgGuncelle" runat="server" align="absmiddle" 
                                        ImageUrl="~/Resimler/update.png"  BorderStyle="None" /></a> 
                                   <a href="Adminler.aspx?gelenAdminID=<%#Eval("ADMINID")%>"><asp:Image ID="imgSil" runat="server"  align="absmiddle" 
                                        ImageUrl="~/Resimler/delete.png" BorderStyle="None" /></a> 
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAdminBilgilendirme" runat="server" Font-Bold="True" 
                    Font-Names="Verdana" Font-Size="Smaller" Text="lblAdminBilgilendirme" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

