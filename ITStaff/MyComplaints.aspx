<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/ITStaffMaster.master" CodeFile="MyComplaints.aspx.cs" Inherits="ITStaff_MyComplaints" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-header">
        <h1><i class="fas fa-assignment"></i> My Assigned Tasks</h1>
        <p>Track and update the status of complaints assigned to you.</p>
    </div>

    <div class="row mb-3">
        <div class="col-md-3">
           
 <div class="stat-card">
                <div class="stat-label">Total Assigned</div>
                <div class="stat-number"><asp:Literal ID="litTotalAssigned" runat="server">0</asp:Literal></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card" style="border-top-color: #f39c12;">
                <div 
class="stat-label">In Progress</div>
                <div class="stat-number"><asp:Literal ID="litInProgress" runat="server">0</asp:Literal></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card" style="border-top-color: #27ae60;">
                <div class="stat-label">Resolved</div>
                <div class="stat-number"><asp:Literal ID="litResolved" 
runat="server">0</asp:Literal></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card" style="border-top-color: #e74c3c;">
                <div class="stat-label">Pending</div>
                <div class="stat-number"><asp:Literal ID="litPending" runat="server">0</asp:Literal></div>
            </div>
        
</div>
    </div>

    <div class="card">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h5 class="mb-0"><i class="fas fa-list-check"></i> Assigned Complaints</h5>
                </div>
          
      <div class="col-md-4 text-end">
                    <asp:DropDownList ID="ddlFilter" runat="server" CssClass="form-select d-inline-block" 
                        style="width: auto;"
OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="">All</asp:ListItem>
                        <asp:ListItem Value="Pending">Pending</asp:ListItem>
                        <asp:ListItem Value="In Progress">In Progress</asp:ListItem>
                      
  <asp:ListItem Value="Resolved">Resolved</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvComplaints" runat="server" 
AutoGenerateColumns="False" 
                    CssClass="table table-hover table-striped" DataKeyNames="ComplaintID" 
                    OnRowCommand="gvComplaints_RowCommand" OnRowDataBound="gvComplaints_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="ComplaintID" HeaderText="ID" ItemStyle-Width="60px" />
      
                  <asp:BoundField DataField="Title" HeaderText="Title" ItemStyle-Width="250px" />
                        <asp:BoundField DataField="Username" HeaderText="Submitted By" ItemStyle-Width="150px" />
                        <asp:BoundField DataField="DateSubmitted" HeaderText="Date" DataFormatString="{0:dd MMM yyyy}" ItemStyle-Width="120px" />
                  
      <asp:TemplateField HeaderText="Status" ItemStyle-Width="140px">
                            <ItemTemplate>
                                <asp:Label runat="server">
                               
     <%# ((MasterPages_ITStaffMaster)this.Master).GetStatusBadge(Eval("Status").ToString()) %>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
         
               <asp:TemplateField HeaderText="Update Status" ItemStyle-Width="180px">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select form-select-sm">
                  
                  <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                    <asp:ListItem Value="In Progress">In Progress</asp:ListItem>
                                    <asp:ListItem Value="Resolved">Resolved</asp:ListItem>
     
                           </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                     
   <asp:TemplateField HeaderText="Action" ItemStyle-Width="120px">
                            <ItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CommandName="UpdateStatus" 
                               
     CommandArgument='<%# Eval("ComplaintID") %>' Text="Update" CssClass="btn btn-sm btn-success" />
                                <asp:Button ID="btnView" runat="server" CommandName="View" 
                                    CommandArgument='<%# Eval("ComplaintID") %>' Text="Details" CssClass="btn btn-sm btn-info" />
         
                   </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                 
       <div class="text-center py-4">
                            <i class="fas fa-inbox" style="font-size: 3rem;
color: #ccc;"></i>
                            <p class="text-muted mt-2">No complaints assigned to you yet.</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
    
        </div>
        </div>
    </div>
</asp:Content>