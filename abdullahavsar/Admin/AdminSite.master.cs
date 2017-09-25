using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminSite : System.Web.UI.MasterPage
{
    DataBase DB = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["kulemail"] == null || Convert.ToInt16(Session["kulid"]) == 0)
            Response.Redirect("Login.aspx");

        int gelenOnaySizYorumlar = Convert.ToInt16(DB.getSingleCell("SELECT COUNT(*) YORUMID from YORUMLAR WHERE YORUMONAY='false' "));
        int gelenDuyuruOnaysizYorumlar = Convert.ToInt16(DB.getSingleCell("SELECT COUNT(*) DUYURUYORUMID from DUYURUYORUM WHERE DUYURUONAY='false' "));
        lbYorumlar.Text = "Yorumlar(" +gelenOnaySizYorumlar+")";
        lbDuyuruYorumlar.Text = "DuyuruYorumlar(" +gelenDuyuruOnaysizYorumlar+")";
    }
    protected void lbGuvenliCikis_Click(object sender, EventArgs e)
    {
        Session["kulid"] = 0;
        Session["kuladi"] = "";
        Session["kulsoyad"] = "";
        Session["kulemail"] = "";
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }

    protected void lbAdminler_Click(object sender, EventArgs e)
    {
        if (Session["kulemail"] == null || Convert.ToInt16(Session["kulid"]) == 0)
            Response.Redirect("Login.aspx");
        else
            Response.Redirect("Adminler.aspx");
    }
}
