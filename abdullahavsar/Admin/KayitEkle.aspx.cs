using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Drawing;
using System.Data;
using System.Threading;

public partial class Admin_KayitEkle : System.Web.UI.Page
{

    DataBase DB = new DataBase();

    Random rnd = new Random();
    int islemDegerSonuc = 0;
    bool adminGuncelleOnay = false;
    int adminGuncelleId = 0;
    byte[] resim = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblDogrulamaKod1.Text = rnd.Next(100, 150).ToString();
            lblDogrulamaKod3.Text = rnd.Next(1, 99).ToString();
            lblDogrulamaKod2.Text = "+";
        }

        adminGuncelleId=Convert.ToInt16(Request.QueryString["adminGuncelleId"]);
        adminGuncelleOnay = Convert.ToBoolean(Request.QueryString["adminGuncelleOnay"]);
        if (Page.IsPostBack)
            return;
        if (adminGuncelleOnay && adminGuncelleId>0)
        {
            DataRow drGelenAdmin = DB.getSingleRow("select * from ADMINLER WHERE ADMINID="+adminGuncelleId);
            if (drGelenAdmin!=null)
            {
                txtAdi.Text=drGelenAdmin["AD"].ToString();
                txtSoyadi.Text = drGelenAdmin["SOYAD"].ToString();
                txtSifre.Text = drGelenAdmin["SIFRE"].ToString();
                txtGorevi.Text = drGelenAdmin["GOREVI"].ToString();
                txtEmail.Text = drGelenAdmin["EMAIL"].ToString();
                txtAciklama.Text = drGelenAdmin["ACIKLAMA"].ToString();
                
            }
        }
    }
    private bool islemCalistir()
    {
        int sayi1 = Convert.ToInt16(lblDogrulamaKod1.Text);
        int sayi2 = Convert.ToInt16(lblDogrulamaKod3.Text);

        if (txtDogrulamaKodGiris.Text == "")
            txtDogrulamaKodGiris.Text = "0";

        islemDegerSonuc = sayi1 + sayi2;

        if (islemDegerSonuc == Convert.ToInt16(txtDogrulamaKodGiris.Text))
            return true;
        else
            return false;
    }
    private void adminFotoEkle()
    {
        if (fUAdminFotoEkle.HasFile)
            {
                resim = fUAdminFotoEkle.FileBytes;
                fUAdminFotoEkle.SaveAs(Server.MapPath("../Resimler/"+fUAdminFotoEkle.FileName));
                imgResim.ImageUrl ="../Resimler/"+fUAdminFotoEkle.FileName;
                MemoryStream ms = new MemoryStream(resim);
                ms.Read(resim, 0, resim.Length);
                ms.Close();
            }
        
       
    }

    protected void btnKullaniciEkle_Click(object sender, EventArgs e)
    {
        if (!adminGuncelleOnay)
        {
            if (islemCalistir())
            {
                lblBilgilendirme.Visible = true;
                adminFotoEkle();
                string sqlSorgu = "INSERT INTO ADMINLER (AD,SOYAD,EMAIL,SIFRE,GOREVI,RESIM,ACIKLAMA,EKLEYEN,EKLEMETARIHI)" +
               "VALUES ('" + txtAdi.Text.Trim() + "','" + txtSoyadi.Text.Trim() + "','" + txtEmail.Text.Trim() + "','" + txtSifre.Text.Trim() + "','" + txtGorevi.Text.Trim() + "','" + resim + "','" + txtAciklama.Text.Trim() + "','0','" + Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.', '-')) + "')";
                int index = DB.cmd(sqlSorgu);
                if (index > 0)
                {
                    lblBilgilendirme.ForeColor = Color.Green;
                    lblBilgilendirme.Text = "KAYIT EKLEME BAŞARILI.";
                }
                else
                {
                    lblBilgilendirme.ForeColor = Color.Red;
                    lblBilgilendirme.Text = "KAYIT EKLEME BAŞARISIZ.";
                }

            }
        }
        else 
        {

                lblBilgilendirme.Visible = true;
                string sqlSorgu = "UPDATE ADMINLER SET AD='"+txtAdi.Text.Trim()+"',SOYAD='"+txtSoyadi.Text.Trim()+"',EMAIL='"+txtEmail.Text.Trim()+"',SIFRE='"+txtSifre.Text.Trim()+"',GOREVI='"+txtGorevi.Text.Trim()+"',ACIKLAMA='"+txtAciklama.Text.Trim()+"',GUNCELLEYEN='1',GUNCELLEMETARIHI='"+Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.','-'))+"' WHERE ADMINID="+adminGuncelleId;
                int index = DB.cmd(sqlSorgu);
                if (index > 0)
                {
                    lblBilgilendirme.ForeColor = Color.Green;
                    lblBilgilendirme.Text = "KAYIT GÜNCELLEME BAŞARILI.";
                    Thread.Sleep(500);
                    Response.Redirect("Adminler.aspx");
                }
                else
                {
                    lblBilgilendirme.ForeColor = Color.Red;
                    lblBilgilendirme.Text = "KAYIT GÜNCELLEME BAŞARISIZ.";
                }

            
        }
    }
    protected void btnResimYukle_Click(object sender, EventArgs e)
    {
        adminFotoEkle();
    }
}