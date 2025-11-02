using System;

public partial class MasterPages_AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            Response.Redirect("~/Account/Login.aspx");
if (!IsPostBack && Session["Username"] != null)
            litUser.Text = Session["Username"].ToString();
}

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
Session.Abandon();
        Response.Redirect("~/Account/Login.aspx");
    }

    // Helper method for status badges (can be placed in master page)
    public string GetStatusBadge(string status)
    {
        switch(status)
        {
            case "Pending":
                return "<span class='badge badge-pending'><i class='fas fa-clock'></i> Pending</span>";
case "In Progress":
                return "<span class='badge badge-progress'><i class='fas fa-spinner'></i> In Progress</span>";
case "Resolved":
                return "<span class='badge badge-resolved'><i class='fas fa-check-circle'></i> Resolved</span>";
default:
                return "<span class='badge bg-secondary'>" + status + "</span>";
}
    }
}