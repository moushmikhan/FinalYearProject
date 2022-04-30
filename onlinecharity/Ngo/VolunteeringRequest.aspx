<%@ Page Title="" Language="C#" MasterPageFile="~/Ngo/NgoMasterPage.master" AutoEventWireup="true" CodeFile="VolunteeringRequest.aspx.cs" Inherits="Ngo_VolunteeringRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Volunteering Request Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Volunteering Request Page</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Volunteering Request Data</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <asp:Repeater ID="RepeaterUser" runat="server">
                            <HeaderTemplate>
                                <table class="table table-head-fixed">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>NGOName</th>
                                            <th>FirstName</th>
                                            <th>LastName</th>
                                            <th>MobileNumber</th>
                                            <th>Address</th>
                                            <th>State</th>
                                            <th>City</th>
                                            <th>Pincode</th>
                                            <th>Skillsets</th>
                                            <th>DaysOfWork</th>
                                            <th>Commets</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Id")%></td>
                                    <td><%# Eval("NgoName")%></td>
                                    <td><%# Eval("FirstName")%></td>
                                    <td><%# Eval("LastName")%></td>
                                    <td><%# Eval("MobileNumber")%></td>
                                    <td><%# Eval("Address")%></td>
                                    <td><%#Eval("State") %></td>
                                    <td><%#Eval("City") %></td>
                                    <td><%#Eval("Pincode") %></td>
                                    <td><%#Eval("Skillsets") %></td>
                                    <td><%#Eval("DaysOfWork") %></td>
                                    <td><%#Eval("Commets") %></td>
                                    <td><%#Eval("Status") %></td>
                                    <td>
                                        <a class="btn btn-success btn-sm" href="ApprovalVolunteering.aspx?Id=<%#Eval("Id") %>">
                                            <i class="fas fa-check-circle"></i>
                                            Approval
                                        </a>
                                        <br />
                                        <a class="btn btn-danger btn-sm" href="RejectVolunteering.aspx?Id=<%#Eval("Id") %>">
                                            <i class="fas fa-trash"></i>
                                            Reject
                                        </a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                     </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <!-- /.card-body -->
                </div>
            </div>
    </section>
</asp:Content>



