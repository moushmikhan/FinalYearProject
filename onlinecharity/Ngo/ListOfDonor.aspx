<%@ Page Title="" Language="C#" MasterPageFile="~/Ngo/NgoMasterPage.master" AutoEventWireup="true" CodeFile="ListOfDonor.aspx.cs" Inherits="Ngo_ListOfDonor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>List Of Donor Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                        <li class="breadcrumb-item active">List Of Donor Page</li>
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
                        <h3 class="card-title">List Of Donor Data</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <asp:Repeater ID="RepeaterUser" runat="server">
                            <HeaderTemplate>
                                <table class="table table-head-fixed">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>FirstName</th>
                                            <th>MiddleName</th>
                                            <th>LastName</th>
                                            <th>Gender</th>
                                            <th>MobileNumber</th>
                                            <th>Address</th>
                                            <th>State</th>
                                            <th>City</th>
                                            <th>Pincode</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Id")%></td>
                                    <td><%# Eval("FirstName")%></td>
                                    <td><%# Eval("MiddleName")%></td>
                                    <td><%# Eval("LastName")%></td>
                                    <td><%# Eval("Gender")%></td>
                                    <td><%# Eval("MobileNumber")%></td>
                                    <td><%# Eval("Address")%></td>
                                    <td><%# Eval("State")%></td>
                                    <td><%#Eval("City") %></td>
                                    <td><%# Eval("Pincode")%></td>
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

