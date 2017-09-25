using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Threading;

public partial class Site_DuyuruDetay : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    int gelenDuyuruID = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
        gelenDuyuruID = Convert.ToInt16(Request.QueryString["gelenDuyuruID"]);
        if (gelenDuyuruID > 0) 
        {
            DataRow getDataRowDuyuru = DB.getSingleRow("SELECT * FROM VIEW_DUYURU_ADMIN WHERE DUYURUID="+gelenDuyuruID);
            if (getDataRowDuyuru != null) 
            {
                ltGelenDuyuruDetay.Text=getDataRowDuyuru["DUYURUDETAY"].ToString();
                imgGelenDuyuruDetayFoto.ImageUrl=getDataRowDuyuru["DUYURURESIM"].ToString();
                lblDuyuruYazan.Text=getDataRowDuyuru["DUYURUYAZAN"].ToString();
                lblDuyuruTarih.Text = getDataRowDuyuru["DUYURUEKLEMETARIHI"].ToString();
                lblDuyuruOkunmaSayisi.Text=getDataRowDuyuru["DUYURUOKUNMASAYISI"].ToString();
            }
        }

        gelenDuyuruTumYorumlariCek();

    }
    protected void btnYorumGonder_Click(object sender, EventArgs e)
    {
        if (isBosmu())
        {
            int index = DB.cmd("INSERT INTO DUYURUYORUM (DUYURUID,DUYURUADSOYAD,DUYURUEMAIL,DUYURUYORUM,DUYURUONAY,DUYURUYORUMTARIH) VALUES " +
                "("+gelenDuyuruID+",'"+txtAdSoyad.Text.Trim()+"','"+txtEmail.Text.Trim()+"','"+txtYorum.Text.Trim()+"','false','"+Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.','-'))+"')");
            if (index > 0)
            {
                lblDuyuruOkunmaSayisi.Text = "YORUM EKLEME İŞLEMİ BAŞARILI BİR ŞEKİLDE GERÇEKLEŞTİ.LÜTFEN YORUM ONAY BEKLEYİNİZ.";
                temizle();
                Thread.Sleep(3500);
                Response.Redirect("DuyuruDetay.aspx?gelenDuyuruID="+gelenDuyuruID);
            }
        }

    }

    private void temizle()
    {
        txtYorum.Text = "";
        txtEmail.Text = "";
        txtAdSoyad.Text = "";
    }

    private bool isBosmu()
    {
        if (txtAdSoyad.Text.Trim() != "" || txtEmail.Text.Trim() != "" || txtYorum.Text.Trim() != "")
            return true;
        else
            return false;
    }
    private void gelenDuyuruTumYorumlariCek() 
    {
        DataTable getTableGelenDuyuruYorum = DB.getTable("select * FROM DUYURUYORUM WHERE DUYURUONAY='true' and DUYURUID="+gelenDuyuruID+" ORDER BY DUYURUYORUMID DESC");
        dlGelenDuyuruIcinYorumlar.DataSource = getTableGelenDuyuruYorum;
        dlGelenDuyuruIcinYorumlar.DataBind();
    }
}