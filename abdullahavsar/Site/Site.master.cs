using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Site_Site : System.Web.UI.MasterPage
{
    DataBase DB = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        ensonEklenenMakaleler();
        enguncelHaberler();
    }
    private void ensonEklenenMakaleler() 
    {
        DataTable getEnSonMakalelerTable = DB.getTable("SELECT TOP 10 * FROM MAKALEDURUM WHERE ONAY='true' order by MAKALEID DESC");
        dlEnSonEklenenMakaleler.DataSource = getEnSonMakalelerTable;
        dlEnSonEklenenMakaleler.DataBind();
    }
    private void enguncelHaberler()
    {
        DataTable getEnSonMakalelerTable = DB.getTable("SELECT TOP 10 * FROM MAKALEDURUM WHERE ONAY='true' order by MAKALEID DESC");
        dlEnGuncelHaberler.DataSource = getEnSonMakalelerTable;
        dlEnGuncelHaberler.DataBind();
    }
 
   
}
