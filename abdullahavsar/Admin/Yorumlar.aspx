<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.master" AutoEventWireup="true" CodeFile="Yorumlar.aspx.cs" Inherits="Admin_Yorumlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <table align="center" cellspacing="1" width="100%">
        <tr>
            <td colspan="2">
                <asp:DataList ID="dlGelenYorumlar" runat="server" BackColor="#DEBA84"  Width="100%"
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    CellSpacing="2" GridLines="Both">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <ItemTemplate>
                        <table align="center" cellspacing="1" width="100%">
                            <tr align="right">
                                <td colspan="6" align="right" bgColor="#80ff00" >
                                     <a href="Yorumlar.aspx?silinecekYorumID=<%#Eval("YORUMID")%>"><asp:Image ID="imgYorumSil" runat="server" ImageUrl="~/Resimler/delete.png" BorderStyle="None" align="absmiddle" /></a>
                                   <a href="Yorumlar.aspx?YorumOnay=true&MakaleId=<%#Eval("MAKALEID")%>"><asp:Image ID="imgOnay" runat="server" ImageUrl="~/Resimler/onay.png" BorderStyle="None" align="absmiddle" /></a>
                                    <a href="Yorumlar.aspx?YorumOnay=false&MakaleId=<%#Eval("MAKALEID")%>"><asp:Image ID="imgOnayIptal" runat="server" 
                                        ImageUrl="~/Resimler/onayiptal.png" BorderStyle="None" align="absmiddle" /></a>
                                </td>
                            </tr>
                            <tr height="40px">
                                <td width="5%" align="left" >
                                   ID:<%#Eval("YORUMID").ToString()%></td>
                                <td width="30%" align="center">
                                <a href="YorumDetay.aspx?YorumID=<%#Eval("YORUMID")%>&makaleID=<%#Eval("MAKALEID")%>" style="text-decoration:none;color:Red"><%#Eval("YORUMBASLIK").ToString()%></a> 
                                </td>
                                <td width="20%" align="left">
                                    <%#Eval("YORUMEKLEYENKISI").ToString()%>
                                </td>
                                <td width="30%" align="center">
                                   <%#Eval("YORUMEKLEYENEMAIL").ToString()%>
                                </td>
                                <td width="10%" align="center">
                                   <%#Eval("YORUMONAY").ToString()%>
                                </td>
                                <td width="5%" align="right">
                                   MAKID:<%#Eval("MAKALEID").ToString()%></td>
                                
                            </tr>
                        </table>
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

