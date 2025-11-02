<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/FacultyMaster.master" CodeFile="NewComplaint.aspx.cs" Inherits="Faculty_NewComplaint" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-header">
        <h1><i class="fas fa-pen-to-square"></i> Submit a New Complaint</h1>
        <p>Describe your issue in detail so our IT staff can assist you quickly.</p>
    </div>

    <div class="row">
        <div class="col-lg-8">
            
<div class="card">
                <div class="card-header">
                    <h5 class="mb-0"><i class="fas fa-exclamation-circle"></i> Complaint Form</h5>
                </div>
                <div class="card-body">
                    <asp:Label ID="lblMsg" runat="server" CssClass="alert 
d-none" role="alert"></asp:Label>

                    <div class="mb-3">
                        <label for="txtTitle" class="form-label">Complaint Title <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" 
                     
       Placeholder="Brief title of your complaint" MaxLength="100"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label for="ddlCategory" class="form-label">Category <span class="text-danger">*</span></label>
                   
     <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                            <asp:ListItem Value="">-- Select Category --</asp:ListItem>
                            <asp:ListItem Value="Hardware">Hardware Issue</asp:ListItem>
                            <asp:ListItem Value="Software">Software 
Issue</asp:ListItem>
                            <asp:ListItem Value="Network">Network Issue</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                 
   </div>

                    <div class="mb-3">
                        <label for="txtDesc" class="form-label">Description <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" TextMode="MultiLine" 
                   
         Rows="6" Placeholder="Provide detailed description of the issue..."></asp:TextBox>
                        <small class="text-muted">Minimum 10 characters required</small>
                    </div>

                    <div class="mb-3">
                
        <label for="txtLocation" class="form-label">Location (optional)</label>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" 
                            Placeholder="e.g., Room A101, Lab 3"></asp:TextBox>
                    </div>

         
           <div class="d-grid gap-2 d-sm-flex justify-content-sm-start">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit Complaint" 
                            CssClass="btn btn-primary btn-lg" OnClick="btnSubmit_Click" />
                        
<asp:Button ID="btnClear" runat="server" Text="Clear" 
                            CssClass="btn btn-secondary btn-lg" OnClick="btnClear_Click" />
                    </div>
                </div>
            </div>
        </div>

        
<div class="col-lg-4">
            <div class="card stat-card" style="border-top-color: #3498db;">
                <div class="stat-label">Complaints This Month</div>
                <div class="stat-number"><asp:Literal ID="litComplaintsThisMonth" runat="server">0</asp:Literal></div>
            </div>
            <div class="card stat-card mt-3" style="border-top-color: #27ae60;">
                
<div class="stat-label">Resolved</div>
                <div class="stat-number"><asp:Literal ID="litResolved" runat="server">0</asp:Literal></div>
            </div>
            <div class="card stat-card mt-3" style="border-top-color: #f39c12;">
                <div class="stat-label">In Progress</div>
                <div class="stat-number"><asp:Literal ID="litInProgress" runat="server">0</asp:Literal></div>
            </div>
  
      </div>
    </div>
</asp:Content>