<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/FacultyMaster.master" CodeFile="MyComplaints.aspx.cs" Inherits="Faculty_MyComplaints" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-header">
        <h1><i class="fas fa-list-alt"></i> My Complaints</h1>
        <p>View all your submitted complaints and their current status.</p>
    </div>

    <div class="card">
        <div class="card-header">
            <h5 class="mb-0"><i class="fas fa-table"></i> Complaint History</h5>
        </div>
     
   <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvComplaints" runat="server" AutoGenerateColumns="False" 
                    CssClass="table table-hover table-striped" OnRowDataBound="gvComplaints_RowDataBound">
                    <Columns>
                    
    <asp:BoundField DataField="ComplaintID" HeaderText="ID" ItemStyle-Width="60px" />
                        <asp:BoundField DataField="Title" HeaderText="Title" ItemStyle-Width="250px" />
                        <asp:BoundField DataField="DateSubmitted" HeaderText="Date" DataFormatString="{0:dd MMM yyyy HH:mm}" ItemStyle-Width="160px" />
                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="140px">
      
                      <ItemTemplate>
                                <asp:Label runat="server">
                                    <%# ((MasterPages_FacultyMaster)this.Master).GetStatusBadge(Eval("Status").ToString()) %>
       
                         </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
 <asp:BoundField DataField="Remarks" HeaderText="Remarks" ItemStyle-Width="250px" />
                        <asp:TemplateField HeaderText="Details" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-sm btn-info" />
  
                          </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
          
              <div class="text-center py-4">
                            <i class="fas fa-inbox" style="font-size: 3rem;
color: #ccc;"></i>
                            <p class="text-muted mt-2">No complaints submitted yet.</p>
                            <a href="NewComplaint.aspx" class="btn btn-primary">Submit Your First Complaint</a>
                        </div>
        
            </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>