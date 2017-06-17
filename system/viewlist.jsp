<!DOCTYPE html>
<html lang="zh-CN"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    <meta charset="utf-8">
    <title>查看通讯录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    
    <!-- Site CSS -->
    <link href="test/font-awesome.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>
    
    <link href="test/site.css" rel="stylesheet">

    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/extensions/editable/bootstrap-table-editable.js"></script>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- Favicons -->
    
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
            <li><a href="#" target="_blank">查看通讯录</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right hidden-sm">
            <li><a href="../Manage.jsp">返回主菜单</a></li>
          </ul>
        </div>
      </div>
    </div>  
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/addresslist?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root"/>
      <c:set var="Loginname" value="${LoginUser}"/>
      <sql:query dataSource="${snapshot}" var="result">
      SELECT * FROM stu_info where owner=?
      <sql:param value="${Loginname}"/>
      </sql:query>        

    <div class="jumbotron masthead">
      <div class="container">
        <h1>Student Address List</h1>
        <h2>查看通讯录</h2>
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
    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="test/toc.js"></script>
    <script src="test/site.js"></script>
    <script>
      $(document).ready(function(){
          $('#qqgroup').text(qqgroup);
      });
    </script>



<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"><i class="fa fa-angle-up"></i></a></body></html>