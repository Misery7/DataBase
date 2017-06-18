<!DOCTYPE html>
<html lang="zh-CN"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>

    <link href="../css/site.css" rel="stylesheet">
    <link href="test/site.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/extensions/editable/bootstrap-table-editable.js"></script>
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
            <li><a href="#" target="_blank">查询记录项</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right hidden-sm">
            <li><a href="../Manage.jsp">返回</a></li>
          </ul>
        </div>
      </div>
    </div>

    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/addresslist?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root"/>
      <c:set var="highage" value="${param.agehigh}"/>
      <c:set var="lowage" value="${param.agelow}"/>
      <c:set var="Loginname" value="${LoginUser}"/>
      <sql:query dataSource="${snapshot}" var="result">
      SELECT * FROM stu_info WHERE age>=? AND age<=? AND owner=?
      <sql:param value="${lowage}"/>
      <sql:param value="${highage}"/>
      <sql:param value="${Loginname}"/>
      </sql:query>  

    <div class="jumbotron masthead">
      <div class="container">
        <h1>Student Address List</h1>
        <h2>查询通讯录</h2>
      </div>
    </div>

    <div class="container projects">
      <div class="projects-header page-header">
        <h2><c:out value="${Loginname}"/>的个人通讯录</h2>
      </div><!-- /.container -->
      <div class="container">
          <div id="toolbar">
              <button id="remove" class="btn btn-danger" disabled>
                  <i class="glyphicon glyphicon-remove"></i> Delete
              </button>
          </div>
      <table id="table"
             class="table table-striped"
             data-toolbar="#toolbar"
             data-show-export="true"
             data-pagination="true"
             data-show-refresh="true"
             data-search="true"
             data-show-pagination-switch="true"
             border="1"
             data-toggle="table">
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
          <c:forEach var="row" items="${result.rows}">
          <tr>
              <td><c:out value="${row.stuno}"/></td>
              <td><c:out value="${row.name}"/></td>
              <td><c:out value="${row.gender}"/></td>
              <td><c:out value="${row.classno}"/></td>
              <td><c:out value="${row.age}"/></td>
              <td><c:out value="${row.tele}"/></td>
              <td><c:out value="${row.mail}"/></td>
          </tr>
          </c:forEach>
        </tbody>       
      </table>
      </div>
    </div>

    <footer class="footer">
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