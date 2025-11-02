using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_ManageComplaints : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            Response.Redirect("~/Account/Login.aspx");
if (!IsPostBack)
            BindGrid();
}

    protected void ddlFilterStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
}

    void BindGrid()
    {
        string status = ddlFilterStatus.SelectedValue;
string sql = @"SELECT c.ComplaintID, c.Title, c.Description, u.Username, c.DateSubmitted, 
                              c.Status, c.AssignedTo, s.Username as AssignedName
                       FROM Complaints c
                       INNER JOIN Users u ON c.UserID = u.UserID
  
                     LEFT JOIN Users s ON c.AssignedTo = s.UserID";
if (!string.IsNullOrEmpty(status))
            sql += " WHERE c.Status=@s";
sql += " ORDER BY c.DateSubmitted DESC";

        DataTable dt;
        if (!string.IsNullOrEmpty(status))
            dt = DbHelper.ExecuteSelect(sql, new SqlParameter("@s", status));
else
            dt = DbHelper.ExecuteSelect(sql);

        gvComplaints.DataSource = dt;
        gvComplaints.DataBind();
}

    protected void gvComplaints_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
        {
            var ddl = (System.Web.UI.WebControls.DropDownList)e.Row.FindControl("ddlStaff");
var staffData = DbHelper.ExecuteSelect("SELECT UserID, Username FROM Users WHERE Role='ITStaff' ORDER BY Username");
            
            ddl.DataSource = staffData;
            ddl.DataTextField = "Username";
ddl.DataValueField = "UserID";
            ddl.DataBind();
            ddl.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Staff --", "0"));

            // Set selected value if already assigned
            DataRowView drv = (DataRowView)e.Row.DataItem;
            if (drv["AssignedTo"] != DBNull.Value)
            {
                ddl.SelectedValue = drv["AssignedTo"].ToString();
            }
        }
    }

    protected void gvComplaints_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Assign")
        {
            int cid = Convert.ToInt32(e.CommandArgument);
var btn = (System.Web.UI.WebControls.Button)e.CommandSource;
            var row = (System.Web.UI.WebControls.GridViewRow)btn.NamingContainer;
            var ddl = (System.Web.UI.WebControls.DropDownList)row.FindControl("ddlStaff");
if (ddl.SelectedValue == "0")
                return;
int staffId = Convert.ToInt32(ddl.SelectedValue);

            DbHelper.ExecuteNonQuery(@"UPDATE Complaints 
                                      SET AssignedTo=@a, Status=@s, UpdatedAt=GETDATE() 
                                      WHERE ComplaintID=@cid",
             
   new SqlParameter("@a", staffId),
                new SqlParameter("@s", "In Progress"), // Automatically set to In Progress
                new SqlParameter("@cid", cid));
BindGrid();
        }
        else if (e.CommandName == "View")
        {
            // Handle view details (Code omitted in source, but would go here)
        }
    }
}