<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register - Complaint Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
   
 <link href="~/Styles/site.css" rel="stylesheet" />
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <div class="login-header">
                <div style="font-size: 3rem;
color: #27ae60; margin-bottom: 1rem;">
                    <i class="fas fa-user-plus"></i>
                </div>
                <h2>Create Account</h2>
                <p>Register as Faculty Member</p>
            </div>

           
 <form id="form1" runat="server">
                <asp:Label ID="lblMsg" runat="server" CssClass="alert d-none" role="alert"></asp:Label>

                <div class="form-group mb-3">
                    <label for="txtUsername" class="form-label">Full Name</label>
                    <div class="input-group">
              
          <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" 
                            Placeholder="Your full name" />
                    </div>
        
        </div>

                <div class="form-group mb-3">
                    <label for="txtEmail" class="form-label">Email Address</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
   
                     <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                            Placeholder="your@email.com" TextMode="Email" />
                    </div>
                    <small class="text-muted">Must be your institutional 
email</small>
                </div>

                <div class="form-group mb-3">
                    <label for="txtPassword" class="form-label">Password</label>
                    <div class="input-group">
                       
 <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                            Placeholder="At least 6 characters" TextMode="Password" />
                    </div>
               
     <small class="text-muted">Use a strong password with letters, numbers, and symbols</small>
                </div>

                <div class="form-group mb-3">
                    <label for="txtConfirmPassword" class="form-label">Confirm Password</label>
                    <div class="input-group">
        
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" 
                            Placeholder="Confirm password" TextMode="Password" />
                    </div>
  
              </div>

                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" id="chkAgree" required />
                    <label class="form-check-label" for="chkAgree">
                     
   I agree to the terms and conditions
                    </label>
                </div>

                <div class="d-grid mb-3">
                    <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn btn-success btn-lg" 
         
               OnClick="btnRegister_Click" />
                </div>

                <div class="text-center">
                    <p class="text-muted">Already have an account?
<a href="Login.aspx" class="form-link">Sign in</a></p>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>