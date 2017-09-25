using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Yorumlar : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    int gelenMakaleID = 0;
    bool gelenMakaleYorumDurum = false;
    int silinecekYorumID = 0;
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
        lblMasterEtiket.Text = "YORUMLAR";

        yorumLarList();

        gelenMakaleID=Convert.ToInt16(Request.QueryString["MakaleId"]);
        gelenMakaleYorumDurum=Convert.ToBoolean(Request.QueryString["YorumOnay"]);

        gelenMakaleOnayGuncelleFunc(gelenMakaleYorumDurum,gelenMakaleID);

        silinecekYorumID=Convert.ToInt16(Request.QueryString["silinecekYorumID"]);
        if (silinecekYorumID>0)
        {
            DB.cmd("DELETE FROM YORUMLAR WHERE YORUMID="+silinecekYorumID);
            Response.Redirect("Yorumlar.aspx");
            temizle();
        }
    }

    private void gelenMakaleOnayGuncelleFunc(bool gelenMakaleYorumDurum, int gelenMakaleID)
    {
        if (gelenMakaleYorumDurum && gelenMakaleID > 0)
        {
            DB.cmd("UPDATE YORUMLAR SET YORUMONAY='true' where MAKALEID=" + gelenMakaleID);
            Response.Redirect("Yorumlar.aspx");
            temizle();
        }
        else if (gelenMakaleID > 0)
        {
            DB.cmd("UPDATE YORUMLAR SET YORUMONAY='false' where MAKALEID=" + gelenMakaleID);
            Response.Redirect("Yorumlar.aspx");
            temizle();
        }

       
    }

    private void temizle()
    {
        gelenMakaleID = 0;
        gelenMakaleYorumDurum = false;
        silinecekYorumID = 0;
    }
    private void yorumLarList() 
    {
        DataTable getDataTableYorumlar = DB.getTable("SELECT * FROM YORUMLAR order by MAKALEID desc");
        dlGelenYorumlar.DataSource = getDataTableYorumlar;
        dlGelenYorumlar.DataBind();
    }
}