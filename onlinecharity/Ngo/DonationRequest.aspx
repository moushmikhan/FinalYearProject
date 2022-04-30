<%@ Page Title="" Language="C#" MasterPageFile="~/Ngo/NgoMasterPage.master" AutoEventWireup="true" CodeFile="DonationRequest.aspx.cs" Inherits="Ngo_DonationRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Donation Request Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Donation Request Page</li>
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
                        <h3 class="card-title">Donation Request Data</h3>
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
                                            <th>Donate</th>
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
                                    <td><%# Eval("Donate")%></td>
                                    <td><%#Eval("Status") %></td>
                                    <td>
                                        <a class="btn btn-success btn-sm" href="ApprovalDonation.aspx?Id=<%#Eval("Id") %>">
                                            <i class="fas fa-check-circle"></i>
                                            Approval
                                        </a>
                                        <br />
                                         <a class="btn btn-danger btn-sm" href="RejectDonation.aspx?Id=<%#Eval("Id") %>">
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

