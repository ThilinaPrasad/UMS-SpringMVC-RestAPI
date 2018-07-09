<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
      <link rel="shortcut icon" type="image/png" href="https://cdn2.iconfinder.com/data/icons/seo-flat-6/128/38_Target_Audience-32.png" />

      <style>
          .user-img{
              width: 500px;
              height: auto;
              top: 30%;
          }

          .font_01{
              font-family: 'Titillium Web', sans-serif;
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
              <li><a href="#">Search</a></li>
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
      <li><a href="#">Search</a></li>
      <li><a href="/user/view/<%=session.getAttribute("logged").toString() %>">My Profile</a></li>
      <li><a href="/user/logout">Logout</a></li>
      <%}%>
  </ul>
  <div class="container">
      <div class="row">
          <div class="col s6 offset-s3 valign">
              <div class="card large" style="height: auto;margin-top: 50px;">
                  <div class="card-content" style="max-height: initial;padding: 10px 30px;">
                      <% if(session.getAttribute("logged")==null) {%>
                      <blockquote><h4 class="font_01 h1 valign-wrapper"><i class="medium material-icons">person_pin</i>&nbsp;&nbsp;Login</h4>
                      </blockquote>
                      <div class="row">
                          <form class="col s12" action="/user/login" name="login" method="post" >
                            <c:if test="${credentials == 'invalid'}">
                              <span class="red-text">Invalid credentials !</span>
                            </c:if>
                              <div class="row input-row">
                                  <div class="input-field col s12">
                                      <input id="email" type="email" class="validate ${credentials.toString()}" name="email">
                                      <label for="email">Email</label>
                                  </div>
                              </div>
                              <div class="row input-row">
                                  <div class="input-field col s12">
                                      <input id="password" type="password" class="validate ${credentials.toString()}" name="password">
                                      <label for="password">Password</label>
                                  </div>
                              </div>
                              <div class="row input-row">
                                  <button type="submit" class="waves-effect waves-light btn  blue-grey darken-2">Login</button>
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
      $(document).ready(function(){
          $(".sidenav").sidenav();
      });
  </script>
  </body>
</html>
