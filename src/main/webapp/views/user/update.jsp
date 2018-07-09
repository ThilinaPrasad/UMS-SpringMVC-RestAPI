<%@ page import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder" %><%--
  Created by IntelliJ IDEA.
  User: Thilina Prasad
  Date: 7/6/2018
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update user</title>
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
            <li ><a href="/register">Register</a></li>
            <% } else{%>
            <li ><a href="/user">View</a></li>
            <li ><a href="/search">Search</a></li>
            <li><a href="/user/view/<%=session.getAttribute("logged").toString() %>">My Profile</a></li>
            <li><a href="/user/logout">Logout</a></li>
            <%}%>
        </ul>
    </div>
</nav>
<ul class="sidenav" id="mobile-nav">
    <% if(session.getAttribute("logged")==null) {%>
    <li ><a href="/register">Register</a></li>
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
                    <blockquote><h4 class="font_01 h1 valign-wrapper"><i class="medium material-icons">person_pin</i>&nbsp;&nbsp;Edit user</h4>
                    </blockquote>
                    <div class="row">
                        <form class="col s12" action="/user/update" method="post" name="user">
                            <input type="hidden" value="${user.id}" name="id">
                            <div class="row input-row">
                                <div class="input-field col s6 ">
                                    <input id="firstname" type="text" class="validate" name="firstname" value="${user.firstname}">
                                    <label for="firstname">First Name</label>
                                </div>
                                <div class="input-field col s6">
                                    <input id="lastname" type="text" class="validate" name="lastname" value="${user.lastname}">
                                    <label for="lastname">Last Name</label>
                                </div>
                            </div>
                            <div class="row input-row">
                                <div class="input-field col s12">
                                    <input id="email" type="email" class="validate" name="email" value="${user.email}" readonly>
                                    <label for="email">Email</label>
                                </div>
                            </div>
                            <div class="row input-row">
                                <div class="input-field col s12">
                                    <textarea id="address" class="materialize-textarea" name="address">${user.address}</textarea>
                                    <label for="address">Address</label>
                                </div>
                            </div>
                            <div class="row input-row">
                                <div class="input-field col s12">
                                    <input id="password" type="password" class="validate ${password.toString()}" name="password">
                                    <label for="password">Password</label>
                                    <span class="helper-text" data-error="Invalid password"></span>
                                </div>
                            </div>
                            <div class="row input-row">
                                <button id="submit" type="submit" class="waves-effect waves-light btn  blue-grey darken-2">Save Changes</button>
                            </div>

                        </form>
                    </div>
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

    if(${success}) {
        $.alert({
            theme: 'modern',
            boxWidth: '500px',
            useBootstrap: false,
            title: 'Success!',
            icon: "far fa-check-circle",
            type: 'green',
            content: 'User data successfully updated!',
        });
    }
</script>
</body>
</html>
