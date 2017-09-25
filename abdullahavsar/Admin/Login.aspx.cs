using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Admin_Login : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGiris_Click(object sender, EventArgs e)
    {
        if (DB.login(txtKullaniciAdi.Text.Trim(), txtKullaniniciSifre.Text.Trim()))
        {
            string gelenAd = DB.getSingleCell("select AD from ADMINLER where EMAIL='"+txtKullaniciAdi.Text.Trim()+"' and SIFRE='"+txtKullaniniciSifre.Text.Trim()+"'");
            string gelenSoyad = DB.getSingleCell("select SOYAD from ADMINLER where EMAIL='" + txtKullaniciAdi.Text.Trim() + "' and SIFRE='" + txtKullaniniciSifre.Text.Trim() + "'");
            int gelenID = Convert.ToInt16(DB.getSingleCell("select ADMINID from ADMINLER where EMAIL='" + txtKullaniciAdi.Text.Trim() + "' and SIFRE='" + txtKullaniniciSifre.Text.Trim() + "'"));
            Session.Add("kulid", gelenID);
            Session.Add("kuladi",gelenAd);
            Session.Add("kulsoyad", gelenSoyad);
            Session.Add("kulemail", txtKullaniciAdi.Text.Trim());
            Response.Redirect("Default.aspx");
        }
        else 
        {
            lblBilgi.Visible = true;
            lblBilgi.ForeColor = Color.Red;
            lblBilgi.Text = "GİRİŞ İŞLEMİ BAŞARISIZLIK İLE SONUÇLANDI.";
        }

    }
}