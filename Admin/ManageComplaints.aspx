<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/AdminMaster.master" CodeFile="ManageComplaints.aspx.cs" Inherits="Admin_ManageComplaints" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-header">
        <h1><i class="fas fa-list-check"></i> Manage Complaints</h1>
        <p>Review, assign, and track all complaints submitted by faculty members.</p>
    </div>

    <div class="card">
        <div class="card-header">
            <div class="row align-items-center">
                <div class="col-md-6">
   
                 <h5 class="mb-0"><i class="fas fa-table"></i> All Complaints</h5>
                </div>
                <div class="col-md-6 text-end">
                    <asp:DropDownList ID="ddlFilterStatus" runat="server" CssClass="form-select d-inline-block" style="width: auto;"
OnSelectedIndexChanged="ddlFilterStatus_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="">All Status</asp:ListItem>
                        <asp:ListItem Value="Pending">Pending</asp:ListItem>
                        <asp:ListItem Value="In Progress">In Progress</asp:ListItem>
                     
   <asp:ListItem Value="Resolved">Resolved</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvComplaints" 
runat="server" AutoGenerateColumns="False" 
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
                              
      <%# ((MasterPages_AdminMaster)this.Master).GetStatusBadge(Eval("Status").ToString()) %>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                <asp:TemplateField HeaderText="Assign To" ItemStyle-Width="180px">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlStaff" runat="server" CssClass="form-select form-select-sm"></asp:DropDownList>
                 
           </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="120px">
                            <ItemTemplate>
           
                     <asp:Button ID="btnAssign" runat="server" CommandName="Assign" CommandArgument='<%# Eval("ComplaintID") %>' 
                                    Text="Assign" CssClass="btn btn-sm btn-primary" />
                                
<asp:Button ID="btnView" runat="server" CommandName="View" CommandArgument='<%# Eval("ComplaintID") %>' 
                                    Text="View" CssClass="btn btn-sm btn-info" />
                            </ItemTemplate>
                        </asp:TemplateField>
 
                   </Columns>
                    <EmptyDataTemplate>
                        <div class="text-center py-4">
                            <i class="fas fa-inbox" style="font-size: 3rem;
color: #ccc;"></i>
                            <p class="text-muted mt-2">No complaints found.</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
       
     </div>
        </div>
    </div>

    <div class="modal fade" id="complaintModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Complaint Details</h5>
   
                 <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p><strong>ID:</strong> <asp:Literal ID="litComplaintID" runat="server" /></p>
                    <p><strong>Title:</strong> <asp:Literal ID="litTitle" 
runat="server" /></p>
                    <p><strong>Description:</strong></p>
                    <div class="bg-light p-3 rounded">
                        <asp:Literal ID="litDescription" runat="server" />
                    </div>
         
       </div>
            </div>
        </div>
    </div>
</asp:Content>