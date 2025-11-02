using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public static class DbHelper
{
    private static string ConnString => ConfigurationManager.ConnectionStrings["ComplaintDB"].ConnectionString;

public static DataTable ExecuteSelect(string sql, params SqlParameter[] parameters)
    {
        var dt = new DataTable();
try
        {
            using (var conn = new SqlConnection(ConnString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                if (parameters != null) cmd.Parameters.AddRange(parameters);
using (var da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
}
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("DbHelper.ExecuteSelect Error: " + ex.Message);
}
        return dt;
}

    public static int ExecuteNonQuery(string sql, params SqlParameter[] parameters)
    {
        try
        {
            using (var conn = new SqlConnection(ConnString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                if (parameters != null) cmd.Parameters.AddRange(parameters);
conn.Open();
                return cmd.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("DbHelper.ExecuteNonQuery Error: " + ex.Message);
return 0;
        }
    }

    public static object ExecuteScalar(string sql, params SqlParameter[] parameters)
    {
        try
        {
            using (var conn = new SqlConnection(ConnString))
            using (var cmd = new SqlCommand(sql, conn))
            {
                
if (parameters != null) cmd.Parameters.AddRange(parameters);
                conn.Open();
                return cmd.ExecuteScalar();
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("DbHelper.ExecuteScalar Error: " + ex.Message);
return null;
        }
    }
}