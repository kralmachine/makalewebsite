using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Admin_Adminler : System.Web.UI.Page
{

    DataBase DB = new DataBase();

    int gelenAdminID = 0;

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
        lblMasterEtiket.Text = "ADMİNLER";

        gelenAdminID = Convert.ToInt16(Request.QueryString["gelenAdminID"]);
        if (gelenAdminID>0)
        {
            lblAdminBilgilendirme.Visible = true;
            if (DB.cmd("delete from ADMINLER WHERE ADMINID=" + gelenAdminID) > 0)
            {
                lblAdminBilgilendirme.ForeColor = Color.Green;
                lblAdminBilgilendirme.Text = "Admin Kaydı Başarılı Bir Şekilde Silinmiştir.";
            }
            else 
            {
                lblAdminBilgilendirme.ForeColor = Color.Red;
                lblAdminBilgilendirme.Text = "Admin Kaydı Başarısız Bir Şekilde Silinmiştir.";
            }
            Response.Redirect("Adminler.aspx");
        }

        adminlerList();
    }
    private void adminlerList() 
    {
        DataTable dt = DB.getTable("select * from ADMINLER");
        dlAdminler.DataSource = dt;
        dlAdminler.DataBind();
    }
}