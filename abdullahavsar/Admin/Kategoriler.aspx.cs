using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Kategoriler : System.Web.UI.Page
{
    int index = 0;
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
        lblMasterEtiket.Text = "KATEGORİLER";

        kategoriList();
    }
    private void kategoriList() 
    {
        istatistikDurumGuncelle();

        DataTable dtgelenKategoriler = DB.getTable("select * from KATEGORILER");
        rpKategoriler.DataSource = dtgelenKategoriler;
        rpKategoriler.DataBind();
    }
    private void istatistikDurumGuncelle() 
    {
        int gelenSatirSayisi = Convert.ToInt16(DB.getSingleCell("select count(*) from MAKALEDURUM"));
        int[] gelenKategoriler=new int[gelenSatirSayisi];
        SqlDataReader reader = new SqlCommand("select * from MAKALEDURUM",DB.connection()).ExecuteReader();
        int i = 0;
        while (reader.Read())
        {
            gelenKategoriler[i]=Convert.ToInt16(reader["KATEGORIID"]);
            i++;
        }
        reader.Close();
        reader.Dispose();

        for (int j = 0; j < gelenKategoriler.Length; j++)
        {

           int okunmaSayisi=Convert.ToInt16(DB.getSingleCell("select sum(OKUNMASAYISI) OKUNMASAYISI FROM MAKALEDURUM WHERE KATEGORIID="+gelenKategoriler[j]));
           int soruSayisi = Convert.ToInt16(DB.getSingleCell("select sum(SORUSAYISI) SORUSAYISI FROM MAKALEDURUM WHERE KATEGORIID=" + gelenKategoriler[j]));
           int cevapSayisi = Convert.ToInt16(DB.getSingleCell("select sum(CEVAPSAYISI) CEVAPSAYISI FROM MAKALEDURUM WHERE KATEGORIID=" + gelenKategoriler[j]));
           int yorumSayisi = Convert.ToInt16(DB.getSingleCell("select sum(YORUMSAYISI) YORUMSAYISI FROM MAKALEDURUM WHERE KATEGORIID=" + gelenKategoriler[j]));

           DB.cmd("UPDATE KATEGORILER SET OKUNMASAYISI="+okunmaSayisi+" where KATEGORIID="+gelenKategoriler[j]);
           DB.cmd("UPDATE KATEGORILER SET SORUSAYISI=" + soruSayisi + " where KATEGORIID=" + gelenKategoriler[j]);
           DB.cmd("UPDATE KATEGORILER SET CEVAPSAYISI=" + cevapSayisi + " where KATEGORIID=" + gelenKategoriler[j]);
           DB.cmd("UPDATE KATEGORILER SET YORUMSAYISI=" + yorumSayisi + " where KATEGORIID=" + gelenKategoriler[j]);
        }
    }
    private void temizle() 
    {
        txtKategoriAciklama.Text = "";
        txtKategoriAd.Text = "";
        index = 0;
    }
    protected void btnKategoriEkle_Click(object sender, EventArgs e)
    {
        if (txtKategoriAd.Text.Trim()!="" && txtKategoriAciklama.Text.Trim()!="")
        {
            index = DB.cmd("INSERT INTO KATEGORILER(KATEGORIAD,KATEGORIACIKLAMA,MAKALESAYISI,YORUMSAYISI,OKUNMASAYISI,SORUSAYISI,CEVAPSAYISI,EKLEYEN,EKLEMETARIHI) VALUES"+
                "('" + txtKategoriAd.Text.Trim() + "','" + txtKategoriAciklama.Text.Trim() + "','0','0','0','0','0'," + Session["kulid"] + ",'" + Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.', '-')) + "')");
            if (index > 0)
            {
                kategoriList();
                temizle();
            }
        }
    }
}