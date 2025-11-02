<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Complaint Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link href="~/Styles/site.css" rel="stylesheet" />
    <style>
        .hero {
            background: linear-gradient(135deg, #667eea 0%, 
#764ba2 100%);
            color: white;
            padding: 100px 20px;
            text-align: center;
        }
        .hero h1 { font-size: 3rem;
font-weight: 700; margin-bottom: 1rem; }
        .hero p { font-size: 1.25rem; margin-bottom: 2rem;
opacity: 0.95; }
        .features { padding: 60px 20px; background: #f8f9fa;
}
        .feature-card {
            background: white;
border-radius: 12px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            margin-bottom: 2rem;
            transition: all 0.3s ease;
}
        .feature-card:hover {
            transform: translateY(-5px);
box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }
        .feature-icon { font-size: 3rem; margin-bottom: 1rem;
color: #667eea; }
    </style>
</head>
<body>
    <form runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <div class="container">
                <a class="navbar-brand" href="#"><i class="fas fa-shield-alt"></i> CMS</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            
        <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
         
                   <asp:LinkButton ID="lnkLogin" runat="server" CssClass="nav-link" OnClick="GoLogin_Click">
                                <i class="fas fa-sign-in-alt"></i> Login
                            </asp:LinkButton>
              
          </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lnkRegister" runat="server" CssClass="nav-link" OnClick="GoRegister_Click">
                                <i 
class="fas fa-user-plus"></i> Register
                            </asp:LinkButton>
                        </li>
                    </ul>
                </div>
          
  </div>
        </nav>

        <div class="hero">
            <div class="container">
                <h1><i class="fas fa-ticket-alt"></i> Complaint Management System</h1>
                <p>Streamline your complaint handling process with our modern, efficient platform</p>
           
     <div class="mt-4">
                    <asp:Button ID="btnGetStarted" runat="server" Text="Get Started" 
                        CssClass="btn btn-light btn-lg" OnClick="GoLogin_Click" />
                </div>
            </div>
        </div>

     
   <div class="features">
            <div class="container">
                <h2 class="text-center mb-5">Key Features</h2>
                <div class="row">
                    <div class="col-md-4">
               
         <div class="feature-card">
                            <div class="feature-icon"><i class="fas fa-user-graduate"></i></div>
                            <h5>For Faculty</h5>
                            <p>Submit complaints 
easily, track status, and communicate with IT staff in real-time.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card">
 
                           <div class="feature-icon"><i class="fas fa-cogs"></i></div>
                            <h5>For IT Staff</h5>
                            <p>Manage assigned tasks, update status, and resolve issues efficiently.</p>
    
                    </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card">
              
              <div class="feature-icon"><i class="fas fa-chart-pie"></i></div>
                            <h5>For Admins</h5>
                            <p>Monitor all complaints, manage assignments, and generate detailed reports.</p>
                  
      </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="bg-dark text-white text-center py-4">
            <p class="mb-0">&copy;
2024 Complaint Management System. All rights reserved.</p>
        </footer>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>