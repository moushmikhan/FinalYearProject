<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="Admin_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>User Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                        <li class="breadcrumb-item active">User Page</li>
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
                    <h3 class="card-title">Add User</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtFullName">Full Name</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFullName" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtFullName" runat="server" placeholder="Full Name" CssClass="form-control"></asp:TextBox>
                            </div>
                            <!-- /.form-group -->
                            <div class="form-group">
                                <label for="exampleInputAddress">Email</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ForeColor="Red" Display="Dynamic" ErrorMessage="Invalid email address"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputAddress">Password</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputAddress">Date Of Birth</label>
                                <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputAddress">Gender</label>
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                            <asp:ListItem>--Select gender--</asp:ListItem>
                                            <asp:ListItem>Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                            <asp:ListItem>Other</asp:ListItem>
                                        </asp:DropDownList>
                            </div>
                            <!-- /.form-group -->
                            <div class="form-group">
                                <label for="exampleInputAddress">Mobile No</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMobileNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Mobile No" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Mobile Number.Please Enter Mobile Number" ControlToValidate="txtMobileNo" ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputAddress">Image</label>
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                            </div>
                              <div class="form-group">
                                <label for="txtAddress">Address</label>
                                <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
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
                    <h3 class="card-title">User Data</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <asp:Repeater ID="RepeaterUser" runat="server">
                        <HeaderTemplate>
                            <table class="table table-head-fixed">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Full&nbsp;Name</th>
                                        <th>Address</th>
                                        <th>Email</th>
                                        <th>Passowrd</th>
                                        <th>Gender</th>
                                        <th>Date&nbsp;Of&nbsp;Birth</th>
                                        <th>Mobile&nbsp;No</th>
                                        <th>Image</th> 
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Id")%></td>
                                <td><%# Eval("FullName")%></td>
                                <td><%# Eval("Address")%></td>
                                <td><%# Eval("Email")%></td>
                                <td><%# Eval("Password")%></td>
                                <td><%# Eval("Gender")%></td>
                                <td><%# Eval("DateOfBirth","{0:dd-MM-yyyy}")%></td>
                                <td><%# Eval("MobileNo")%></td>
                                <td>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <img src='data:<%#Eval("ContentType")%>;base64,<%# Eval("Image") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("Image")) : string.Empty %>' alt="" height="50px" width="50px" cssclass="table-avatar" />
                                        </li>
                                    </ul>
                                </td>
                                <td>
                                    <a class="btn btn-danger btn-sm" href="DeleteUser.aspx?Id=<%#Eval("Email") %>">
                                        <i class="fas fa-trash"></i>
                                        Delete
                                    </a></td>
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

