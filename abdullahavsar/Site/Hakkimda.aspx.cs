using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Site_Hakkimda : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        hakkidaVerileriCek();
    }

    private void hakkidaVerileriCek()
    {
        DataRow drGelenHakkimda = DB.getSingleRow("SELECT * FROM HAKKIMDA WHERE HAKKIMDAID=1");
        if (drGelenHakkimda != null) 
        {
            imgHakkimdaFoto.ImageUrl=drGelenHakkimda["HAKKIMDARESIM"].ToString();
            ltHakkimda.Text=drGelenHakkimda["HAKKIMDADETAY"].ToString();

            SqlDataReader reader = new SqlCommand("SELECT * FROM PROJELER WHERE HAKKIMDAID=" + DB.getSingleCell("SELECT HAKKIMDAID FROM HAKKIMDA WHERE ADMINID=1"), DB.connection()).ExecuteReader();
            while (reader.Read())
            {
                ltProjeler.Text += " * " + reader["PROJEBASLIK"].ToString() + "</br>";
            }
            reader.Close();
            reader.Dispose();

            int gelenHakkimdaID = Convert.ToInt16(DB.getSingleCell("SELECT HAKKIMDAID FROM HAKKIMDA WHERE ADMINID=1"));

            DataTable getFotoTable = DB.getTable("SELECT * FROM RESIMLER WHERE HAKKIMDAID=" + gelenHakkimdaID);
            dlResimler.DataSource = getFotoTable;
            dlResimler.DataBind();
        }
       
    }
}