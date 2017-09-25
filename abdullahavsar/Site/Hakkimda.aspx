<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Site.master" AutoEventWireup="true" CodeFile="Hakkimda.aspx.cs" Inherits="Site_Hakkimda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table align="center" cellspacing="1" width="100%" rules="rows">
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
        <tr bgColor="#D7EFF7" >
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
                <asp:DataList ID="dlResimler" runat="server" CellPadding="4" Width="100%" RepeatColumns="3" 
                    RepeatDirection="Horizontal" BackColor="#D7EFF7"  BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" GridLines="Horizontal" 
                     ForeColor="Black">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        <table align="center" width="100%">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="imgGelenHakkimdaResim"  Width="75px" Height="75px" runat="server" ImageUrl='<%#Eval("RESIMYOL")%>'/>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
            </td>
        </tr>
        <tr bgColor="#80ff00">
            <td colspan="5" align="center">
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

