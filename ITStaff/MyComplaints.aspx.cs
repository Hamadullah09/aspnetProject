using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class ITStaff_MyComplaints : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "ITStaff")
            Response.Redirect("~/Account/Login.aspx");
if (!IsPostBack)
        {
            BindGrid();
LoadStatistics();
        }
    }

    protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
}

    void BindGrid()
    {
        int uid = Convert.ToInt32(Session["UserID"]);
string status = ddlFilter.SelectedValue;

        string sql = @"SELECT c.ComplaintID, c.Title, c.Description, u.Username, c.DateSubmitted, c.Status
                      FROM Complaints c
                      INNER JOIN Users u ON c.UserID = u.UserID
                      WHERE c.AssignedTo=@u";
if (!string.IsNullOrEmpty(status))
            sql += " AND c.Status=@s";
sql += " ORDER BY c.DateSubmitted DESC";

        DataTable dt;
        if (!string.IsNullOrEmpty(status))
            dt = DbHelper.ExecuteSelect(sql, 
                new SqlParameter("@u", uid), 
                new SqlParameter("@s", status));
else
            dt = DbHelper.ExecuteSelect(sql, new SqlParameter("@u", uid));
gvComplaints.DataSource = dt;
        gvComplaints.DataBind();
    }

    void LoadStatistics()
    {
        int uid = Convert.ToInt32(Session["UserID"]);
var dtTotal = DbHelper.ExecuteSelect(
            "SELECT COUNT(1) as cnt FROM Complaints WHERE AssignedTo=@u",
            new SqlParameter("@u", uid));
var dtPending = DbHelper.ExecuteSelect(
            "SELECT COUNT(1) as cnt FROM Complaints WHERE AssignedTo=@u AND Status='Pending'",
            new SqlParameter("@u", uid));
var dtInProgress = DbHelper.ExecuteSelect(
            "SELECT COUNT(1) as cnt FROM Complaints WHERE AssignedTo=@u AND Status='In Progress'",
            new SqlParameter("@u", uid));
var dtResolved = DbHelper.ExecuteSelect(
            "SELECT COUNT(1) as cnt FROM Complaints WHERE AssignedTo=@u AND Status='Resolved'",
            new SqlParameter("@u", uid));
litTotalAssigned.Text = dtTotal.Rows.Count > 0 ? dtTotal.Rows[0]["cnt"].ToString() : "0";
        litPending.Text = dtPending.Rows.Count > 0 ? dtPending.Rows[0]["cnt"].ToString() : "0";
litInProgress.Text = dtInProgress.Rows.Count > 0 ? dtInProgress.Rows[0]["cnt"].ToString() : "0";
        litResolved.Text = dtResolved.Rows.Count > 0 ? dtResolved.Rows[0]["cnt"].ToString() : "0";
}

    protected void gvComplaints_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
        {
            var ddl = (System.Web.UI.WebControls.DropDownList)e.Row.FindControl("ddlStatus");
            // Get status from the DataRowView, not the rendered cell text
            DataRowView drv = (DataRowView)e.Row.DataItem;
string currentStatus = drv["Status"].ToString();
            ddl.SelectedValue = currentStatus;
        }
    }

    protected void gvComplaints_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "UpdateStatus")
        {
            int cid = Convert.ToInt32(e.CommandArgument);
var btn = (System.Web.UI.WebControls.Button)e.CommandSource;
            var row = (System.Web.UI.WebControls.GridViewRow)btn.NamingContainer;
            var ddl = (System.Web.UI.WebControls.DropDownList)row.FindControl("ddlStatus");
            string status = ddl.SelectedValue;
DbHelper.ExecuteNonQuery(@"UPDATE Complaints 
                                      SET Status=@s, UpdatedAt=GETDATE() 
                                      WHERE ComplaintID=@cid",
                new SqlParameter("@s", 
status),
                new SqlParameter("@cid", cid));

            BindGrid();
LoadStatistics();
        }
    }
}