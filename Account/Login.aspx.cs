using System;
using System.Data;
using System.Data.SqlClient;

public partial class Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] != null)
        {
            RedirectRole(Session["Role"].ToString());
}
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
string password = txtPassword.Text.Trim();

        if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
        {
            ShowMessage("Email and password are required.", "alert-danger");
return;
        }

        try
        {
            string sql = "SELECT UserID, Username, Role, Password FROM Users WHERE Email=@e";
var dt = DbHelper.ExecuteSelect(sql, new SqlParameter("@e", email));

            if (dt.Rows.Count == 1)
            {
                var row = dt.Rows[0];
string storedHash = row["Password"].ToString();
                
                // NOTE: The sample data uses a specific hash. 
                // For a real system, you'd use Cryptography.VerifySha256
                // For this demo, we check the plain text password "password" against the stored hash
                if (Cryptography.VerifySha256(password, storedHash))
                {
                    Session["UserID"] = row["UserID"];
Session["Username"] = row["Username"];
                    Session["Role"] = row["Role"];
                    Session.Timeout = 20;
                    
                    RedirectRole(row["Role"].ToString());
                    return;
}
            }
            
            ShowMessage("Invalid email or password.", "alert-danger");
}
        catch (Exception ex)
        {
            ShowMessage("An error occurred. Please try again.", "alert-danger");
}
    }

    private void RedirectRole(string role)
    {
        if (role == "Admin") Response.Redirect("~/Admin/ManageComplaints.aspx");
else if (role == "ITStaff") Response.Redirect("~/ITStaff/MyComplaints.aspx");
        else Response.Redirect("~/Faculty/NewComplaint.aspx");
    }

    private void ShowMessage(string message, string alertClass)
    {
        lblMsg.Text = message;
lblMsg.CssClass = $"alert {alertClass}";
        lblMsg.Attributes.Remove("class");
        lblMsg.Attributes.Add("class", $"alert {alertClass} d-block");
    }
}