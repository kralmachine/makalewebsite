<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/AdminStyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        function popup() {
            window.open("http://localhost:54802/abdullahavsar/Admin/KayitEkle.aspx", '_blank','windowOpenTab', 'scrollbars=1,resizable=0,width=1000,height=580,left=0, top=0');
        }

        function isBosmu() {
            var txtKulAd = document.getElementById('<%=txtKullaniciAdi.ClientID %>').value;
            var txtKulSifre = document.getElementById('<%=txtKullaniniciSifre.ClientID %>').value;
         if (txtKulAd.toString() == "" || txtKulSifre.toString() == "")
             alert('LÜTFEN KULLANICI ADI VEYA ŞİFREYİ BOŞ GEÇMEYİNİZ.');
         }

    </script>

</head>
<body>
    <form id="form1" runat="server" >
            <div style="height: 327px">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
    <table cellspacing="1"  cellpadding="1px" cellspacing="1px" border="0.8px" align="center" bgcolor="#D7EFF7" 
                    >
        <tr>
            <td colspan="2" >
                <asp:Label ID="lblBilgi" runat="server" Font-Bold="True" Font-Names="Verdana" 
                    Font-Size="Smaller" Text="lblBilgi" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right">
                KULLANICI ADI</td>
            <td>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtKullaniciAdi" runat="server" Width="250px" Font-Bold="True" 
                    Font-Names="Verdana" Font-Size="10pt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                ŞİFRE</td>
            <td>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtKullaniniciSifre" runat="server" Width="250px" 
                    Font-Names="Verdana" Font-Size="10pt" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;
                <asp:Button ID="btnGiris" runat="server" Text="GİRİŞ" Width="100px" 
                    OnClientClick="isBosmu();" onclick="btnGiris_Click" />
            </td>
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;
                <asp:HyperLink ID="hypKayitEkle" onClick="popup()" runat="server" 
                    ForeColor="#00C663">Kayıt Ekle</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="hypSifremiUnuttum" runat="server" ForeColor="#00C663">Şifremi Unuttum</asp:HyperLink>
            </td>
        </tr>
       
        <tr>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
            </div>
    </form>
</body>
</html>
