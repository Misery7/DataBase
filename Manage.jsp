<!DOCTYPE html>
<html class="dk_fouc has-js" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<% request.setCharacterEncoding("utf-8"); %>
    <meta charset="utf-8">
    <title>学生通讯录管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Loading Bootstrap -->
    <link href="css/admin/bootstrap_m.css" rel="stylesheet">
    <!-- Loading Flat UI -->
    <link href="css/admin/flat-ui.css" rel="stylesheet">
    <link rel="shortcut icon" href="http://www.bootcss.com/p/flat-ui/images/favicon.ico">
  </head>
  <body>
    <div class="container">
       <div class="navbar navbar-inverse">
          <div class="navbar-inner">
              <ul class="nav">
                <li><a href="index.html">Student Address List</a></li>
                <li><a href="About.html">About Us</a></li>
              </ul>
              <ul class="nav pull-right">
                <li><a href="#">CurrentUser : <% out.print(session.getAttribute("LoginUser")); %></a></li>
                <li><a href="Login.html">Quit</a></li>
              </ul>
          </div>
       </div>
    </div>

    <div class="container">

      <div class="row demo-tiles">
        <div class="span3">
          <div class="tile">
            <img class="tile-image big-illustration" alt="" src="img/compass.png">
            <h3 class="tile-title">查看通讯录</h3>
            <p>Configure the websites for the spider.</p>
            <a class="btn btn-primary btn-large btn-block" href="system/viewlist.jsp">Get Started</a>
          </div>
        </div>

        <div class="span3">
          <div class="tile">
            <img class="tile-image" alt="" src="img/infinity.png">
            <h3 class="tile-title">修改通讯录</h3>
            <p>Configure the setting for the need.</p>
            <a class="btn btn-primary btn-large btn-block" href="system/modifylist.htm">Get Started</a>
          </div>
        </div>

        <div class="span3">
          <div class="tile">
            <img class="tile-image" alt="" src="img/colors.png">
            <h3 class="tile-title">删除记录项</h3>
            <p>Collect data needed from Internet. </p>
            <a class="btn btn-primary btn-large btn-block" href="system/deleterec.html">Get Started</a>
          </div>
        </div>


        <div class="span3">
          <div class="tile">
            <img class="tile-image big-illustration" alt="" src="img/share.png">
            <h3 class="tile-title">按条件查询</h3>
            <p>Query data from database quickly.</p>
            <a class="btn btn-primary btn-large btn-block" href="system/dataquery.html">Get Started</a>
          </div>
        </div>
      </div>
    </div>  

    <div class="container"> 

        <div class="row demo-tiles">
        <div class="span3">
        </div>

        <div class="row demo-tiles">
        <div class="span3">
          <div class="tile">
            <img class="tile-image big-illustration" alt="" src="img/time.png">
            <h3 class="tile-title">增加记录项</h3>
            <p>Analyse the data and predict the trend.</p>
            <a class="btn btn-primary btn-large btn-block" href="system/insertrec.html">Get Started</a>
          </div>
        </div>

        <div class="span3">
          <div class="tile">
            <img class="tile-image big-illustration" alt="" src="img/bag.png">
            <h3 class="tile-title">系统管理</h3>
            <p>Manage your identify and password or ask for help.</p>
            <a class="btn btn-primary btn-large btn-block" href="#">Get Started</a>
          </div>
        </div>

      </div> <!-- /tiles -->
    </div>
  </div>

    <footer>
      <div class="container">
        <div class="row">
          <div class="span7">
            <h3 class="footer-title">Subscribe</h3>
            <p>Do you like this?<br>
              We spent much time working on the course designs.<br>
              Go to: <a href="http://user.qzone.qq.com/1061209264" target="_blank">chat with us</a>
            </p>
            <a class="footer-brand" href="#" target="_blank">
            </a>
            <p>Powered By Gank</p>
          </div> <!-- /span8 -->

          <div class="span5">
            <div class="footer-banner">
              <h3 class="footer-title">学生通讯录管理项目</h3>
              <ul>
                <li>基于Flat UI开发</li>
                <li>基于Bootstrap开发</li>
                <li>可视化分析</li>
              </ul>
              Go to: <a href="http://cs.nuaa.edu.cn" target="_blank">cs.nuaa.edu.cn</a>
            </div>
          </div>
        </div>
      </div>
    </footer>

    <!-- Load JS here for greater good =============================-->
    <script src="demo/js/jquery_002.js"></script>
    <script src="demo/js/jquery-ui-1.js"></script>
    <script src="demo/js/jquery.js"></script>
    <script src="demo/js/bootstrap-tooltip.js"></script>
    <script src="demo/js/jquery_003.js"></script>
    <script src="demo/js/jquery_004.js"></script>
    <script src="demo/js/application.js"></script>
    <script src="demo/js/projects.js"></script>

  