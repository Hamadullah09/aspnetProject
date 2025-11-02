using System;

public partial class Account_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
Session.Abandon();
        Response.Redirect("~/Account/Login.aspx");
    }
}