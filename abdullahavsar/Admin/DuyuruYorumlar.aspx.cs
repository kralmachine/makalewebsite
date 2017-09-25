using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_DuyuruYorumlar : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    int silinecekDuyuruYorumID=0;
    bool YorumOnay=false;
    int guncelleDuyuruYorumID = 0;
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
        lblMasterEtiket.Text = "DUYURU YORUMLAR";

        duyuruYorumlarList();

        silinecekDuyuruYorumID = Convert.ToInt16(Request.QueryString["silinecekDuyuruYorumID"]);
        guncelleDuyuruYorumID = Convert.ToInt16(Request.QueryString["guncelleDuyuruYorumID"]);
        if (silinecekDuyuruYorumID > 0)
            DB.cmd("DELETE FROM DUYURUYORUMLAR WHERE DUYURUYORUMID="+silinecekDuyuruYorumID);

        YorumOnay = Convert.ToBoolean(Request.QueryString["YorumOnay"]);

        gelenDuyuruYorumOnayGuncelle(guncelleDuyuruYorumID, YorumOnay);
    }

    private void gelenDuyuruYorumOnayGuncelle(int guncelleDuyuruYorumID, bool YorumOnay)
    {
        if (YorumOnay && guncelleDuyuruYorumID>0)
        {
            DB.cmd("UPDATE DUYURUYORUMLAR SET DUYURUYORUMONAY='true' where DUYURUYORUMID=" + guncelleDuyuruYorumID);
            Response.Redirect("Yorumlar.aspx");
            temizle();
        }
        else if(YorumOnay==false && guncelleDuyuruYorumID>0)
        {
            DB.cmd("UPDATE DUYURUYORUMLAR SET DUYURUYORUMONAY='false' where DUYURUYORUMID=" + guncelleDuyuruYorumID);
            Response.Redirect("Yorumlar.aspx");
            temizle();
        }
    }

    private void temizle()
    {
        guncelleDuyuruYorumID = 0;
        silinecekDuyuruYorumID = 0;
        YorumOnay = false;
    }

    private void duyuruYorumlarList()
    {
        DataTable getTableDuyuruYorumlar = DB.getTable("SELECT * FROM DUYURUYORUM");
        dlGelenDuyuruYorumlar.DataSource = getTableDuyuruYorumlar;
        dlGelenDuyuruYorumlar.DataBind();
    }
}