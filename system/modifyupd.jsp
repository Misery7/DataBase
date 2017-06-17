<html>
<link href="test/bootstrap.css" rel="stylesheet">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<% request.setCharacterEncoding("utf-8"); %>

    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>
    
    <link href="../css/site.css" rel="stylesheet">
    <title>操作结果</title>
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand hidden-sm" href="#">Student Address List</a>
        </div>
        <div class="navbar-collapse collapse" role="navigation">
          <ul class="nav navbar-nav">
            <li><a href="#" target="_blank">更新记录项</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right hidden-sm">
            <li><a href="dataquery.htm">返回</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="jumbotron masthead">
      <div class="container">
        <h1>Student Address List</h1>
        <h2>更新记录项</h2>
      </div>
    </div>
    <div class="container projects">
      <div class="projects-header page-header">
        <h2>操作结果</h2>
      </div><!-- /.container -->
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/addresslist?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root"/>
      <c:set var="stuno" value="${param.newstuno}"/>
      <c:set var="name" value="${param.newname}"/>
      <c:set var="gender" value="${param.newgender}"/>
      <c:set var="classno" value="${param.newclassno}"/>
      <c:set var="age" value="${param.newage}"/>
      <c:set var="tele" value="${param.newtelephone}"/>
      <c:set var="mail" value="${param.newemailadd}"/>
      <c:set var="Loginname" value="${LoginUser}"/>
      
      <sql:update dataSource="${snapshot}" var="result">
        UPDATE stu_info SET gender = ?, classno = ?, age = ?, tele = ?, mail = ? WHERE stuno = ? AND owner = ?
        <sql:param value="${gender}"/>
        <sql:param value="${classno}"/>
        <sql:param value="${age}"/>
        <sql:param value="${tele}"/>
        <sql:param value="${mail}"/>
        <sql:param value="${stuno}"/>
        <sql:param value="${Loginname}"/>
      </sql:update>
    <div class="container">
      <h3 class="text-center">修改记录成功</h3>
      <table border="1" width="100%" class="table table-striped" data-toggle="table">
      <thead>
        <tr>
           <th>学号</th>
           <th>姓名</th>
           <th>性别</th>
           <th>班级</th>
           <th>年龄</th>
           <th>联系方式</th>
           <th>邮箱</th>
        </tr>            
      </thead>
      <tbody>
        <tr>
            <td><c:out value="${stuno}"></c:out></td>
            <td><c:out value="${name}"></c:out></td>
            <td><c:out value="${gender}"></c:out></td>
            <td><c:out value="${classno}"></c:out></td>
            <td><c:out value="${age}"></c:out></td>
            <td><c:out value="${tele}"></c:out></td>
            <td><c:out value="${mail}"></c:out></td>
        </tr>
        </tbody>
      </table>
      </div>
    </div>
    <footer class="footer ">
      <div class="container">
        <div class="row footer-top">
          <div class="col-sm-6 col-lg-6">
            <h3>本网站项目由GANK小组完成。</h3>
          </div>
          <div class="col-sm-6  col-lg-5 col-lg-offset-1">
            <div class="row about">
              <div class="col-xs-6">
                <h4>关于</h4>
                <ul class="list-unstyled">
                  <li><a href="../About.html">关于我们</a></li>
                </ul>
              </div>
              <div class="col-xs-6">
                <h4>联系方式</h4>
                <ul class="list-unstyled">
                  <li><a href="#">电子邮件</a></li>
                </ul>
              </div>
            </div>    
          </div>
        </div>
      </div>
    </footer>
    <script src="../js/toc.js"></script>
    <script src="../js/site.js"></script>