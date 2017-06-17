<!DOCTYPE html>
<html lang="zh-cn"><head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
    <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>
  </head>

  <body>

      <sql:setDataSource var="addlist" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/addresslist?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root"/>
      <c:set var="username" value="${param.uname}"/>
      <c:set var="pwd" value="${param.upwd}"/>
      <sql:query dataSource="${addlist}" var="result">
        SELECT password from user WHERE username = ?
      <sql:param value="${username}"/>
      </sql:query>
      <c:forEach var="row" items="${result.rows}" begin="0" end="0">
        <c:set var="qres" value="${row.password}"/>
      </c:forEach>
      <c:if test="${pwd==qres}">
        <% 
        String login=request.getParameter("uname");
        session.setAttribute("LoginUser",login);
        %>
        <c:redirect url="Manage.jsp"/>
      </c:if>
    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  
  </body>
</html>