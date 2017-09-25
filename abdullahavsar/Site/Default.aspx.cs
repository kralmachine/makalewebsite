using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Site_Default : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        duyurularCek();

        rpAnaKategoriCekList();
    }
    private void duyurularCek() 
    {
        DataTable getTableDuyurular = DB.getTable("select  * FROM VIEW_DUYURU_ADMIN ORDER BY DUYURUID DESC ");
        dlGelenDuyurular.DataSource = getTableDuyurular;
        dlGelenDuyurular.DataBind();
    }
    private void rpAnaKategoriCekList() 
    {
        DataTable getTableAnaKategoriler = DB.getTable("SELECT * FROM KATEGORILER");
        rpAnaKategori.DataSource = getTableAnaKategoriler;
        rpAnaKategori.DataBind();
    }
    
    protected void rpAnaKategori_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DataTable dt = DB.getTable("SELECT top 3 * FROM MAKALEDURUM WHERE  KATEGORIID=" + Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "KATEGORIID"))+" ORDER BY MAKALEID DESC");
        Repeater rp = (Repeater)e.Item.FindControl("rpAltKategori");
        rp.DataSource = dt;
        rp.DataBind();
    }
}