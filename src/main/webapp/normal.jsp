<%@page import="com.learn.mycart.entites.User"%>
<%
    User user=(User) session.getAttribute("currentuser");
    if(user==null){
        session.setAttribute("message", "you are Not Logged In!!!Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
        if(user.getUserType().equals("normal")){
            session.setAttribute("message", "you are not admin do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>This is Normal User Panel</h1>
    </body>
</html>
