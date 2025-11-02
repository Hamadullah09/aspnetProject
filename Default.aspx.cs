using System;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] != null)
        {
            string role = Session["Role"].ToString();
if (role == "Admin") Response.Redirect("~/Admin/ManageComplaints.aspx");
            else if (role == "ITStaff") Response.Redirect("~/ITStaff/MyComplaints.aspx");
            else Response.Redirect("~/Faculty/NewComplaint.aspx");
}
    }

    protected void GoLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/Login.aspx");
}

    protected void GoRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/Register.aspx");
}
}