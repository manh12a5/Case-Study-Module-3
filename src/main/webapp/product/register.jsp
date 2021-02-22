<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign up</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #17a2b8;
            height: 100vh;
        }

        #signup .container #signup-row #signup-column #signup-box {
            margin-top: 10px;
            max-width: 600px;
            height: 750px;
            border: 1px solid #9C9C9C;
            background-color: #EAEAEA;
        }

        #signup .container #signup-row #signup-column #signup-box #signup-form {
            padding: 20px;
        }

        #signup .container #signup-row #signup-column #signup-box #signup-form #register-link {
            margin-top: -85px;
        }

        #notice {
            color: orange;
        }

    </style>
</head>
<body>
<div id="signup">
    <div class="container">
        <div id="signup-row" class="row justify-content-center align-items-center">
            <div id="signup-column" class="col-md-6">
                <div id="signup-box" class="col-md-12">
                    <form id="signup-form" class="form" action="/register" method="post">
                        <h3 class="text-center text-info">Sign up</h3>
                        <div class="form-group">
                            <label for="fullname" class="text-info">Full name:</label><br>
                            <input type="text" name="fullname" id="fullname" class="form-control"
                                   placeholder="enter your name">
                        </div>
                        <div class="form-group">
                            <label for="birthday" class="text-info">Birthday:</label><br>
                            <input type="date" name="birthday" id="birthday" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="email" class="text-info">Email:</label><br>
                            <input type="text" name="email" id="email" class="form-control"
                                   placeholder="enter your email">
                            <p class="help-block" id="notice">* Your registered email is your username to login</p>
                        </div>
                        <div class="form-group">
                            <label for="password" class="text-info">Password:</label><br>
                            <input type="password" name="password" id="password" class="form-control"
                                   placeholder="enter your password">
                        </div>
                        <div class="form-group">
                            <label for="re-password" class="text-info">Confirm Password:</label><br>
                            <input type="password" name="re-password" id="re-password" class="form-control"
                                   placeholder="re-enter your password">
                        </div>
                        <div class="form-group">
                            <label for="phone-number" class="text-info">Phone number:</label><br>
                            <input type="number" name="phone-number" id="phone-number" class="form-control"
                                   placeholder="enter your phone number">
                        </div>
                        <div class="form-group">
                            <label for="address" class="text-info">Address:</label><br>
                            <input type="text" name="address" id="address" class="form-control"
                                   placeholder="enter your address">
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" class="btn btn-info btn-md" value="register">
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

