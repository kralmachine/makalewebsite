using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Site_MasustuProgramlama : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        rpMasaUstuKAtegori();
    }
    private void rpMasaUstuKAtegori() 
    {
        DataTable getTableMasaustuList = DB.getTable("SELECT * FROM KATEGORILER WHERE KATEGORIID=1");
        rpAnaKategori.DataSource = getTableMasaustuList;
        rpAnaKategori.DataBind();
    }
    protected void rpAnaKategori_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DataTable dt = DB.getTable("SELECT top 10 * FROM MAKALEDURUM WHERE  KATEGORIID=" + Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "KATEGORIID")) + " ORDER BY MAKALEID DESC");
        Repeater rp = (Repeater)e.Item.FindControl("rpAltKategori");
        rp.DataSource = dt;
        rp.DataBind();
    }
 
   
}