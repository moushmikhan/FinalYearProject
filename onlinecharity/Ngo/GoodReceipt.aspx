<%@ Page Title="" Language="C#" MasterPageFile="~/Ngo/NgoMasterPage.master" AutoEventWireup="true" CodeFile="GoodReceipt.aspx.cs" Inherits="Ngo_GoodReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Good Receipt Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Good Receipt Page</li>
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
                    <h3 class="card-title">Good Receipt</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputAddress">Receipt Number</label><asp:Label ID="lblReceipt" runat="server" Text="" Visible="false"></asp:Label>
                                <asp:TextBox ID="txtReceiptId" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                </div>
                            </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputAddress">Donor Name</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDonor" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtDonor" runat="server" placeholder="Donor Name" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputAddress">Name Of NGO</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMobileNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Mobile No" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Mobile Number.Please Enter Mobile Number" ControlToValidate="txtMobileNo" ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputAddress">Date</label>
                                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputAddress">Donation Type</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlDonationType" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:DropDownList ID="ddlDonationType" runat="server" CssClass="form-control">
                                    <asp:ListItem>--select type--</asp:ListItem>
                                    <asp:ListItem>Clothes</asp:ListItem>
                                    <asp:ListItem>Food Grains</asp:ListItem>
                                    <asp:ListItem>Stationary</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtAddress">Quantity of Donation</label>
                                <asp:TextBox ID="txtQuantityDonation" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtAddress">Describe Others in Details</label>
                                <asp:TextBox ID="txtDescribe" runat="server" placeholder="" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
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
                    <h3 class="card-title">Good Receipt Data</h3>
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

