<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="DuyuruYorumlar.aspx.cs" Inherits="Admin_DuyuruYorumlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" width="100%">
        <tr>
            <td colspan="2">
                <asp:DataList ID="dlGelenDuyuruYorumlar" runat="server" BackColor="#DEBA84"  Width="100%"
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    CellSpacing="2" GridLines="Both">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <ItemTemplate>
                        <table align="center" cellspacing="1" width="100%">
                            <tr align="right">
                                <td colspan="6" align="right" bgColor="#80ff00" >
                                     <a href="DuyuruYorumlar.aspx?silinecekDuyuruYorumID=<%#Eval("DUYURUYORUMID")%>"><asp:Image ID="imgduyuruYorumSil" runat="server" ImageUrl="~/Resimler/delete.png" BorderStyle="None" align="absmiddle" /></a>
                                   <a href="DuyuruYorumlar.aspx?YorumOnay=true&guncelleDuyuruYorumID=<%#Eval("DUYURUYORUMID")%>"><asp:Image ID="imgDuyuruYorumOnay" runat="server" ImageUrl="~/Resimler/onay.png" BorderStyle="None" align="absmiddle" /></a>
                                    <a href="DuyuruYorumlar.aspx?YorumOnay=false&guncelleDuyuruYorumID=<%#Eval("DUYURUYORUMID")%>"><asp:Image ID="imgDuyuruYorumOnayIptal" runat="server" 
                                        ImageUrl="~/Resimler/onayiptal.png" BorderStyle="None" align="absmiddle" /></a>
                                </td>
                            </tr>
                            <tr height="40px">

                            <td width="10%" align="left">
                                    DUYID:<%#Eval("DUYURUID").ToString()%>
                                </td>
                                <td width="20%" align="left">
                                    <%#Eval("DUYURUADSOYAD").ToString()%>
                                </td>
                                <td width="20%" align="left">
                                   <%#Eval("DUYURUEMAIL").ToString()%>
                                </td>
                                <td width="50%" align="center">
                                   <%#Eval("DUYURUYORUM").ToString()%>
                                </td>
                                <td width="10%" align="right">
                                   <%#Eval("DUYURUONAY").ToString()%>
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

