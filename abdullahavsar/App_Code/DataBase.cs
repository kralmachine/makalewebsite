using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Bu mükemmel bir class olarak tanımlanmıştır.
/// </summary>
public class DataBase
{
	public DataBase()
	{
		
	}

    public SqlConnection connection() 
    {
        SqlConnection conn = new SqlConnection("Data Source=KRALMACHINE\\AAA;initial Catalog=ABDULLAHAVSAR;uid=sa;password=1234");
        if (conn.State == System.Data.ConnectionState.Closed)
        {
            conn.Open();
            SqlConnection.ClearAllPools();
        }
        return conn;
    }
    public int cmd(string sql) 
    {
        int index = 0;
        SqlCommand komut = new SqlCommand(sql, connection());
        try
        {
            index = komut.ExecuteNonQuery();
        }
        catch (Exception)
        {
            
            throw;
        }
        return index;
    }
    public DataTable getTable(string sql) 
    {
        SqlDataAdapter adp = new SqlDataAdapter(sql, connection());
        DataTable dt = new DataTable();
        try
        {
            adp.Fill(dt);
        }
        catch (Exception)
        {
            
            throw;
        }
        return dt;
    }
    public DataRow getSingleRow(string sql) 
    {
        DataTable getRowtoTable = getTable(sql);
        if (getRowtoTable != null)
            return getRowtoTable.Rows[0];
        else
            return null;
    }
    public string getSingleCell(string sql)
    {
        DataTable getRowtoTable = getTable(sql);
        if (getRowtoTable != null)
            return getRowtoTable.Rows[0][0].ToString();
        else
            return null;
    }

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public bool login(string kulAd, string kulSifre)
    {
        SqlDataReader oku = new SqlCommand("select * from ADMINLER where EMAIL='" + kulAd + "' and SIFRE='" + kulSifre + "'", connection()).ExecuteReader();
        if (oku.Read())
            return true;
        return false;
    }
}