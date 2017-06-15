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
    <link href="test/bootstrap.css" rel="stylesheet">
    <link href="test/font-awesome.css" rel="stylesheet">
    <link href="test/site.css" rel="stylesheet">
    <link rel="stylesheet" href="dropkick.css" type="text/css">
    <script src="jquery.js"></script>
    <script src="dropkick.js"></script>
    <title>查询结果</title>
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
          <a class="navbar-brand hidden-sm" href="#">Spider For Ctrip</a>
        </div>
        <div class="navbar-collapse collapse" role="navigation">
          <ul class="nav navbar-nav">
            <li><a href="#" target="_blank">数据查询</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right hidden-sm">
            <li><a href="dataquery.htm">返回查询</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="jumbotron masthead">
      <div class="container">
        <h1>Spider For Ctrip</h1>
        <h2>数据查询</h2>
      </div>
    </div>
    <div class="container projects">
      <div class="projects-header page-header">
        <h2>查询结果如下</h2>
      </div><!-- /.container -->
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://139.224.133.30:3306/ctrip?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="1502"/>
      <c:set var="pricelow" value="${param.pricelow}"/>
      <c:set var="punclow" value="${param.punclow}"/>
      <c:set var="punchigh" value="${param.punchigh}"/>
      <sql:query dataSource="${snapshot}" var="result">
      SELECT * from flight WHERE Price > ?
      <sql:param value="${pricelow}"/>
      </sql:query>
    <div class="container">
      <table border="1" width="100%" class="table table-striped">
      <tr>
         <th>航班号</th>
         <th>出发城市</th>
         <th>到达城市</th>
         <th>出发机场</th>
         <th>到达机场</th>
         <th>出发准点率</th>
         <th>到达准点率</th>
         <th>出发航站楼</th>
         <th>到达航站楼</th>
         <th>出发时间</th>
         <th>到达时间</th>
         <th>机票价格</th>
      </tr>
      <c:forEach var="row" items="${result.rows}">
      <tr>
         <td><c:out value="${row.Flight_Num}"/></td>
         <td><c:out value="${row.D_City}"/></td>
         <td><c:out value="${row.A_City}"/></td>
         <td><c:out value="${row.D_Airport}"/></td>  
         <td><c:out value="${row.A_Airport}"/></td>
         <td><c:out value="${row.D_Punctuality_Rate}"/></td>
         <td><c:out value="${row.A_Punctuality_Rate}"/></td>
         <td><c:out value="${row.D_Terminal}"/></td>
         <td><c:out value="${row.A_Terminal}"/></td>
         <td><c:out value="${row.D_Time}"/></td>
         <td><c:out value="${row.A_Time}"/></td>
         <td><c:out value="${row.Price}"/></td>
      </tr>
      </c:forEach>
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
    <script src="test/jquery_003.js"></script>
    <script src="test/bootstrap.js"></script>
    <script src="test/jquery_004.js"></script>
    <script src="test/jquery_002.js"></script>
    <script src="test/toc.js"></script>
    <script src="test/jquery.js"></script>
    <script src="test/site.js"></script>

  <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"><i class="fa fa-angle-up"></i></a></body></html>