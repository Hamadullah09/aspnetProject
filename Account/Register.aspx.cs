using System;
using System.Data;
using System.Data.SqlClient;

public partial class Account_Register : System.Web.UI.Page
{
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
string email = txtEmail.Text.Trim();
        string password = txtPassword.Text.Trim();
        string confirmPassword = txtConfirmPassword.Text.Trim();

// Validation
        if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(email) || 
            string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(confirmPassword))
        {
            ShowMessage("All fields are required.", "alert-danger");
return;
        }

        if (username.Length < 3)
        {
            ShowMessage("Full name must be at least 3 characters.", "alert-danger");
return;
        }

        if (password.Length < 6)
        {
            ShowMessage("Password must be at least 6 characters.", "alert-danger");
return;
        }

        if (password != confirmPassword)
        {
            ShowMessage("Passwords do not match.", "alert-danger");
return;
        }

        if (!email.Contains("@"))
        {
            ShowMessage("Please enter a valid email address.", "alert-danger");
return;
        }

        try
        {
            // Check if email exists
            var exists = DbHelper.ExecuteScalar("SELECT COUNT(1) FROM Users WHERE Email=@e", 
                new SqlParameter("@e", email));
if (Convert.ToInt32(exists) > 0)
            {
                ShowMessage("This email is already registered.", "alert-danger");
return;
            }

            // Hash password and insert user
            string hash = Cryptography.HashSha256(password);
string sql = "INSERT INTO Users (Username, Email, Password, Role, CreatedAt) VALUES (@u, @e, @p, 'Faculty', GETDATE())";
DbHelper.ExecuteNonQuery(sql,
                new SqlParameter("@u", username),
                new SqlParameter("@e", email),
                new SqlParameter("@p", hash));

ShowMessage("Account created successfully! You can now log in.", "alert-success");
            
            // Clear form
            txtUsername.Text = "";
txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
        catch (SqlException)
        {
            ShowMessage("Database error. Please try again later.", "alert-danger");
}
        catch (Exception)
        {
            ShowMessage("An unexpected error occurred. Please try again.", "alert-danger");
}
    }

    private void ShowMessage(string message, string alertClass)
    {
        lblMsg.Text = message;
lblMsg.CssClass = $"alert {alertClass}";
        lblMsg.Attributes.Remove("class");
        lblMsg.Attributes.Add("class", $"alert {alertClass} d-block");
    }
}