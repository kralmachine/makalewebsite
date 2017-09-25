<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Anket.ascx.cs" Inherits="Site_Anket" %>





<table cellspacing="1" width="300px" height="300px" align="left"  bgColor="#D7EFF7" >
    <tr>
        <td valign="top">
            <table align="center" cellspacing="1" width="100%">
                <tr>
                    <td height="25px" align="center" bgColor="#465c71" >
                            <asp:Label ID="Label4" runat="server" Font-Names="Verdana" Font-Size="Smaller" 
                                Text="Anket" ForeColor="#00C663" Font-Bold="True" 
                    Font-Strikeout="False"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlAnketSoru" runat="server" Visible="true">
                            <table align="center" cellpadding="1" width="100%">
                                 <tr align="center">
                                        <td><asp:Label ID="lblAnketGelenSoru" runat="server"  align="center"
                                                Text='<%# Eval("ANKETSORU") %>'  Font-Names="Verdana" Font-Size="Small" 
                                                Font-Bold="True" ></asp:Label>
                                                <hr />
                                            </td>
                                    </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rdCevap1" runat="server"  Font-Names="Verdana" Font-Size="Smaller"  GroupName="rdGroupName" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rdCevap2" runat="server" Font-Names="Verdana" Font-Size="Smaller" GroupName="rdGroupName"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rdCevap3" runat="server" Font-Names="Verdana" Font-Size="Smaller" GroupName="rdGroupName"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rdCevap4" runat="server" Font-Names="Verdana" Font-Size="Smaller"  GroupName="rdGroupName" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rdCevap5" runat="server" Font-Names="Verdana" Font-Size="Smaller" GroupName="rdGroupName"  />
                        <br />
                        <br />
                    </td>
                </tr>
                
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlAnketSonuclar" runat="server" Visible="False">
                            <table align="center" cellspacing="1" width="100%">
                                <tr>
                                    <td width="70%">
                                        <asp:Image ID="imgGelenCevap1" runat="server" BorderStyle="None" 
                                            ImageAlign="AbsMiddle" ImageUrl="~/Resimler/onay.png" />
                                        &nbsp;<asp:Label ID="lblGelenCevap1" runat="server" Font-Names="Verdana" 
                                            Font-Size="Smaller" Text="Label"></asp:Label>
                                    </td>
                                    <td align="center" width="30%">
                                        <asp:Label ID="lblGelenCevapOySayisi1" runat="server" Font-Names="Verdana" 
                                            Font-Size="Smaller" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgGelenCevap2" runat="server" BorderStyle="None" 
                                            ImageAlign="AbsMiddle" ImageUrl="~/Resimler/onay.png" />
                                        &nbsp;<asp:Label ID="lblGelenCevap2" runat="server" Font-Names="Verdana" 
                                            Font-Size="Smaller" Text="Label"></asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lblGelenCevapOySayisi2" runat="server" Font-Names="Verdana" 
                                            Font-Size="Smaller" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgGelenCevap3" runat="server" BorderStyle="None" 
                                            ImageAlign="AbsMiddle" ImageUrl="~/Resimler/onay.png" />
                                        &nbsp;<asp:Label ID="lblGelenCevap3" runat="server" Font-Names="Verdana" 
                                            Font-Size="Smaller" Text="Label"></asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lblGelenCevapOySayisi3" runat="server" Font-Names="Verdana" 
                                            Font-Size="Smaller" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgGelenCevap4" runat="server" BorderStyle="None" 
                                            ImageAlign="AbsMiddle" ImageUrl="~/Resimler/onay.png" />
                                        &nbsp;<asp:Label ID="lblGelenCevap4" runat="server" Font-Names="Verdana" 
                                            Font-Size="Smaller" Text="Label"></asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lblGelenCevapOySayisi4" runat="server" Font-Names="Verdana" 
                                            Font-Size="Smaller" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgGelenCevap5" runat="server" BorderStyle="None" 
                                            ImageAlign="AbsMiddle" ImageUrl="~/Resimler/onay.png" />
                                        &nbsp;<asp:Label ID="lblGelenCevap5" runat="server" Font-Names="Verdana" 
                                            Font-Size="Smaller" Text="Label"></asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lblGelenCevapOySayisi5" runat="server" Font-Names="Verdana" 
                                            Font-Size="Smaller" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                
                <tr>
                   <td height="25px" align="center" bgColor="#465c71"  align="right">
                           
                        <asp:Button ID="btnOyver" runat="server" Text="Oy Ver" 
                            onclick="btnOyver_Click"  />
                           
                        </td>
                </tr>
               
                <tr>
                   <td align="center"   align="right">
                              <hr /> 
                    </td>
                </tr

                 <tr>
                   <td height="25px" align="center"   align="right">
                             
                       <table align="center" cellspacing="1" width="100%">
                           <tr>
                               <td align="center">
                               
                                   <asp:Image ID="imgGorunenResim" runat="server" Height="175px" Width="150px" 
                                       ImageUrl="~/Resimler/KRALMACHINE.png" />
                                
                                
                                </td>
                           </tr>
                       </table>
                             
                    </td>
                </tr>
               
            </table>
            </td>
    </tr>
    </table>

