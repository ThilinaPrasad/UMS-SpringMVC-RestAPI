<%--
  Created by IntelliJ IDEA.
  User: Thilina Prasad
  Date: 7/6/2018
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
    <link rel="shortcut icon" type="image/png" href="https://cdn2.iconfinder.com/data/icons/seo-flat-6/128/38_Target_Audience-32.png" />


    <style>
        .font_01 {
            font-family: 'Titillium Web', sans-serif;
        }

        .input-row{
            margin: auto 10px!important;

        }

        body{
            background-image: url("https://www.linkedin.com/sc/h/64xk850n3a8uzse6fi11l3vmz");
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
    </style>
</head>
<body>
<nav>
    <div class="nav-wrapper  blue-grey darken-2">
        <a href="/" class="brand-logo"><img src="https://cdn2.iconfinder.com/data/icons/seo-flat-6/128/38_Target_Audience-64.png"></a>
        <a href="#" data-target="mobile-nav" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        <ul class="right hide-on-med-and-down">
            <% if(session.getAttribute("logged")==null) {%>
            <li class="active"><a href="/register">Register</a></li>
            <% } else{%>
            <li ><a href="/user">View</a></li>
            <li><a href="/search">Search</a></li>
            <li><a href="/user/view/<%=session.getAttribute("logged").toString() %>">My Profile</a></li>
            <li><a href="/user/logout">Logout</a></li>
            <%}%>
        </ul>
    </div>
</nav>
<ul class="sidenav" id="mobile-nav">
    <% if(session.getAttribute("logged")==null) {%>
    <li class="active"><a href="/register">Register</a></li>
    <% } else{%>
    <li ><a href="/user">View</a></li>
    <li ><a href="/search">Search</a></li>
    <li><a href="/user/view/<%=session.getAttribute("logged").toString() %>">My Profile</a></li>
    <li><a href="/user/logout">Logout</a></li>
    <%}%>
</ul>

<div class="container">
    <div class="row">
        <div class="col s6 offset-s3 valign">
            <div class="card large" style="height: auto;">
                <div class="card-content" style="max-height: initial;">
                    <% if(session.getAttribute("logged")==null) {%>
                    <blockquote><h4 class="font_01 h1 valign-wrapper"><i class="medium material-icons">person_pin</i>&nbsp;&nbsp;Register</h4>
                    </blockquote>
                    <div class="row">
                        <form class="col s12" action="user/" name="user" method="post" id="regsiterForm">
                            <div class="row input-row">
                                <div class="input-field col s6 ">
                                    <input id="firstname" type="text" class="validate" name="firstname">
                                    <label for="firstname">First Name</label>
                                </div>
                                <div class="input-field col s6">
                                    <input id="lastname" type="text" class="validate" name="lastname">
                                    <label for="lastname">Last Name</label>
                                </div>
                            </div>
                            <div class="row input-row">
                                <div class="input-field col s12">
                                    <input id="email" type="email" class="validate" name="email">
                                    <label for="email">Email</label>
                                    <span class="helper-text" data-error="Invalid email address"></span>
                                </div>
                            </div>
                            <div class="row input-row">
                                <div class="input-field col s12">
                                    <textarea id="address" class="materialize-textarea" name="address"></textarea>
                                    <label for="address">Address</label>
                                </div>
                            </div>
                            <div class="row input-row">
                                <div class="input-field col s12">
                                    <input id="password" type="password" class="validate" name="password">
                                    <label for="password">Password</label>
                                </div>
                            </div>
                            <div class="row input-row">
                                <div class="input-field col s12">
                                    <input id="cmf_password" type="password" class="validate" name="cmf_password">
                                    <label for="cmf_password">Confirm Password</label>
                                </div>
                            </div>
                            <div class="row input-row">
                            <button type="button" class="waves-effect waves-light btn  blue-grey darken-2" onclick="registerUser();">Register</button>
                            </div>

                        </form>
                    </div>
                    <%} else {%>
                    <blockquote><h5 class="font_01 h1 valign-wrapper"><i class="medium material-icons">person_pin</i>&nbsp;&nbsp;You Already logged in !</h5>
                    </blockquote>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script>
    $(document).ready(function () {
        $(".sidenav").sidenav();
    });

    function registerUser() {
        var firstname = $("#firstname").val().trim();
        var lastname = $("#lastname").val().trim();
        var email = $("#email").val().trim();
        var address = $("#address").val().trim();
        var password = $("#password").val().trim();
        var cmf_password = $("#cmf_password").val().trim();

        if(firstname == "" || lastname == "" || email == "" || address == ""|| password == "" || cmf_password == ""){
            $.alert({
                theme: 'modern',
                boxWidth: '500px',
                useBootstrap: false,
                title: 'Warning!',
                icon:"fas fa-exclamation-circle",
                type: 'orange',
                content: 'Complere all the fields before submit!',
            });
        }else{
            if(password == cmf_password){
                $("#regsiterForm").submit();
            }else{
                $.alert({
                    theme: 'modern',
                    boxWidth: '500px',
                    useBootstrap: false,
                    title: 'Password Mismatched!',
                    icon:"fas fa-key",
                    type: 'red',
                    content: 'Password mismatched please enter again !',
                });
                $("#password").val("");
                $("#cmf_password").val("");
                $("#cmf_password").addClass("invalid");
                $("#password").addClass("invalid");
            }
        }
    }
</script>
</body>
</html>
