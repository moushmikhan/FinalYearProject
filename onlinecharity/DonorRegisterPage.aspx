<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DonorRegisterPage.aspx.cs" Inherits="DonorRegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>online charity management system</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>
<body>
    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid p-0">
                    <div class="row align-items-center justify-content-between no-gutters">
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo-img">
                                <a href="Index.aspx">
                                    <img src="img/anil projectlogo.png" width="100" height="100" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-7">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="Index.aspx">Home</a></li>
                                        <li><a href="AboutUs.aspx">About</a></li>
                                        <li><a href="ContactUs.aspx">Contact</a></li>
                                        <li><a href="RegisterPage.aspx">Register</a></li>
                                        <li><a href="LoginPage.aspx">Log In</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- breadcam_area_start -->
    <div class="breadcam_area bradcam_bg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="breadcam_text">
                        <h3>Donor Registration</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-12 col-lg-9 col-xl-7">
                    <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Donor Registration</h3>
                            <form id="form1" runat="server">
                                <div class="row">
                                    <div class="col-md-4 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="form3Example1m">First name</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="required field" ForeColor="Red" ControlToValidate="txtFirstName" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="form3Example1n">Middle name</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="required field" ForeColor="Red" ControlToValidate="txtMiddleName" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="form3Example1n">Last name</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="required field" ForeColor="Red" ControlToValidate="txtLastName" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label">Gender</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="required field" ForeColor="Red" ControlToValidate="ddlGender" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                                <asp:ListItem>--Select gender--</asp:ListItem>
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                                <asp:ListItem>Other</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">

                                        <div class="form-outline">
                                            <label class="form-label" for="form3Example97">Mobile Number</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="required field" ForeColor="Red" ControlToValidate="txtMobileNo" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 mb-4">
                                        <div class="form-outline">
                                            <label class="form-label" for="form3Example8">Address</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="required field" ForeColor="Red" ControlToValidate="txtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 mb-4">
                                        <label class="form-label" for="form3Example9">State</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="required field" ForeColor="Red" ControlToValidate="txtState" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 mb-4">
                                        <label class="form-label" for="form3Example9">City</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="required field" ForeColor="Red" ControlToValidate="txtCity" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 mb-4">
                                        <label class="form-label" for="form3Example90">Pincode</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="required field" ForeColor="Red" ControlToValidate="txtPincode" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <label class="form-label" for="form3Example97">Email ID</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="required field" ForeColor="Red" ControlToValidate="txtEmailId" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmailId" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ForeColor="Red" Display="Dynamic" ErrorMessage="Invalid email address"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="txtEmailId" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <label class="form-label" for="form3Example99">Password</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="required field" ForeColor="Red" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-end pt-3">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="boxed-btn4" OnClick="btnSubmit_Click" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">Join With Us
                            </h3>
                            <p class="footer_text doanar">
                                <ul>
                                    <li>
                                        <a href="VolunteerRegisterPage.aspx">Become a Volunteer</a>
                                    </li>
                                    <li>
                                        <a href="DonorRegisterPage.aspx">Become a Donor</a>
                                    </li>
                                </ul>
                            </p>

                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">address
                            </h3>
                            <p class="footer_text">
                                Rabodi Thane (W)
                                <br>
                                +91 9702941523
                                <br>
                                <a class="domain" href="#">onlinecharity@gmail.com</a>
                            </p>
                            <div class="socail_links">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-facebook-square"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-lg-2">
                        <div class="footer_widget">
                            <h3 class="footer_title">Navigation
                            </h3>
                            <ul>
                                <li><a href="Index.aspx">Home</a></li>
                                <li><a href="#">Events</a></li>
                                <li><a href="AboutUs.aspx">About</a></li>
                                <li><a href="#">News</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-lg-4">
                        <div class="footer_widget">
                            <h3 class="footer_title">Newsletter
                            </h3>
                            <form action="#" class="newsletter_form">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit">Sign Up</button>
                            </form>
                            <p class="newsletter_text">Subscribe newsletter to get updates</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="footer_border"></div>
                <div class="row">
                    <div class="col-xl-12">
                        <p class="copy_right text-center">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved | Develop By Ismail Khan</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer_end -->

    <!-- JS here -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>

    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>

    <script src="js/main.js"></script>
</body>
</html>
