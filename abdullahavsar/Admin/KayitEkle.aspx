<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KayitEkle.aspx.cs" Inherits="Admin_KayitEkle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
    <link href="../Styles/AdminStyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function isBosmu() {
            var ad = document.getElementById('<%=txtAdi.ClientID %>').value;
            var soyad = document.getElementById('<%=txtSoyadi.ClientID %>').value;
            var sifre = document.getElementById('<%=txtSifre.ClientID %>').value;
            var gorevi = document.getElementById('<%=txtGorevi.ClientID %>').value;
            var email = document.getElementById('<%=txtEmail.ClientID %>').value;
            var dogrulamaKodu = document.getElementById('<%=txtDogrulamaKodGiris.ClientID %>').value;
            
            if(ad=="" || soyad=="" || sifre=="" || gorevi=="" || email=="" || dogrulamaKodu=="")
                alert('Lütfen Boş Geçmeyiniz.');
         }
    </script>

    <style type="text/css">
        #form1
        {
            height: 538px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server" >
        
    <table align="left" cellspacing="1" width="500px">
        <tr>
            <td colspan="2"  class="kullaniciEkleYan" bgcolor="#FFFF99">
                <asp:Label ID="lblBilgilendirme" runat="server" Text="lblBilgilendirme" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" bgColor="#ff0000">
                <asp:Label ID="Label1" runat="server" Text="KULLANICI EKLE MENÜSÜ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="kullaniciEkleYan" align="right">
                <asp:Label ID="Label2" runat="server" Text="ADI"></asp:Label>
            &nbsp;&nbsp;
            </td>
            <td >
                &nbsp;<asp:TextBox ID="txtAdi" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  class="kullaniciEkleYan" align="right">
                <asp:Label ID="Label3" runat="server" Text="SOYADI"></asp:Label>
            &nbsp;&nbsp;
            </td>
            <td>
                &nbsp;<asp:TextBox ID="txtSoyadi" runat="server"   Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="kullaniciEkleYan" align="right">
                <asp:Label ID="Label4" runat="server" Text="EMAIL"></asp:Label>
            &nbsp;&nbsp;
            </td>
            <td>
                &nbsp;<asp:TextBox ID="txtEmail" runat="server"  Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  class="kullaniciEkleYan" align="right">
                <asp:Label ID="Label8" runat="server" Text="ŞİFRE"></asp:Label>
            &nbsp;&nbsp;
            </td>
            <td>
                &nbsp;<asp:TextBox ID="txtSifre" runat="server"  Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  class="kullaniciEkleYan" align="right">
                &nbsp;
                <asp:Label ID="Label5" runat="server" Text="GÖREVİ"></asp:Label>
            &nbsp;&nbsp;
            </td>
            <td>
                &nbsp;<asp:TextBox ID="txtGorevi" runat="server"  Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="kullaniciEkleYan" align="right">
                &nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" Text="RESİM"></asp:Label>
            &nbsp;&nbsp;
            </td>
            <td>
                &nbsp;<asp:Image 
                    ID="imgResim" runat="server" Height="100px" Width="130px" 
                    ImageAlign="Middle" />
                <br />
                &nbsp;<asp:FileUpload ID="fUAdminFotoEkle" runat="server" Width="320px" />
                <br />
&nbsp;<asp:Button ID="btnResimYukle" runat="server" onclick="btnResimYukle_Click" 
                    Text="RESİM YÜKLE" />
            </td>
        </tr>
        <tr>
            <td class="kullaniciEkleYan" align="right" >
                &nbsp;<asp:Label ID="Label7" runat="server" Text="AÇIKLAMA" ></asp:Label>
            &nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="txtAciklama" runat="server" Height="120px"  Width="320px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="kullaniciEkleYan" align="right">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="kullaniciEkleYan" align="right" >
                <asp:Label ID="Label9" runat="server" Text="KOD GİRİNİZ"></asp:Label>
            &nbsp;&nbsp;
            </td>
            <td class="kullaniciEkleYan" align="left" align="absmiddle">
                <asp:Label ID="lblDogrulamaKod1" runat="server" Text="9"></asp:Label>
&nbsp;&nbsp;
                <asp:Label ID="lblDogrulamaKod2" runat="server" Text="+"></asp:Label>
&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblDogrulamaKod3" runat="server" Text="15"></asp:Label>
&nbsp;&nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td class="kullaniciEkleYan" align="right" >
                &nbsp;</td>
            <td class="kullaniciEkleYan" align="left" align="absmiddle">
                <asp:TextBox ID="txtDogrulamaKodGiris" runat="server" Width="111px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  class="kullaniciEkleYan" align="right">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnKullaniciEkle"  runat="server" Text="KULLANICI EKLE" 
                    Width="137px"  OnClientClick="isBosmu();" 
                    onclick="btnKullaniciEkle_Click" />
            </td>
        </tr>
    </table>
        
    </form>
</body>
</html>
