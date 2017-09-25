using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Projeler : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    int gelenHakkimdaID = 0;
    int projeID = 0;
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
        lblMasterEtiket.Text = "PROJELER";

        projeID = Convert.ToInt16(Request.QueryString["projeID"]);
        if (projeID>0)
        {
            DB.cmd("DELETE FROM PROJELER WHERE PROJEID="+projeID);
            Response.Redirect("Projeler.aspx");
            projeList();
        }

        projeList();
    }
    private void projeList() 
    {
        gelenHakkimdaID = Convert.ToInt16(DB.getSingleCell("SELECT HAKKIMDAID FROM HAKKIMDA WHERE ADMINID="+Session["kulid"]));
        DataTable getProjelerTable = DB.getTable("SELECT * FROM PROJELER where HAKKIMDAID="+gelenHakkimdaID);
        dlProjeler.DataSource = getProjelerTable;
        dlProjeler.DataBind();
    }
}