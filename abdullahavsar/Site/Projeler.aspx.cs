using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Site_Projeler : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        gelenHakkimdaProjelerListesi();
    }

    private void gelenHakkimdaProjelerListesi()
    {
        rpAnaKategori.DataSource = DB.getTable("SELECT * FROM VIEW_ADMINLER");
        rpAnaKategori.DataBind();
    }

    protected void rpAnaKategori_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DataTable dt = DB.getTable("SELECT  * FROM VIEW_HAKKIMDA_PROJELER_ADMIN WHERE  HAKKIMDAID=" + Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "ADMINID")) + " ORDER BY HAKKIMDAID DESC");
        Repeater rp = (Repeater)e.Item.FindControl("rpAltKategori");
        rp.DataSource = dt;
        rp.DataBind();
    }
}