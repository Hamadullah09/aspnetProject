using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Faculty_MyComplaints : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "Faculty")
         
   Response.Redirect("~/Account/Login.aspx");
        
        if (!IsPostBack)
            BindGrid();
    }

    void BindGrid()
    {
        int uid = Convert.ToInt32(Session["UserID"]);
        var dt = DbHelper.ExecuteSelect(
            "SELECT ComplaintID, Title, DateSubmitted, Status, Remarks FROM Complaints WHERE UserID=@u ORDER BY DateSubmitted DESC",
        
    new SqlParameter("@u", uid));
        
        gvComplaints.DataSource = dt;
        gvComplaints.DataBind();
}

    protected void gvComplaints_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
        {
            // Optional: Add hover effect or other row-specific logic
        }
    }
}