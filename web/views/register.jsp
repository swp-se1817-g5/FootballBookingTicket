<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />
        <meta name="description" content="EduChamp : Education HTML Template" />
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
        <title>Booking Football Ticket </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" type="text/css" href="./assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/typography.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/shortcodes/shortcodes.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="./assets/css/color/color-1.css">
        <style>
            body {
                font-family: 'Helvetica', sans-serif;
            }
            .title-head {
                font-family: 'Helvetica', sans-serif;
            }
            .title-under {
                font-family: 'Helvetica', sans-serif;
            }
            .btn {
                font-family: 'Helvetica', sans-serif;
            }

            .button-md {
                font-family: 'Helvetica', sans-serif;
            }
            input:-webkit-autofill,
            input:-webkit-autofill:hover,
            input:-webkit-autofill:focus,
            input:-webkit-autofill:active {
                -webkit-box-shadow: 0 0 0 1000px white inset !important;
                box-shadow: 0 0 0 1000px white inset !important;
                -webkit-text-fill-color: black !important;
            }
            /* Thiết lập vị trí tương đối cho input-group để chứa label và input */
            .input-group {
                position: relative;
                margin-bottom: 1.5rem; /* Để tạo khoảng cách giữa các input groups */
            }

            /* Đảm bảo rằng input có khoảng cách padding để label có thể nhảy lên trên */
            .input-group input {
                padding-top: 1.5rem;
                box-sizing: border-box;
                width: 100%;
            }

            /* Thiết lập vị trí ban đầu của label */
            .input-group label {
                position: absolute;
                top: 0; /* Đặt vị trí top là 0 để label nằm sát đầu dòng */
                left: 0;
                transition: all 0.2s;
                pointer-events: none; /* Để label không ảnh hưởng khi nhấp vào input */
                color: #999;
            }

            /* Khi input được focus hoặc có giá trị, di chuyển label lên trên */
            .input-group input:focus + label,
            .input-group input:not(:placeholder-shown) + label {
                top: -1rem; /* Điều chỉnh vị trí top để label nhảy lên trên */
                left: 0;
                font-size: 0.75rem;
                color: #5a5a5a;
            }

            /* Điều chỉnh vị trí của icon để nó nằm đúng chỗ */
            .input-group i {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
            }

        </style>
    </head>
    <body id="bg">
        <div class="page-wraper">
            <div class="account-form">
                <div class="account-head" style="background-image:url(./assets/images/background/bg2.jpg);">
                    <a href="index.html"><img src="./images/logo/FBT.png" alt=""></a>
                </div>
                <div class="account-form-inner">
                    <div class="account-container">
                        <div class="heading-bx left">
                            <h2 class="title-head">Đăng <span>Ký</span></h2>
                            <p>Đăng nhập tài khoản của bạn <a href="./login">Ở đây</a></p>
                            <p>Quay lại <a href="./homePage">Trang chủ</a></p>
                        </div>
                        <c:if test="${not empty errorMessage}">
                            <p style="color:red">${errorMessage}</p>
                        </c:if>
                        <form class="contact-bx" id="login-form" action="register" method="post" onsubmit="return checkcaptcha()">
                            <div class="row placeani">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">

                                            <input value="${name}" class="form-control"
                                                   ${registerEmail != null ? "hidden" : ""}
                                                   name="name" id="name" required class="form-control" placeholder=" ">
                                            <label for="name" ${registerEmail != null ? "hidden" : ""}>Họ và Tên</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">

                                            <input type="email" value="${email}" class="form-control"
                                                   ${registerEmail != null ? "hidden" : ""}
                                                   name="email" id="email" required class="form-control" placeholder=" ">
                                            <label for="email" class="form-label"
                                                   ${registerEmail != null ? "hidden" : ""}>Email</label>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${registerEmail != null}">
                                    <input type="text"
                                           class="form-control"
                                           hidden="true"
                                           value="${avatar}"
                                           name="avatar"/>
                                </c:if>
                                <input name="registerEmail" value="${registerEmail}" hidden="true"/>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="text" value="${phone}" class="form-control"
                                                   name="phoneNumber" id="phoneNumber"
                                                   required class="form-control" placeholder=" ">
                                            <label for="phoneNumber" class="form-label">Số điện thoại</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="password" class="form-control" name="password"
                                                   id="password" required>
                                            <label for="password" class="form-label">Mật khẩu</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="password" class="form-control" name="confirmPassword"
                                                   id="confirmPassword"
                                                   required>
                                            <label for="confirmPassword" class="form-label">Nhập lại mật khẩu</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="" type="checkbox"
                                               value="terms-and-conditions" name="iAgree"
                                               id="iAgree" required>
                                        <label class="form-check-label text-secondary fs-5" for="iAgree" style="font-weight: 400;">
                                            Đồng ý với <a href="./term"
                                                          class="link-primary text-decoration-none text-info">
                                                điều khoản và điều lệ!
                                            </a>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-12 m-b30">
                                    <div class="g-recaptcha" data-sitekey="6LewHgEqAAAAAM2B3lhHY6yT54lRyRRTL2fwZLqV"></div>
                                    <div style="color: red" id="error"></div>
                                    <button name="submit" type="submit" onclick="validateSignupForm()" value="Submit" class="btn button-md">Đăng ký</button>
                                </div>
                                <div class="col-lg-12">
                                    <h6 class="title-under">Đăng ký với</h6>
                                    <div class="d-flex">
                                        <a class="btn flex-fill m-r5 facebook" href="https://www.facebook.com/v19.0/dialog/oauth?fields=id,name,email&client_id=2789778564531786&redirect_uri=http://localhost:8080/BookingFootballTicket/loginFB"><i class="fa fa-facebook"></i>Facebook</a>
                                        <a class="btn flex-fill m-l5 google-plus" href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/BookingFootballTicket/gmail&response_type=code&client_id=710226049781-g37fdin0lmq797dniqao07fsr27oj20j.apps.googleusercontent.com&approval_prompt=force"><i class="fa fa-google"></i>Google</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- External JavaScripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src='assets/vendors/switcher/switcher.js'></script>
        <script>
                                        var regexPassword = '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$';
                                        var regexEmail = '^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$';

                                        var password = document.getElementById("password"),
                                                confirm_password = document.getElementById("confirmPassword"),
                                                email = document.getElementById("email");

                                        function validatePassword() {
                                            var passwordValue = password.value;
                                            if (!new RegExp(regexPassword).test(passwordValue)) {
                                                password.setCustomValidity("Mật khẩu cần ít nhất 8 kí tự bao gồm: ký tự chữ thường, ít nhất 1 ký tự viết hoa và 1 ký tự số.");
                                                return false;
                                            } else {
                                                password.setCustomValidity('');
                                                return true;
                                            }
                                        }

                                        function validateConfirmPassword() {
                                            if (password.value !== confirm_password.value) {
                                                confirm_password.setCustomValidity("Mật khẩu phải trùng khớp!");
                                                return false;
                                            } else {
                                                confirm_password.setCustomValidity('');
                                                return true;
                                            }
                                        }

                                        function validateEmail() {
                                            var emailValue = email.value;
                                            if (!new RegExp(regexEmail).test(emailValue)) {
                                                email.setCustomValidity("Địa chỉ email không hợp lệ.");
                                                return false;
                                            } else {
                                                email.setCustomValidity('');
                                                return true;
                                            }
                                        }

                                        password.onchange = validatePassword;
                                        confirm_password.onkeyup = validateConfirmPassword;
                                        email.onchange = validateEmail;

                                        function validateSignupForm() {
                                            var form = document.getElementById('signupForm');

                                            for (var i = 0; i < form.elements.length; i++) {
                                                if (form.elements[i].value === '' && form.elements[i].hasAttribute('required')) {
                                                    console.log('Có một số trường bắt buộc!');
                                                    return false;
                                                }
                                            }

                                            if (!validatePassword() || !validateConfirmPassword() || !validateEmail()) {
                                                return false;
                                            }

                                            onSignup(); // Ensure this function exists and is defined elsewhere in your script
                                        }
        </script>

        <script type="text/javascript">
            function checkcaptcha() {
                var form = document.getElementById("login-form");
                var error = document.getElementById("error");
                const response = grecaptcha.getResponse();
                if (response.length === 0) {
                    error.textContent = "Vui lòng xác thực nếu bạn không phải là người máy!";
                    return false; // Prevent form submission
                }
                return true; // Allow form submission
            }
        </script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </body>
</html>
