using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_Duyurular : System.Web.UI.Page
{
    static string resimYol = "";
    DataBase DB = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["kulemail"] == null || Convert.ToInt16(Session["kulid"]) == 0)
            Response.Redirect("Login.aspx");
        else
        {
            Label lblBilgi = this.Master.FindControl("lblGelenAdmin") as Label;
            lblBilgi.Text = Session["kuladi"].ToString() + " " + Session["kulsoyad"].ToString();
        }
        Label lblMasterEtiket = (Label)Master.FindControl("lblMasterEtiket");
        lblMasterEtiket.Text = "DUYURULAR";

       
        if (Page.IsPostBack)
            return;
        resimYol = "~/Admin/Duyurular/" + fuDuyuruResimEkle.FileName;
    }
    protected void btnDuyuruFotoEkle_Click(object sender, EventArgs e)
    {
        if (fuDuyuruResimEkle.HasFile)
        {
            fuDuyuruResimEkle.SaveAs(Server.MapPath("~/Admin/Duyurular/" + fuDuyuruResimEkle.FileName));
            imgDuyuruResim.ImageUrl = "~/Admin/Duyurular/" + fuDuyuruResimEkle.PostedFile.FileName;
            resimYol = "~/Admin/Duyurular/" + fuDuyuruResimEkle.FileName;
        }
    }
    private bool isBosmu() 
    {
        if (txtDuyuruBaslik.Text.Trim() != "" || txtDuyuruDetay.Text.Trim() != "" || txtDuyuruOzet.Text.Trim() != "")
            return true;
        else
            return false;
    }
    protected void btnDuyuruEkle_Click(object sender, EventArgs e)
    {
        if (isBosmu())
        {
            int index = DB.cmd("INSERT INTO DUYURULAR (DUYURUBASLIK,DUYURUOZET,DUYURUDETAY,DUYURURESIM,DUYURUONAY,DUYURUEKLEYEN,DUYURUEKLEMETARIHI) VALUES "+
                "('"+txtDuyuruBaslik.Text.Trim()+"','"+txtDuyuruOzet.Text.Trim()+"','"+txtDuyuruDetay.Text.Trim()+"','"+resimYol+"','"+chcDuyuruOnay.Checked+"',"+Session["kulid"]+",'"+Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.','-'))+"')");
            if (index > 0)
            {
                temizle();
                lblDuyuruEkleBilgilendirme.Text = "KAYIT EKLEME BAŞARILI BİR ŞEKİLDE GERÇEKLEŞTİ.";
            }
            else
                File.Delete(Server.MapPath("~/Admin/Duyurular/"+fuDuyuruResimEkle.FileName));
        }else
            lblDuyuruEkleBilgilendirme.Text = "KAYIT EKLEMEK İÇİN LÜTFEN BOŞ GEÇMEYİNİZ.";
    }

    private void temizle()
    {
        txtDuyuruBaslik.Text = "";
        txtDuyuruDetay.Text = "";
        txtDuyuruOzet.Text = "";
        resimYol = "";
        imgDuyuruResim.ImageUrl = "";
    }
}