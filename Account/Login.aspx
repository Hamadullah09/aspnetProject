<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Complaint Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link href="~/Styles/site.css" rel="stylesheet" />
</head>
<body>
    <div class="login-container">
        <div class="login-card">
        
    <div class="login-header">
                <div style="font-size: 3rem;
color: #3498db; margin-bottom: 1rem;">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h2>Complaint Management</h2>
                <p>Sign in to your account</p>
            </div>

          
  <form id="form1" runat="server">
                <asp:Label ID="lblMsg" runat="server" CssClass="alert d-none" role="alert"></asp:Label>

                <div class="form-group mb-3">
                    <label for="txtEmail" class="form-label">Email Address</label>
                    <div class="input-group">
             
           <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                            Placeholder="your@email.com" TextMode="Email" />
                    </div>
        
        </div>

                <div class="form-group mb-3">
                    <label for="txtPassword" class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
    
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                            Placeholder="Enter password" TextMode="Password" />
                    </div>
                </div>

         
       <div class="d-grid mb-3">
                    <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn btn-primary btn-lg" 
                        OnClick="btnLogin_Click" />
                </div>

                <div class="text-center">
     
               <p class="text-muted">Don't have an account?
<a href="Register.aspx" class="form-link">Create one</a></p>
                </div>

                <hr />

                <div class="bg-light p-3 rounded">
                    <p class="text-muted small mb-0"><strong>Demo Credentials:</strong></p>
                    <p 
class="text-muted small mb-2">
                        <strong>Admin:</strong> admin@cms.com / password<br/>
                        <strong>Faculty:</strong> jane@cms.com / password<br/>
                        <strong>IT Staff:</strong> john@cms.com / password
                
    </p>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>