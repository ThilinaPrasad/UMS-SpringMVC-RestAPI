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
    <title>${user.firstname}&nbsp;${user.lastname}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
    <link rel="shortcut icon" type="image/png" href="https://cdn2.iconfinder.com/data/icons/seo-flat-6/128/38_Target_Audience-32.png" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

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

        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,400,300);
        @import url(https://fonts.googleapis.com/css?family=Roboto:400,300,100);
        body,
        html,
        .wrapper {
            height: 100%;
            width: 100%;
        }
        body {
            font-family: 'Open Sans', sans-serif;
            color: #404040;
        }
        .wrapper {

            position: relative;
            z-index: 1;
        }
        .wrapper:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            z-index: 2;
            opacity: 0.3;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=30)";
            filter: alpha(opacity=30);
        }
        .wrapper-inner {
            position: relative;
            z-index: 3;
            height: 100%;
        }
        .box-wrapper {
            position: absolute;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            -o-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            margin-top: 40px;
            z-index: 1;
        }
        .box {
            position: relative;
            -webkit-border-radius: 8px;
            border-radius: 8px;
            -webkit-box-shadow: 0 4px 1px rgba(0,0,0,0.1);
            box-shadow: 0 4px 1px rgba(0,0,0,0.1);
            width: 380px;
            background: #fff;
            text-align: center;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding-top: 65px;
        }
        .box-inner {
            padding: 30px;
        }
        .avatar {
            -webkit-border-radius: 50%;
            border-radius: 50%;
            -webkit-box-shadow: 0 0 0 3px #c30eb8 , 0 0 0 8px #fff;
            box-shadow: 0 0 0 3px #c30eb8 , 0 0 0 8px #fff;
            top: -75px;
            margin-left: -75px;
            left: 50%;
            position: absolute;
        }
        .avatar img {
            width: 150px;
            -webkit-border-radius: 50%;
            border-radius: 50%;
            display: block;
        }
        h1,
        h2,
        h3,
        h4,
        h5 {
            font-family: 'Open Sans', sans-serif;
            font-weight: 300;
            margin-top: 0;
            margin-bottom: 15px;
        }
        .name,
        .followers-title {
            font-size: 38px;
            font-weight: 100;
            font-family: 'Roboto', sans-serif;
            margin-bottom: 2px;
            color: #3a3a3a;
        }
        .occupation {
            font-size: 18px;
            font-style: italic;
            color: #707070;
            margin-bottom: 2px;
        }
        .location {
            color: #b3b3b3;
            font-size: 14px;
            margin-top: 5px;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #f2f2f2;
        }
        .location .fa {
            color: #c6c6c6;
            margin-right: 4px;
        }
        .followers-title {
            font-size: 30px;
            color: #666;
            margin-bottom: 5px;
        }
        .followers-list {
            list-style: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            padding-bottom: 5px;
            display: table;
            margin: 0 auto;
        }
        .followers-list > li {
            display: block;
            float: left;
            margin: 0 5px;
        }
        .followers-list > li a {
            display: block;
            -webkit-border-radius: 50%;
            border-radius: 50%;
            -webkit-transition: 0.3s;
            -moz-transition: 0.3s;
            -o-transition: 0.3s;
            -ms-transition: 0.3s;
            transition: 0.3s;
            height: 45px;
            width: 45px;
            text-decoration: none;
        }
        .followers-list > li a img {
            -webkit-border-radius: 50%;
            border-radius: 50%;
            width: 45px;
            display: block;
            -webkit-transition: 0.3s;
            -moz-transition: 0.3s;
            -o-transition: 0.3s;
            -ms-transition: 0.3s;
            transition: 0.3s;
            -webkit-backface-visibility: hidden;
            -moz-backface-visibility: hidden;
            -ms-backface-visibility: hidden;
            backface-visibility: hidden;
            height: 45px;
        }
        .followers-list > li a:hover img {
            opacity: 0.8;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=80)";
            filter: alpha(opacity=80);
        }
        .followers-list > li.follow-list-item a {
            background: #4d4d4d;
            color: #fff;
        }
        .followers-list > li.follow-list-item a:hover {
            background: #c30eb8;
        }
        .followers-list > li.follow-list-item .fa-plus {
            display: block;
            height: 45px;
            width: 45px;
            line-height: 45px;
        }
        .social-list {
            list-style: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            padding-top: 1px;
            display: table;
            margin: 0 auto;
        }
        .social-list > li {
            float: left;
            display: block;
        }
        .social-list > li > a {
            display: block;
            width: 45px;
            height: 55px;
            line-height: 55px;
            font-size: 28px;
            text-decoration: none;
            color: #b3b3b3;
            border-right: 1px solid #ededed;
            -webkit-transition: 0.2s;
            -moz-transition: 0.2s;
            -o-transition: 0.2s;
            -ms-transition: 0.2s;
            transition: 0.2s;
        }
        .social-list > li > a:hover {
            background: #c30eb8;
            color: #fff;
        }
        .social-list > li > a:hover.fa-facebook {
            background: #3b5998;
        }
        .social-list > li > a:hover.fa-dribbble {
            background: #c32361;
        }
        .social-list > li > a:hover.fa-twitter {
            background: #55acee;
        }
        .social-list > li > a:hover.fa-pinterest {
            background: #cd2129;
        }
        .social-list > li > a:hover.fa-linkedin {
            background: #1683bc;
        }
        .social-list > li:last-child > a {
            border-right: none;
        }

    </style>
</head>
<body>
<nav>
    <div class="nav-wrapper  blue-grey darken-2">
        <a href="/" class="brand-logo"><img src="https://cdn2.iconfinder.com/data/icons/seo-flat-6/128/38_Target_Audience-64.png"></a>
        <a href="#" data-target="mobile-nav" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        <ul class="right hide-on-med-and-down">
            <li ><a href="/user">View</a></li>
            <li><a href="#">Search</a></li>
            <li><a href="/register">Register</a></li>
        </ul>
    </div>
</nav>

<ul class="sidenav" id="mobile-nav">
    <li><a href="/user">View</a></li>
    <li><a href="#">Search</a></li>
    <li><a href="/register">Register</a></li>
</ul>

<div class="wrapper">
    <div class="wrapper-inner">
        <div class="box-wrapper">
            <div class="box">
                <div class="avatar">
                    <img src="https://www.atomix.com.au/media/2015/06/atomix_user31.png">
                </div>
                <div class="box-inner">
                    <h3 class="name">${user.firstname}&nbsp;${user.lastname}</h3>
                    <a href="mailto:${user.email}" class="occupation"><i class="fas fa-at"></i>&nbsp${user.email}</a>
                    <p class="location"><i class="fas fa-map-marker-alt"></i>&nbsp;${user.address}</p>
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
</script>
</body>
</html>
