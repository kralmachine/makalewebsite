using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Admin_Default : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    int index = 0;
    int gelenBilgiId = 0;
    bool gelenBilgiGuncelleDurum = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["kulemail"] == null || Convert.ToInt16(Session["kulid"])==0)
            Response.Redirect("Login.aspx");
        else 
        {
            Label lblBilgi = this.Master.FindControl("lblGelenAdmin") as Label;
            lblBilgi.Text = Session["kuladi"].ToString() + " " + Session["kulsoyad"].ToString();
            bilgileriList();
        }


        Label lblMasterEtiket = (Label)Master.FindControl("lblMasterEtiket");
        lblMasterEtiket.Text = "BİLGİ TUTUCU";


        gelenBilgiId = Convert.ToInt16(Request.QueryString["gidenBilgiSilinecekid"]);
        if (gelenBilgiId>0)
        {
            lblBilgilendirme.Visible = true;
            if (DB.cmd("DELETE FROM BILGILER WHERE BILGIID=" + gelenBilgiId) > 0)
            {
                lblBilgilendirme.ForeColor = Color.Green;
                lblBilgilendirme.Text = "Bilgi Silme İşlemi Başarılı Bir Şekilde Gerçekleşti.";
            }
            else
            {
                lblBilgilendirme.ForeColor = Color.Red;
                lblBilgilendirme.Text = "Bilgi Silme İşlemi Başarısız Bir Şekilde Gerçekleşti.";
            }
            temizle();
            bilgileriList();
            Response.Redirect("Default.aspx");          
        }

        gelenBilgiGuncelleDurum = Convert.ToBoolean(Request.QueryString["gelenBilgiGuncelleDurum"]);
        gelenBilgiId = Convert.ToInt16(Request.QueryString["gelenBilgiGuncelle"]);
        if (Page.IsPostBack)
            return;
        if (gelenBilgiGuncelleDurum && gelenBilgiId>0)
        {
           DataRow gelenBilgiDR=DB.getSingleRow("select * from BILGILER WHERE BILGIID="+gelenBilgiId);
           if (gelenBilgiDR != null)
           {
               txtBilgiAdi.Text = gelenBilgiDR["BILGIAD"].ToString();
               txtBilgiAciklama.Text = gelenBilgiDR["BILGIACIKLAMA"].ToString();
           }
        }
    }
    private void bilgileriList() 
    {
        DataTable dt = DB.getTable("select * from BILGILER WHERE BILGIEKLEYEN=" + Session["kulid"]+" order by BILGIID desc");
        dlBilgilendirme.DataSource = dt;
        dlBilgilendirme.DataBind();
    }
    private void temizle() 
    {
        txtBilgiAciklama.Text = "";
        txtBilgiAdi.Text = "";
        index = 0;
        gelenBilgiId = 0;
        gelenBilgiGuncelleDurum = false;
    }
    protected void btnBilgiEkle_Click(object sender, EventArgs e)
    {
       
            if (!gelenBilgiGuncelleDurum)
            {
                if (txtBilgiAciklama.Text.Trim() != "" && txtBilgiAdi.Text.Trim() != "")
                {
                    index = DB.cmd("INSERT INTO BILGILER (BILGIAD,BILGIACIKLAMA,BILGIEKLEYEN,BILGIEKLEMETARIHI) VALUES ('" + txtBilgiAdi.Text.Trim() + "','" + txtBilgiAciklama.Text.Trim() + "'," + Session["kulid"] + ",'" + Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.', '-')) + "')");
                    if (index > 0)
                    {
                        lblBilgilendirme.ForeColor = Color.Green;
                        lblBilgilendirme.Visible = true;
                        lblBilgilendirme.Text = "Bilgi Ekleme İşlemi Başarılı Bir Şekilde Gerçekleşmiştir.";
                        temizle();
                        bilgileriList();
                        Response.Redirect("Default.aspx");
                    }
                }
                else
                {
                    lblBilgilendirme.Visible = true;
                    lblBilgilendirme.Text = "Bilgi Ekleme İşlemi Başarısız Bir Şekilde Gerçekleşmiştir.Lütfen Kayıtları Boş Geçmeyiniz.";
                }

            }
            else
            {
                if (txtBilgiAciklama.Text.Trim() != "" && txtBilgiAdi.Text.Trim() != "")
                {
                    index = DB.cmd("UPDATE BILGILER SET BILGIAD='" + txtBilgiAdi.Text.Trim() + "',BILGIACIKLAMA='" + txtBilgiAciklama.Text.Trim() + "',BILGIGUNCELLEYEN='1',BILGIGUNCELLEMETARIHI='" + Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.', '-')) + "'  WHERE BILGIID=" + gelenBilgiId);
                    if (index > 0)
                    {
                        lblBilgilendirme.ForeColor = Color.Green;
                        lblBilgilendirme.Visible = true;
                        lblBilgilendirme.Text = "Bilgi Güncelleme İşlemi Başarılı Bir Şekilde Gerçekleşmiştir.";
                        temizle();
                        bilgileriList();
                        Response.Redirect("Default.aspx");
                    }
                }
                else
                {
                    lblBilgilendirme.Visible = true;
                    lblBilgilendirme.Text = "Bilgi Güncelleme İşlemi Başarısız Bir Şekilde Gerçekleşmiştir.Lütfen Kayıtları Boş Geçmeyiniz.";
                }
            }
    }
}