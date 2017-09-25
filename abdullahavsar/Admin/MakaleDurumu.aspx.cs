using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;

public partial class Admin_MakaleDurumu : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    string gelenKategoriAd = "";
    Label lblBilgi = null;

    int index = 0;
    string gelenResim = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["kulemail"] == null || Convert.ToInt16(Session["kulid"]) == 0)
            Response.Redirect("Login.aspx");
        else
        {
            lblBilgi= this.Master.FindControl("lblGelenAdmin") as Label;
            lblBilgi.Text = Session["kuladi"].ToString() + " " + Session["kulsoyad"].ToString();
        }

        gelenKategoriAd = DB.getSingleCell("SELECT KATEGORIAD FROM KATEGORILER WHERE KATEGORIID=" + Request.QueryString["kategoriId"]);
        Label lblMasterEtiket = (Label)Master.FindControl("lblMasterEtiket");
        lblMasterEtiket.Text = "MAKALE YAZIMI ('"+gelenKategoriAd+"')";

        if (!Page.IsPostBack)
            tumResimleriCek();


        gelenResim = "~/Resimler/" + ddLTumKategoriList.SelectedItem;
        if (Page.IsPostBack)
            return;
        txtKategoriAd.Enabled = false;
        txtKategoriAd.Text = gelenKategoriAd;
        txtMakaleYazanKisi.Enabled = false;
        txtMakaleYazanKisi.Text = lblBilgi.Text;

    }
    private void temizle() 
    {
        txtCevapSayisi.Text = "";
        txtMakaleBaslik.Text = "";
        txtMakaleIcerik.Text = "";
        txtMakaleOzet.Text = "";
        txtOkunmaSayisi.Text = "";
        txtSoruSayisi.Text = "";
        txtYorumSayisi.Text = "";
        chOnay.Checked = false;
        chVitrin.Checked = false;
        index = 0;
        gelenResim = "";
    }
    protected void btnMakaleKaydet_Click(object sender, EventArgs e)
    {

        if (gelenResim.Length > 0)
        {
            index = DB.cmd("INSERT INTO MAKALEDURUM (KATEGORIAD,KATEGORIID,KATEGORIRESIM,MAKALEBASLIK,MAKALEOZET,MAKALEYAZAN,MAKALEICERIK,ONAY,VITRIN,OKUNMASAYISI,SORUSAYISI,CEVAPSAYISI,YORUMSAYISI,EKLEYEN,EKLEMETARIHI) VALUES " +
          "('" + txtKategoriAd.Text.Trim() + "'," + Request.QueryString["kategoriId"] + ",'" + gelenResim + "','" + txtMakaleBaslik.Text.Trim() + "','" + txtMakaleOzet.Text.Trim() + "','" + txtMakaleYazanKisi.Text.Trim() + "','" + txtMakaleIcerik.Text.Trim() + "','" + chOnay.Checked + "','" + chVitrin.Checked + "'," + txtOkunmaSayisi.Text.Trim() + "," + txtSoruSayisi.Text.Trim() + "," + txtCevapSayisi.Text.Trim() + "," + txtYorumSayisi.Text.Trim() + "," + Session["kulid"] + ",'" + Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.', '-')) + "') ");
            if (index > 0)
            {
                lblMakaleDurumBilgilendirme.Visible = true;
                lblMakaleDurumBilgilendirme.ForeColor = Color.Green;
                lblMakaleDurumBilgilendirme.Text = "MAKALE KAYIT BAŞARILI BİR ŞEKİLDE EKLENMİŞTİR.";
                int gelenKategoriMakaleSayisi = Convert.ToInt16(DB.getSingleCell("select MAKALESAYISI from KATEGORILER where KATEGORIID=" + Request.QueryString["kategoriId"]));
                gelenKategoriMakaleSayisi++;
                DB.cmd("UPDATE KATEGORILER SET MAKALESAYISI=" + gelenKategoriMakaleSayisi + " where KATEGORIID=" + Request.QueryString["kategoriId"]);
                temizle();
            }
            else
            {
                lblMakaleDurumBilgilendirme.Visible = true;
                lblMakaleDurumBilgilendirme.ForeColor = Color.Red;
                lblMakaleDurumBilgilendirme.Text = "MAKALE KAYIT BAŞARISIZ BİR ŞEKİLDE EKLENMEMİŞTİR.";
            }
        }
        else
        {
            lblMakaleDurumBilgilendirme.Visible = true;
            lblMakaleDurumBilgilendirme.ForeColor = Color.Red;
            lblMakaleDurumBilgilendirme.Text = "MAKALE KAYIT EKLEMEK İÇİN LÜTFEN FOTOĞRAF YOLU SEÇİNİZ.";
        }
      
    }
    private void tumResimleriCek() 
    {
        ddLTumKategoriList.Items.Clear();

        DirectoryInfo klasordekiResimler = new DirectoryInfo(Server.MapPath("~/Resimler"));
        foreach (FileInfo resim in klasordekiResimler.GetFiles())
        {
            ddLTumKategoriList.Items.Add(resim.Name);
        }
    }
    protected void ddLTumKategoriList_SelectedIndexChanged(object sender, EventArgs e)
    {
        imgKategoriResim.ImageUrl = "~/Resimler/" + ddLTumKategoriList.SelectedItem;
        gelenResim="~/Resimler/" + ddLTumKategoriList.SelectedItem;
    }
    protected void btnKategoriMakaleResimYukle_Click(object sender, EventArgs e)
    {
        if (fuKategoriResimMakaleResim.HasFile)
        {
            if (fuKategoriResimMakaleResim.PostedFile.ContentType == "image/png")
            {
                fuKategoriResimMakaleResim.SaveAs(Server.MapPath("~/Resimler/" + fuKategoriResimMakaleResim.FileName));
                imgKategoriResim.ImageUrl = "~/Resimler/" + fuKategoriResimMakaleResim.FileName;
                tumResimleriCek();
            }
        }
    }
}