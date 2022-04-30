<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/DonorMasterPage.master" AutoEventWireup="true" CodeFile="Donation.aspx.cs" Inherits="Donor_Donation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Donation Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Donation Page</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <!-- SELECT2 EXAMPLE -->
            <div class="card card-default">
                <div class="card-header">
                    <h3 class="card-title">Donation</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtFullName">Select Ngo Name</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlNgo" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:DropDownList ID="ddlNgo" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <!-- /.form-group -->
                            <div class="form-group">
                                <label for="exampleInputAddress">Donor Name</label>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDonor" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtDonor" runat="server" placeholder="Donor Name" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputAddress">Email</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"  Enabled="false"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ForeColor="Red" Display="Dynamic" ErrorMessage="Invalid email address"></asp:RegularExpressionValidator>
                               
                            </div>
                            <div class="form-group">
                                <label for="exampleInputAddress">Mobile No</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMobileNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Mobile No" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Mobile Number.Please Enter Mobile Number" ControlToValidate="txtMobileNo" ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-md-6">
                              <div class="form-group">
                                <label for="txtAddress">Donate</label>
                                <asp:TextBox ID="txtDonate" runat="server" placeholder="I would like to Donate" CssClass="form-control" TextMode="MultiLine" Rows="8"></asp:TextBox>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary float-right" OnClick="btnSubmit_Click" CausesValidation="true" />
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Donation Data</h3>
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
                                <td><%# Eval("Status")%></td>
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
    </section>
</asp:Content>

