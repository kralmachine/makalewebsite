using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ProjelerDetay : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    int gelenProjeID = 0;
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
        lblMasterEtiket.Text = "PORJE DETAY";

        gelenProjeID = Convert.ToInt16(Request.QueryString["projeID"]);

        if (Page.IsPostBack)
            return;

       
        if (gelenProjeID>0)
        {
            DataRow getProjeSatir = DB.getSingleRow("SELECT * FROM PROJELER WHERE PROJEID="+gelenProjeID);
            if (getProjeSatir!=null)
            {
                txtProjeBaslik.Text = getProjeSatir["PROJEBASLIK"].ToString();
                txtProjeOzet.Text=getProjeSatir["PROJEOZET"].ToString();
                txtProjeDetay.Text=getProjeSatir["PROJEDETAY"].ToString();
            }
            getProjeSatir.Delete();
        }

    }
    private bool isBosmu() 
    {
        if (txtProjeBaslik.Text.Trim() != "" || txtProjeDetay.Text.Trim() != "" || txtProjeOzet.Text.Trim() != "")
            return true;
        else
            return false;
    }
    protected void btnHakkimdaProjeEkle_Click(object sender, EventArgs e)
    {
        if (isBosmu())
        {
            DB.cmd("UPDATE PROJELER SET PROJEBASLIK='"+txtProjeBaslik.Text.Trim()+"' , PROJEDETAY='"+txtProjeDetay.Text.Trim()+"' , PROJEOZET='"+txtProjeOzet.Text.Trim()+"' where PROJEID="+gelenProjeID);
            Response.Redirect("Projeler.aspx");
        }
    }
}