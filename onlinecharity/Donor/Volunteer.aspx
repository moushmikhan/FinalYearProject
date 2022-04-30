<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/DonorMasterPage.master" AutoEventWireup="true" CodeFile="Volunteer.aspx.cs" Inherits="Donor_Volunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Volunteer Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Volunteer Page</li>
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
                    <h3 class="card-title">Volunteer</h3>
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
                                <label for="exampleInputAddress">First Name</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtFirstName" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputAddress">Last Name</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtLastName" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputAddress">Mobile No</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMobileNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Mobile No" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Mobile Number.Please Enter Mobile Number" ControlToValidate="txtMobileNo" ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="form3Example9">Skillsets / Area Of Interests</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtSkillsets" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtSkillsets" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="9"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="form3Example9">Days of work</label>
                                <asp:CheckBoxList ID="cbDaysOfWork" runat="server">
                                    <asp:ListItem>Monday</asp:ListItem>
                                    <asp:ListItem>Tuesday</asp:ListItem>
                                    <asp:ListItem>Wendesday</asp:ListItem>
                                    <asp:ListItem>Thursday</asp:ListItem>
                                    <asp:ListItem>Friday</asp:ListItem>
                                    <asp:ListItem>Saturday</asp:ListItem>
                                    <asp:ListItem>Sunday</asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtAddress">Address</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtAddress">State</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtState" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtAddress">City</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCity" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtAddress">Pincode</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPincode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="form3Example97">Commets</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCommets" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtCommets" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
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
                    <h3 class="card-title">Event Data</h3>
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
                                        <th>DaysOfWork </th>
                                        <th>Commets</th>
                                        <th>Status</th>
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
                                <td><%# Eval("State")%></td>
                                <td><%# Eval("City")%></td>
                                <td><%# Eval("Pincode")%></td>
                                <td><%# Eval("Skillsets")%></td>
                                <td><%# Eval("DaysOfWork")%></td>
                                <td><%# Eval("Commets")%></td>
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

