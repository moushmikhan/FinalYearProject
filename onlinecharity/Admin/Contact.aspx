<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Admin_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Contact Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Contact Page</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Contact Data</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
                <asp:Repeater ID="RepeaterStudnet" runat="server">
                    <HeaderTemplate>
                        <table class="table table-head-fixed">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Subject</th>
                                    <th>Message</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id")%></td>
                            <td><%# Eval("Name")%></td>
                            <td><%# Eval("Email")%></td>
                            <td><%# Eval("Subject")%></td>
                            <td><%# Eval("Message")%></td>
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
        <!-- /.card -->
    </div>
</asp:Content>


