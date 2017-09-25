using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_KategoriDetay : System.Web.UI.Page
{
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
        lblMasterEtiket.Text = "KATEGORİ DETAY ('" + DB.getSingleCell("select KATEGORIAD from KATEGORILER WHERE KATEGORIID=" + Request.QueryString["kategoriId"]).ToString() + "')";

        gelenKategoriMakaleList();
        onayVeVitrinDurum();
    }
    private void gelenKategoriMakaleList() 
    {
        DataTable dtGelenKategoriMakaleList = DB.getTable("SELECT * FROM MAKALEDURUM WHERE KATEGORIID="+Request.QueryString["kategoriId"]+" and EKLEYEN="+Session["kulid"]+" order by MAKALEID desc");
        dlGelenKategoriMakale.DataSource = dtGelenKategoriMakaleList;
        dlGelenKategoriMakale.DataBind();
    }
    private void onayVeVitrinDurum()
    {
        bool VitrinDurum = Convert.ToBoolean(Request.QueryString["VitrinDurum"]);
        bool OnayDurum = Convert.ToBoolean(Request.QueryString["OnayDurum"]);
        int makaleId = Convert.ToInt16(Request.QueryString["makaleid"]);
        if (makaleId>0)
        {
            DataRow dr = DB.getSingleRow("SELECT * FROM MAKALEDURUM WHERE MAKALEID=" + Request.QueryString["makaleid"] + " and EKLEYEN=" + Session["kulid"]);
            if (VitrinDurum)
            {
                if (Convert.ToBoolean(dr["VITRIN"]))
                {
                    DB.cmd("UPDATE MAKALEDURUM  set VITRIN='false' , GUNCELLEYEN="+Session["kulid"]+" , GUNCELLEMETARIHI='"+Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.','-'))+"' where MAKALEID=" + Request.QueryString["makaleid"] + " and EKLEYEN=" + Session["kulid"]);
                }
                else
                {
                    DB.cmd("UPDATE MAKALEDURUM  set VITRIN='true' , GUNCELLEYEN=" + Session["kulid"] + " , GUNCELLEMETARIHI='" + Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.', '-')) + "' where MAKALEID=" + Request.QueryString["makaleid"] + " and EKLEYEN=" + Session["kulid"]);
                }
            }

            if (OnayDurum) 
            {
                if (Convert.ToBoolean(dr["ONAY"]))
                {
                    DB.cmd("UPDATE MAKALEDURUM  set ONAY='false' , GUNCELLEYEN=" + Session["kulid"] + " , GUNCELLEMETARIHI='" + Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.', '-')) + "' where MAKALEID=" + Request.QueryString["makaleid"] + " and EKLEYEN=" + Session["kulid"]);
                }
                else
                {
                    DB.cmd("UPDATE MAKALEDURUM  set ONAY='true' , GUNCELLEYEN=" + Session["kulid"] + " , GUNCELLEMETARIHI='" + Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.', '-')) + "' where MAKALEID=" + Request.QueryString["makaleid"] + " and EKLEYEN=" + Session["kulid"]);
                }
            }
        }
    }
    protected void lbMakaleEkle_Click(object sender, EventArgs e)
    {
        Response.Redirect("MakaleDurumu.aspx?kategoriId="+Request.QueryString["kategoriId"]);
    }
}