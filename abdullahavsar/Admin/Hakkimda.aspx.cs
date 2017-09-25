using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Hakkimda : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    Label lblBilgi = null;
    int gelenHakkimdaID = 0;
    int gelenResimId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (Session["kulemail"] == null || Convert.ToInt16(Session["kulid"]) == 0)
            Response.Redirect("Login.aspx");
        else
        {
            lblBilgi= this.Master.FindControl("lblGelenAdmin") as Label;
            lblBilgi.Text = Session["kuladi"].ToString() + " " + Session["kulsoyad"].ToString();
        }

        Label lblMasterEtiket = (Label)Master.FindControl("lblMasterEtiket");
        lblMasterEtiket.Text = "HAKKIMDA ("+lblBilgi.Text+")";

       
       
        if (Page.IsPostBack)
            return;

        gelenResimId = Convert.ToInt16(Request.QueryString["gelenResimId"]);
        if (gelenResimId>0)
        {
            File.Delete(Server.MapPath(DB.getSingleCell("SELECT RESIMYOL FROM RESIMLER WHERE RESIMID="+gelenResimId)));
            DB.cmd("DELETE FROM RESIMLER WHERE RESIMID="+gelenResimId);
            Response.Redirect("Hakkimda.aspx");
        }

        hakkimdaTumBilgileriCek();
     

    }
    protected void btnHakkimdaFotoGuncelle_Click(object sender, EventArgs e)
    {
        if (fuHakkimda.HasFile)
        {

            DirectoryInfo gelenHakkimdaResimler = new DirectoryInfo(Server.MapPath("~/Admin/Hakkimda/Resimler/"));
            foreach (FileInfo hakkimdaResim in gelenHakkimdaResimler.GetFiles())
            {
                if (hakkimdaResim.Name==Session["kulid"]+".jpg")
                {
                    File.Delete(Server.MapPath("~/Admin/Hakkimda/Resimler/"+Session["kulid"]+".jpg"));
                    break;
                }
            }
            fuHakkimda.SaveAs(Server.MapPath("~/Admin/Hakkimda/Resimler/"+Session["kulid"]+".jpg"));
            imgHakkimdaDurumFoto.ImageUrl="~/Admin/Hakkimda/Resimler/"+Session["kulid"]+".jpg";
            string hakkimdaresim="~/Admin/Hakkimda/Resimler/"+Session["kulid"]+".jpg";

            DB.cmd("UPDATE HAKKIMDA set HAKKIMDARESIM='" + hakkimdaresim + "' , HAKKIMDAGUNCELLEYEN=" + Session["kulid"] + " , HAKKIMDAGUNCELLEMETARIHI='"+Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.','-'))+"'   where ADMINID=" + Session["kulid"]);

        }

        hakkimdaTumBilgileriCek();
    }
    private void hakkimdaTumBilgileriCek() 
    {
       // temizle();

        imgHakkimdaFoto.ImageUrl = "~/Admin/Hakkimda/Resimler/" + Session["kulid"]+".jpg";
        ltHakkimda.Text = DB.getSingleCell("SELECT HAKKIMDADETAY FROM HAKKIMDA WHERE ADMINID="+Session["kulid"]);
        txtHakkimda.Text = DB.getSingleCell("SELECT HAKKIMDADETAY FROM HAKKIMDA WHERE ADMINID=" + Session["kulid"]);

        SqlDataReader reader = new SqlCommand("SELECT * FROM PROJELER WHERE HAKKIMDAID=" + DB.getSingleCell("SELECT HAKKIMDAID FROM HAKKIMDA WHERE ADMINID="+Session["kulid"]),DB.connection()).ExecuteReader();
        while (reader.Read())
        {
            ltProjeler.Text += " * " + reader["PROJEBASLIK"].ToString()+"</br>";
        }
        reader.Close();
        reader.Dispose();

        gelenHakkimdaID = Convert.ToInt16(DB.getSingleCell("SELECT HAKKIMDAID FROM HAKKIMDA WHERE ADMINID=" + Session["kulid"]));

        DataTable getFotoTable = DB.getTable("SELECT * FROM RESIMLER WHERE HAKKIMDAID=" + gelenHakkimdaID);
        dlResimler.DataSource = getFotoTable;
        dlResimler.DataBind();
   
    }
    protected void btnHakkimdaGuncelle_Click(object sender, EventArgs e)
    {
        if (txtHakkimda.Text.Length > 0)
        {
            DB.cmd("UPDATE HAKKIMDA set HAKKIMDADETAY='" + txtHakkimda.Text + "' , HAKKIMDAGUNCELLEYEN=" + Session["kulid"] + " , HAKKIMDAGUNCELLEMETARIHI='" + Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.', '-')) + "'   where ADMINID=" + Session["kulid"]);
            temizle();
            hakkimdaTumBilgileriCek();
        }   
    }
    private bool isBosmuProje() 
    {
        if (txtProjeBaslik.Text.Trim() != "" || txtProjeDetay.Text.Trim() != "" || txtProjeOzet.Text.Trim() != "")
            return true;
        else
            return false;
    }
    private void temizle() 
    {
        txtHakkimda.Text = "";
        txtProjeBaslik.Text = "";
        txtProjeDetay.Text = "";
        txtProjeOzet.Text = "";
        ltProjeler.Text = "";
        ltHakkimda.Text = "";
        imgFoto.ImageUrl = "";
        gelenHakkimdaID = 0;
    }
    protected void btnHakkimdaProjeEkle_Click(object sender, EventArgs e)
    {
        gelenHakkimdaID = Convert.ToInt16(DB.getSingleCell("SELECT HAKKIMDAID FROM HAKKIMDA WHERE ADMINID=" + Session["kulid"]));
        if (isBosmuProje()&& gelenHakkimdaID>0)
        { 
            DB.cmd("INSERT INTO PROJELER (PROJEBASLIK,PROJEDETAY,PROJEOZET,HAKKIMDAID) VALUES ('"+txtProjeBaslik.Text.Trim()+"' , '"+txtProjeDetay.Text.Trim()+"','"+txtProjeOzet.Text.Trim()+"',"+gelenHakkimdaID+")");
            temizle();
            hakkimdaTumBilgileriCek();
            Response.Redirect("Hakkimda.aspx");
        }
    }
    protected void btnHakkimdaResimEkle_Click(object sender, EventArgs e)
    {
        if (fuHakkimdaFotoResimler.HasFile)
        {
           
            gelenHakkimdaID = Convert.ToInt16(DB.getSingleCell("SELECT HAKKIMDAID FROM HAKKIMDA WHERE ADMINID=" + Session["kulid"]));

            string hakkimdaresim = "~/Admin/Hakkimda/Fotolar/" + fuHakkimdaFotoResimler.FileName;
            DB.cmd("INSERT INTO RESIMLER (HAKKIMDAID,RESIMYOL,RESIMEKLEYEN,RESIMEKLEMETARIHI,RESIMACIKLAMA) VALUES ("+gelenHakkimdaID+",'"+hakkimdaresim+"',"+Session["kulid"]+",'"+Convert.ToDateTime(DateTime.Now.ToShortDateString().Replace('.','-'))+"','AÇIKLAMA')"); 
            fuHakkimdaFotoResimler.SaveAs(Server.MapPath(hakkimdaresim));
            imgFoto.ImageUrl = hakkimdaresim;

            Response.Redirect("Hakkimda.aspx");

          

            temizle();


        }
    }
}