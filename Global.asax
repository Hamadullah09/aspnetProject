<%@ Application Language="C#" %>
<script runat="server">
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown
    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
        Exception ex = Server.GetLastError();
System.Diagnostics.Debug.WriteLine("Application Error: " + ex.Message);
        // Server.ClearError();
        // Response.Redirect("~/ErrorPage.aspx");
    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
    }
    
    void Application_BeginRequest(object sender, EventArgs e)
    {
        // Code that runs at the beginning of each request
    }
</script>