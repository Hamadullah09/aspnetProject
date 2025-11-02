using System;
using System.Data;
using System.Data.SqlClient;

public partial class Faculty_NewComplaint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "Faculty")
            Response.Redirect("~/Account/Login.aspx");
if (!IsPostBack)
            LoadStatistics();
}

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text.Trim();
string description = txtDesc.Text.Trim();
        string category = ddlCategory.SelectedValue;

        if (string.IsNullOrWhiteSpace(title) || string.IsNullOrWhiteSpace(description) || string.IsNullOrWhiteSpace(category))
        {
            ShowMessage("Title, description, and category are required.", "alert-danger");
return;
        }

        if (description.Length < 10)
        {
            ShowMessage("Description must be at least 10 characters.", "alert-danger");
return;
        }

        try
        {
            int uid = Convert.ToInt32(Session["UserID"]);
            // NOTE: The SQL in source [215] is missing 'Category' which was added in the form.
            // I am adding it to the query based on the form fields.
string sql = @"INSERT INTO Complaints (UserID, Title, Description, DateSubmitted, Status, Category) 
                          VALUES (@u, @t, @d, GETDATE(), 'Pending', @c)";
DbHelper.ExecuteNonQuery(sql,
                new SqlParameter("@u", uid),
                new SqlParameter("@t", title),
                new SqlParameter("@d", description),
                new SqlParameter("@c", category));
ShowMessage("Complaint submitted successfully!", "alert-success");
            txtTitle.Text = txtDesc.Text = txtLocation.Text = "";
            ddlCategory.SelectedIndex = 0;
            LoadStatistics();
}
        catch (Exception ex)
        {
            ShowMessage("Error submitting complaint. Please try again.", "alert-danger");
}
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtTitle.Text = "";
txtDesc.Text = "";
        txtLocation.Text = "";
        ddlCategory.SelectedIndex = 0;
    }

    private void LoadStatistics()
    {
        int uid = Convert.ToInt32(Session["UserID"]);
var dtThisMonth = DbHelper.ExecuteSelect(
            "SELECT COUNT(1) as cnt FROM Complaints WHERE UserID=@u AND MONTH(DateSubmitted)=MONTH(GETDATE()) AND YEAR(DateSubmitted)=YEAR(GETDATE())",
            new SqlParameter("@u", uid));
var dtResolved = DbHelper.ExecuteSelect(
            "SELECT COUNT(1) as cnt FROM Complaints WHERE UserID=@u AND Status='Resolved'",
            new SqlParameter("@u", uid));
var dtInProgress = DbHelper.ExecuteSelect(
            "SELECT COUNT(1) as cnt FROM Complaints WHERE UserID=@u AND Status='In Progress'",
            new SqlParameter("@u", uid));
litComplaintsThisMonth.Text = dtThisMonth.Rows.Count > 0 ? dtThisMonth.Rows[0]["cnt"].ToString() : "0";
        litResolved.Text = dtResolved.Rows.Count > 0 ? dtResolved.Rows[0]["cnt"].ToString() : "0";
litInProgress.Text = dtInProgress.Rows.Count > 0 ? dtInProgress.Rows[0]["cnt"].ToString() : "0";
    }

    private void ShowMessage(string message, string alertClass)
    {
        lblMsg.Text = message;
lblMsg.Attributes.Remove("class");
        lblMsg.Attributes.Add("class", $"alert {alertClass} d-block");
    }
}