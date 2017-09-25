<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="Projeler.aspx.cs" Inherits="Admin_Projeler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%">
        <tr>
            <td>
                <asp:DataList ID="dlProjeler" runat="server" CellPadding="4" 
                    ForeColor="#333333" Width="100%">
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <ItemTemplate>
                        <table align="center" cellspacing="1" width="100%">
                            <tr>
                                <td width="90%">
                                    <asp:Image ID="imgNotepad" runat="server" ImageUrl="~/Resimler/notepad.png" BorderStyle="None" ImageAlign="absmiddle" />&nbsp;&nbsp;<%#Eval("PROJEBASLIK")%></td>
                                <td width="10%" align="center">
                                    <a href="ProjelerDetay.aspx?projeID=<%#Eval("PROJEID")%>"><asp:Image ID="imgGuncelle" runat="server" ImageUrl="~/Resimler/update.png"  BorderStyle="None" ImageAlign="absmiddle" /></a>
                                    <a href="Projeler.aspx?projeID=<%#Eval("PROJEID")%>"><asp:Image ID="imgDelete" runat="server" ImageUrl="~/Resimler/delete.png"  BorderStyle="None" ImageAlign="absmiddle" /></a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

