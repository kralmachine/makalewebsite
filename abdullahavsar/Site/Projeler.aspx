<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Site.master" AutoEventWireup="true" CodeFile="Projeler.aspx.cs" Inherits="Site_Projeler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Repeater ID="rpAnaKategori" runat="server" 
                    onitemdatabound="rpAnaKategori_ItemDataBound">
                <ItemTemplate>
                <table width="100%">
                <tr align="center"  bgColor="#D7EFF7" >
                            <td align="left"><asp:Label ID="lblGelenHakkimdaAdSoyad" runat="server" Text=<%#Eval("ADSOYAD")%> Font-Bold="true" Font-Names="Verdana" Font-Size="Small"></asp:Label>
                                <hr />
                            </td>
                        </tr>
                </table>
            <asp:Repeater ID="rpAltKategori" runat="server"> 
              <ItemTemplate>  
               <table align="center" cellspacing="1" width="100%">
                        <tr>
                          <td colspan="3" width="5%"><asp:Image ID="imgProjeImage" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Resimler/notepad.png" BorderStyle="None"/></td><td colspan="3" width="95%" align="left"><asp:Label ID="Label1" runat="server" Text='<%#Eval("PROJEBASLIK")%>'  Font-Names="Verdana" Font-Bold="true" Font-Size="Smaller"></asp:Label></td>
                        </tr>
                           
                        </table>
              </ItemTemplate>
  </asp:Repeater>
</ItemTemplate>
</asp:Repeater>

</asp:Content>

