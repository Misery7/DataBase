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

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>

    <link href="../css/site.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/build.css">    
    <link rel="stylesheet" href="../dist/css/bootstrapValidator.css"/>
    <script src="../dist/js/bootstrapValidator.js"></script>
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
      <form id="defaultForm" method="post" action="modifyupd.jsp">
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
    <script src="../js/toc.js"></script>
    <script src="../js/site.js"></script>

<script>
$(document).ready(function() {

    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            newgender: {
                validators: {
                    notEmpty: {
                        message: 'The gender is required and cannot be empty'
                    }
                }
            },
            newclassno: {
                validators: {
                    notEmpty: {
                        message: 'The class number is required and cannot be empty'
                    },
                    egexp: {
                        regexp: /^[0-9]{7}$/,
                        message: 'The class number must contain only number and be 7 characters long'
                    },
                    stringLength: {
                        min: 7,
                        max: 7,
                        message: 'The class number must be 9 characters long'
                    }
                }

            },
            newage: {
                validators: {
                    lessThan: {
                        value: 100,
                        inclusive: true,
                        message: 'The ages has to be less than 100'
                    },
                    greaterThan: {
                        value: 10,
                        inclusive: false,
                        message: 'The ages has to be greater than or equals to 10'
                    }
                }
            },
            newtelephone: {
                validators: {
                    notEmpty: {
                        message: 'The telephone is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^1[3|4|5|7|8][0-9]{9}$/,
                        message: 'The telephone number must begin with 13/14/15/17/18 and contain only number'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: 'The telephone must be 11 characters long'
                    }
                }
            },
            newemailadd: {
                validators: {
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            }
        }
    });

});
</script>