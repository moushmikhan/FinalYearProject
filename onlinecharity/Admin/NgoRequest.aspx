<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="NgoRequest.aspx.cs" Inherits="Admin_NgoRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Ngo Request Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Ngo Request Page</li>
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
                        <h3 class="card-title">Ngo Request Data</h3>
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
                                            <th>RegistrationNo</th>
                                            <th>RegistrationDate</th>
                                            <th>NgoAdministrator</th>
                                            <th>NgoType</th>
                                            <th>NgoAddress</th>
                                            <th>ContactNo</th>
                                            <th>EmailId</th>
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
                                    <td><%# Eval("RegistrationNo")%></td>
                                    <td><%# Eval("RegistrationDate","{0:dd-MM-yyyy}")%></td>
                                    <td><%# Eval("NgoAdministrator")%></td>
                                    <td><%# Eval("NgoType")%></td>
                                    <td><%# Eval("NgoAddress")%></td>
                                    <td><%# Eval("ContactNo")%></td>
                                    <td><%# Eval("EmailId")%></td>
                                    <td><%#Eval("Status") %></td>
                                    <td>
                                        <a class="btn btn-success btn-sm" href="ApprovalNgo.aspx?Id=<%#Eval("EmailId") %>">
                                            <i class="fas fa-check-circle"></i>
                                            Approval
                                        </a>
                                        <br />
                                         <a class="btn btn-danger btn-sm" href="DeleteNgo.aspx?Id=<%#Eval("EmailId") %>">
                                            <i class="fas fa-trash"></i>
                                            Delete
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

