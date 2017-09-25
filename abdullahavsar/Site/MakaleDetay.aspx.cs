using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Threading;

public partial class Site_MakaleDetay : System.Web.UI.Page
{
    //int gelenMakaleID = 0;
    string gelenMakBaslik;
    int gelenMakaleid;
    DataBase DB = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        gelenMakaleid =Convert.ToInt16(Page.RouteData.Values["MAKALEID"].ToString());
        gelenMakBaslik =Page.RouteData.Values["MAKALEBASLIK"].ToString();

       // gelenMakaleID = Convert.ToInt16(Request.QueryString["gelenMakaleID"]);

        if (gelenMakaleid > 0)
        {
            DataRow getDataMakelRow = DB.getSingleRow("select * from MAKALEDURUM WHERE MAKALEID=" + gelenMakaleid);
            if (getDataMakelRow != null)
            {
                lblGelenMakaleBaslik.Text = getDataMakelRow["MAKALEBASLIK"].ToString();
                ltGelenMakaleDetay.Text = getDataMakelRow["MAKALEICERIK"].ToString();
            }
        }

        gelenMakaleIcinYorumlar(gelenMakaleid);
    }

    private void gelenMakaleIcinYorumlar(int gelenMakaleID)
    {
        if (gelenMakaleID>0)
        {
            DataTable getTableGelenMakaleYorumlar = DB.getTable("SELECT * FROM YORUMLAR WHERE YORUMONAY='true' and  MAKALEID=" + gelenMakaleid + " ORDER BY YORUMID DESC");
            dlGelenMakaleIcinYorumlar.DataSource = getTableGelenMakaleYorumlar;
            dlGelenMakaleIcinYorumlar.DataBind();
        }
    }
    protected void btnYorumGonder_Click(object sender, EventArgs e)
    {
        if (isBosmu())
        {
            int index = DB.cmd("INSERT INTO YORUMLAR (MAKALEID,YORUMBASLIK,YORUMACIKLAMA,YORUMEKLEYENKISI,YORUMEKLEYENEMAIL,YORUMONAY,YORUMONAYONAYTARIHI) VALUES "+
                "(" + gelenMakaleid + ",'" + txtAdSoyad.Text.Trim() + "','" + txtYorum.Text.Trim() + "','" + txtAdSoyad.Text.Trim() + "','" + txtEmail.Text.Trim() + "','false','" + Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.', '-')) + "')");
            if (index > 0)
            {
                lblDuyuruYorumBilgilendirme.Text = "YORUM EKLEME İŞLEMİ BAŞARILI BİR ŞEKİLDE GERÇEKLEŞTİ.LÜTFEN YORUM İÇİN ONAY BEKLEYİNİZ.";
                temizle();
                Response.Redirect("MakaleDetay.aspx?gelenMakaleID=" + gelenMakaleid);
            }
        }
    }
    private void temizle()
    {
        txtEmail.Text = "";
        txtAdSoyad.Text = "";
        txtYorum.Text = "";
    }
    private bool isBosmu() 
    {
        if(txtAdSoyad.Text.Trim()!="" ||txtEmail.Text.Trim()!="" || txtYorum.Text.Trim()!=null)
            return true;
        else return false;
    }
}