using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

public partial class Admin_YorumDetay : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    int kategoriID = 0;
    int gelenMakaleID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["kulemail"] == null || Convert.ToInt16(Session["kulid"]) == 0)
            Response.Redirect("Login.aspx");
        else
        {
            Label lblBilgi = this.Master.FindControl("lblGelenAdmin") as Label;
            lblBilgi.Text = Session["kuladi"].ToString() + " " + Session["kulsoyad"].ToString();
        }

        if (Page.IsPostBack)
            return;
        kategoriID = Convert.ToInt16(DB.getSingleCell("SELECT KATEGORIID from MAKALEDURUM WHERE MAKALEID=" + Request.QueryString["yorumID"])); 
        Label lblMasterEtiket = (Label)Master.FindControl("lblMasterEtiket");
        lblMasterEtiket.Text = "YORUM DETAY ("+DB.getSingleCell("select KATEGORIAD FROM KATEGORILER WHERE KATEGORIID="+kategoriID)+")";

        gelenMakaleID = Convert.ToInt16(Request.QueryString["makaleID"]);

        if (Convert.ToInt16(Request.QueryString["yorumID"])>0 && gelenMakaleID>0)
        {
            txtEkleyenEmail.Text = DB.getSingleCell("SELECT YORUMEKLEYENEMAIL FROM YORUMLAR WHERE YORUMID="+Request.QueryString["yorumID"]);
            txtYorumBaslik.Text = DB.getSingleCell("SELECT YORUMBASLIK FROM YORUMLAR WHERE YORUMID=" + Request.QueryString["yorumID"]);
            txtYorumEkleyen.Text = DB.getSingleCell("SELECT YORUMEKLEYENKISI FROM YORUMLAR WHERE YORUMID=" + Request.QueryString["yorumID"]);
            txtYorumDetay.Text = DB.getSingleCell("SELECT YORUMACIKLAMA FROM YORUMLAR WHERE YORUMID=" + Request.QueryString["yorumID"]);
            chcYorumOnay.Checked= Convert.ToBoolean(DB.getSingleCell("SELECT YORUMONAY FROM YORUMLAR WHERE YORUMID=" + Request.QueryString["yorumID"]));

            txtKategoriAd.Text = DB.getSingleCell("SELECT KATEGORIAD FROM KATEGORILER WHERE KATEGORIID=" + kategoriID);

            txtMakaleAdi.Text = DB.getSingleCell("select MAKALEBASLIK FROM MAKALEDURUM WHERE MAKALEID=" + gelenMakaleID);  

        }
    }
    private bool isBosmu() 
    {
        if (txtEkleyenEmail.Text.Trim() != "" || txtKategoriAd.Text.Trim() != "" || txtMakaleAdi.Text.Trim() != "" || txtYorumBaslik.Text.Trim()!="" || txtYorumDetay.Text.Trim()!="" || txtYorumEkleyen.Text.Trim()!="")
            return true;
        else
            return false;
             
    }
    
    protected void btnYorumGuncelle_Click(object sender, EventArgs e)
    {
        if (isBosmu())
        {
            int gelenYorumGuncelle = DB.cmd("UPDATE YORUMLAR SET YORUMEKLEYENKISI='" + txtYorumEkleyen.Text.Trim() + "',YORUMBASLIK='" + txtYorumBaslik.Text.Trim() + "', YORUMACIKLAMA='" + txtYorumDetay.Text.Trim() + "',YORUMEKLEYENEMAIL='" + txtEkleyenEmail.Text.Trim() + "',YORUMONAY='" + chcYorumOnay.Checked + "' ,YORUMONAYGUNCELLEYEN=" + Session["kulid"] + " ,YORUMONAYGUNCELLEMETARIHI='"+Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.','-'))+"' WHERE YORUMID=" + Request.QueryString["yorumID"]);
            if (gelenYorumGuncelle>0)
            {
                temizle();
                Thread.Sleep(3000);
                Response.Redirect("Yorumlar.aspx");
            }
        }
    }

    private void temizle()
    {
        txtEkleyenEmail.Text = "";
        txtKategoriAd.Text = "";
        txtMakaleAdi.Text = "";
        txtYorumBaslik.Text = "";
        txtYorumDetay.Text = "";
        txtYorumEkleyen.Text = "";
        chcYorumOnay.Checked = false;
        gelenMakaleID = 0;
        kategoriID = 0;
    }
}