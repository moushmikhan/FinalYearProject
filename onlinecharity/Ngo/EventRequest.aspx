<%@ Page Title="" Language="C#" MasterPageFile="~/Ngo/NgoMasterPage.master" AutoEventWireup="true" CodeFile="EventRequest.aspx.cs" Inherits="Ngo_EventRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Event Request Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Event Request Page</li>
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
                        <h3 class="card-title">Event Request Data</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <asp:Repeater ID="RepeaterUser" runat="server">
                            <HeaderTemplate>
                                <table class="table table-head-fixed">
                                    <thead>
                                        <tr>
                                             <th>#</th>
                                            <th>NgoName</th>
                                            <th>DonorName</th>
                                            <th>Email</th>
                                            <th>MobileNo</th>
                                            <th>Event</th>
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
                                    <td><%# Eval("DonorName")%></td>
                                    <td><%# Eval("Email")%></td>
                                    <td><%# Eval("MobileNo")%></td>
                                    <td><%# Eval("Event")%></td>
                                    <td><%#Eval("Status") %></td>
                                    <td>
                                        <a class="btn btn-success btn-sm" href="ApprovalEvent.aspx?Id=<%#Eval("Id") %>">
                                            <i class="fas fa-check-circle"></i>
                                            Approval
                                        </a>
                                        <br />
                                         <a class="btn btn-danger btn-sm" href="RejectEvent.aspx?Id=<%#Eval("Id") %>">
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
            </div>
    </section>
</asp:Content>

