using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Site_Anket : System.Web.UI.UserControl
{
    DataBase DB = new DataBase();
    int gelenAnketID = 0;
    int oySayisi = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        anketSorulariCek();


        if (!ipVarmiYogmu())
            anketSonuclari();
    }
    private void anketSorulariCek() 
    {
        DataRow gelenAnketSatir = DB.getSingleRow("select * from ANKET");
        if (gelenAnketSatir != null)
        {
            lblAnketGelenSoru.Text=gelenAnketSatir["ANKETSORU"].ToString();
            rdCevap1.Text=gelenAnketSatir["ANKETCEVAP1"].ToString();
            rdCevap2.Text = gelenAnketSatir["ANKETCEVAP2"].ToString();
            rdCevap3.Text = gelenAnketSatir["ANKETCEVAP3"].ToString();
            rdCevap4.Text = gelenAnketSatir["ANKETCEVAP4"].ToString();
            rdCevap5.Text = gelenAnketSatir["ANKETCEVAP5"].ToString();
            gelenAnketID = Convert.ToInt16(gelenAnketSatir["ANKETID"]);
        }
    }
    private bool ipVarmiYogmu() 
    {
        SqlDataReader reader = new SqlCommand("SELECT * FROM ANKETGELENIP", DB.connection()).ExecuteReader();
        while (reader.Read())
        {
            if (reader["ANKETGELENIP"].ToString() == GetClientIp())
                return false;
        }
        return true;
    }
    protected void btnOyver_Click(object sender, EventArgs e)
    {
       

        if (ipVarmiYogmu())
        {
            if (rdCevap1.Checked)
            {
                oySayisi = 0;
                oySayisi = Convert.ToInt16(DB.getSingleCell("SELECT ANKETOY1 from ANKET WHERE ANKETID=" + gelenAnketID));
                oySayisi++;
                DB.cmd("UPDATE ANKET SET ANKETOY1=" + oySayisi + " where ANKETID=" + gelenAnketID);
                DB.cmd("INSERT INTO ANKETGELENIP (ANKETID,ANKETGELENIP) values (" + gelenAnketID + ",'" + GetClientIp() + "')");
                temizle();
                anketSonuclari();
            }
            else if (rdCevap2.Checked)
            {
                oySayisi = 0;
                oySayisi = Convert.ToInt16(DB.getSingleCell("SELECT ANKETOY2 from ANKET WHERE ANKETID=" + gelenAnketID));
                oySayisi++;
                DB.cmd("UPDATE ANKET SET ANKETOY1=" + oySayisi + " where ANKETID=" + gelenAnketID);
                DB.cmd("INSERT INTO ANKETGELENIP (ANKETID,ANKETGELENIP) values (" + gelenAnketID + ",'" + GetClientIp() + "')");
                temizle();
                anketSonuclari();
            }
            else if (rdCevap3.Checked)
            {
                oySayisi = 0;
                oySayisi = Convert.ToInt16(DB.getSingleCell("SELECT ANKETOY3 from ANKET WHERE ANKETID=" + gelenAnketID));
                oySayisi++;
                DB.cmd("UPDATE ANKET SET ANKETOY1=" + oySayisi + " where ANKETID=" + gelenAnketID);
                DB.cmd("INSERT INTO ANKETGELENIP (ANKETID,ANKETGELENIP) values (" + gelenAnketID + ",'" + GetClientIp() + "')");
                temizle();
                anketSonuclari();
            }
            else if (rdCevap4.Checked)
            {
                oySayisi = 0;
                oySayisi = Convert.ToInt16(DB.getSingleCell("SELECT ANKETOY4 from ANKET WHERE ANKETID=" + gelenAnketID));
                oySayisi++;
                DB.cmd("UPDATE ANKET SET ANKETOY1=" + oySayisi + " where ANKETID=" + gelenAnketID);
                DB.cmd("INSERT INTO ANKETGELENIP (ANKETID,ANKETGELENIP) values (" + gelenAnketID + ",'" + GetClientIp() + "')");
                temizle();
                anketSonuclari();
            }
            else if (rdCevap5.Checked)
            {
                oySayisi = 0;
                oySayisi = Convert.ToInt16(DB.getSingleCell("SELECT ANKETOY5 from ANKET WHERE ANKETID=" + gelenAnketID));
                oySayisi++;
                DB.cmd("UPDATE ANKET SET ANKETOY1=" + oySayisi + " where ANKETID=" + gelenAnketID);
                DB.cmd("INSERT INTO ANKETGELENIP (ANKETID,ANKETGELENIP) values (" + gelenAnketID + ",'" + GetClientIp() + "')");
                temizle();
                anketSonuclari();
            }
        }
        else
        {
            anketSonuclari();
        }
    }
    public void anketSonuclari() 
    {
        pnlAnketSoru.Visible = false;
        pnlAnketSonuclar.Visible = true;
        DataRow gelenRowanketCevapveOySayisi = DB.getSingleRow("select * from ANKET WHERE ANKETID=" + gelenAnketID);
        if (gelenAnketID != null)
        {
            lblGelenCevap1.Text = gelenRowanketCevapveOySayisi["ANKETCEVAP1"].ToString();
            lblGelenCevap2.Text = gelenRowanketCevapveOySayisi["ANKETCEVAP2"].ToString();
            lblGelenCevap3.Text = gelenRowanketCevapveOySayisi["ANKETCEVAP3"].ToString();
            lblGelenCevap4.Text = gelenRowanketCevapveOySayisi["ANKETCEVAP4"].ToString();
            lblGelenCevap5.Text = gelenRowanketCevapveOySayisi["ANKETCEVAP5"].ToString();
            /////////////////////////////////////////////////////////////////////////////
            lblGelenCevapOySayisi1.Text = gelenRowanketCevapveOySayisi["ANKETOY1"].ToString();
            lblGelenCevapOySayisi2.Text = gelenRowanketCevapveOySayisi["ANKETOY2"].ToString();
            lblGelenCevapOySayisi3.Text = gelenRowanketCevapveOySayisi["ANKETOY3"].ToString();
            lblGelenCevapOySayisi4.Text = gelenRowanketCevapveOySayisi["ANKETOY4"].ToString();
            lblGelenCevapOySayisi5.Text = gelenRowanketCevapveOySayisi["ANKETOY5"].ToString();
        }
    }
    public static string GetClientIp()
    {
        var ipAddress = string.Empty;
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
            ipAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        else if (HttpContext.Current.Request.ServerVariables["HTTP_CLIENT_IP"] != null && HttpContext.Current.Request.ServerVariables["HTTP_CLIENT_IP"].Length != 0)
            ipAddress = HttpContext.Current.Request.ServerVariables["HTTP_CLIENT_IP"];
        else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
            ipAddress = HttpContext.Current.Request.UserHostName;
        return ipAddress;
    }
    private void temizle() 
    {
        rdCevap1.Checked = false;
        rdCevap2.Checked = false;
        rdCevap3.Checked = false;
        rdCevap4.Checked = false;
        rdCevap5.Checked = false;
    }
}