using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Site_Duyurular : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        duyurularCek();
    }

    private void duyurularCek()
    {
        DataTable getTableDuyurular = DB.getTable("select  * FROM VIEW_DUYURU_ADMIN ORDER BY DUYURUID DESC ");
        dlGelenDuyurular.DataSource = getTableDuyurular;
        dlGelenDuyurular.DataBind();
    }
}