<html>
<link href="test/bootstrap.css" rel="stylesheet">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<% request.setCharacterEncoding("utf-8"); %>
    <link href="test/font-awesome.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>   
    <link href="test/site.css" rel="stylesheet">
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
            <li><a href="#" target="_blank">修改记录项</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right hidden-sm">
            <li><a href="../Manage.jsp">返回</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="jumbotron masthead">
      <div class="container">
        <h1>Student Address List</h1>
        <h2>修改记录项</h2>
      </div>
    </div>

    <div class="container projects">
      <div class="projects-header page-header">
        <h2>查询结果</h2>
      </div><!-- /.container -->
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/addresslist?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root"/>
      <c:set var="sname" value="${param.stuname}"/>
      <c:set var="Loginname" value="${LoginUser}"/>
      <sql:query dataSource="${snapshot}" var="result">
      SELECT * FROM stu_info WHERE name=? AND owner=?
      <sql:param value="${sname}"/>
      <sql:param value="${Loginname}"/>
      </sql:query>        
        <c:forEach var="row" items="${result.rows}">
          <tr>
              <c:set var="ssno" value="${row.stuno}"/>
              <c:set var="ssname" value="${row.name}"/>
              <c:set var="ssgender" value="${row.gender}"/>
              <c:set var="ssclassno" value="${row.classno}"/>
              <c:set var="ssage" value="${row.age}"/>
              <c:set var="sstele" value="${row.tele}"/>
              <c:set var="ssmail" value="${row.mail}"/>
          </tr>
        </c:forEach>
    <div class="container col-xs-4 col-md-offset-4">
      <form method="post" action="modifyupd.jsp">
      <h3 class="text-center">更新信息</h3>  
      <div class="form-group">
        <label for="StudentNumber">学号</label>
        <input type="text" class="form-control" name="newstuno" placeholder="Student Number" value="${ssno}" readonly="readonly">
      </div>
      <div class="form-group">
        <label for="Name">姓名</label>
        <input type="text" class="form-control" name="newname" placeholder="Name" value="${ssname}" readonly="readonly">
      </div>
      <div class="form-group">
        <label for="Gender">性别</label>
        <input type="text" class="form-control" name="newgender" placeholder="Gender" value="${ssgender}">
      </div>
      <div class="form-group">
        <label for="ClassNo">班级</label>
        <input type="text" class="form-control" name="newclassno" placeholder="ClassNo" value="${ssclassno}">
      </div>
      <div class="form-group">
        <label for="Age">年龄</label>
        <input type="text" class="form-control" name="newage" placeholder="Age" value="${ssage}">
      </div>
      <div class="form-group">
        <label for="Telephone">联系方式</label>
        <input type="text" class="form-control" name="newtelephone" placeholder="Telephone" value="${sstele}">
      </div>
      <div class="form-group">
        <label for="Email">邮箱</label>
        <input type="email" class="form-control" name="newemailadd" placeholder="Email Address" value="${ssmail}">
      </div>
      <div class="container col-xs-6 col-md-offset-3">
        <button type="submit" class="btn btn-default btn-block">更新</button>
      </div>
    </form>
    </div>
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
    <script src="test/toc.js"></script>
    <script src="test/site.js"></script>
