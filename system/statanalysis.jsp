<!DOCTYPE html>
    <html lang="zh-CN"><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <useUnicode=true&characterEncoding=utf-8>  
    <meta charset="utf-8">
    <title>统计分析</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    
    <!-- Site CSS -->
    <link rel="stylesheet" href="https://os.alipayobjects.com/s/prod/g2/static/doc-b57e62881a0344ecde9e68c4ce312143.css"/>
    <!--如果不需要jquery ajax 则可以不引入-->
    <script src="https://a.alipayobjects.com/jquery/jquery/1.11.1/jquery.js"></script>
    <!-- 引入 G2 脚本 -->
    <script src="https://a.alipayobjects.com/g/datavis/g2/2.2.0/g2.js"></script>
    <link href="test/bootstrap.css" rel="stylesheet">
    <link href="test/font-awesome.css" rel="stylesheet">
    <link href="test/site.css" rel="stylesheet">
    <script>
      var print1=new Array();
      var print2=new Array();
    </script>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
    <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

    <style>
    .job-hot {
    	position: absolute;
    	color: #d9534f;
    	right: 0;
    	top: 15px;
    }
    </style>
    
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
          <a class="navbar-brand hidden-sm" href="#">Spider For Ctrip</a>
        </div>
        <div class="navbar-collapse collapse" role="navigation">
          <ul class="nav navbar-nav">
            <li><a href="#" target="_blank">统计分析</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right hidden-sm">
            <li><a href="../Manage.html">返回主菜单</a></li>
          </ul>
        </div>
      </div>
    </div>

    

    <div class="jumbotron masthead">
      <div class="container">
        <h1>Spider For Ctrip</h1>
        <h2>统计分析</h2>
      </div>
    </div>

    <div class="container projects">

      <div class="projects-header page-header">
        <h2>分析结果如下列图表所示</h2>
      </div>
      <div id="c1" class="container"></div>
      <div id="c2" class="container"></div>
      <div id="c3" class="container"></div>
    </div>

     <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://139.224.133.30:3306/ctrip?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="1502"/>
      <c:set var="pricelow" value="500"/>
      <sql:query dataSource="${snapshot}" var="result">
        SELECT * from hotel
      </sql:query>

    <!-- G2 code start -->
      <script>
        var datasource = new Array();

        var data = [
          {flight_num: '9C8903', prize: 470},
          {flight_num: 'KN2316', prize: 268},
          {flight_num: 'NS3220', prize: 661},
          {flight_num: 'MF7006', prize: 729},
          {flight_num: '9C8765', prize: 1100},
          {flight_num: 'KN2366', prize: 447},
          {flight_num: 'NS3218', prize: 360},
          {flight_num: 'MF7018', prize: 505},
          {flight_num: 'KN2318', prize: 387},
          {flight_num: '9C8903', prize: 410},
          {flight_num: 'KN2316', prize: 258},
          {flight_num: 'NS3220', prize: 598},
          {flight_num: 'MF7006', prize: 603},
          {flight_num: '9C8765', prize: 530},
          {flight_num: 'KN2366', prize: 377},
          {flight_num: 'KN2318', prize: 318},
          {flight_num: '9C8903', prize: 410},
          {flight_num: 'KN2316', prize: 258},
          {flight_num: 'NS3220', prize: 475},
          {flight_num: 'MF7006', prize: 507}
        ];
        var chart = new G2.Chart({
          id: 'c1',
          width: 1000,
          height: 500
        });
        chart.source(data, {
          flight_num: {
            alias: '航班号',
          },
          prize: {
            alias: '最低价格(￥)',
          }
        });
        chart.interval().position('flight_num*prize').color('flight_num');
        chart.render();
      </script>
    <script>
      var data = [
        {date: 1,prize:489},
        {date: 2,prize:760},
        {date: 3,prize:630},
        {date: 4,prize:570},
        {date: 5,prize:1240},
        {date: 6,prize:700},
        {date: 7,prize:680},
        {date: 8,prize:740},
        {date: 9,prize:1180},
        {date: 10,prize:1240},
        {date: 11,prize:600},
        {date: 12,prize:1240},
        {date: 13,prize:1120},
        {date: 14,prize:760},
        {date: 15,prize:700},
        {date: 16,prize:1120},
        {date: 17,prize:760},
        {date: 18,prize:760},
        {date: 19,prize:700},
        {date: 20,prize:761}
      ];
      var chart = new G2.Chart({
        id: 'c2',
        width: 1000,
        height: 500
      });
      chart.source(data, {
        date: {
          alias: '日期',
        },
        prize: {
          alias: '最低价格(￥)'
        }
      });
      chart.line().position('date*prize').size(2);
      chart.render();
    </script>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://139.224.133.30:3306/ctrip?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="1502"/>
      <c:set var="pricelow" value="500"/>
      <sql:query dataSource="${snapshot}" var="result">
      SELECT * from flight WHERE price>= 3000
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
         <script>
          tmp=new Object();
          var fn="${row.Flight_Num}";
          var p="${row.Price}";
          tmp.flight_num=fn;
          var pc=Number(p);
          tmp.price=pc;
          print1.push(tmp);
         </script>
      </tr>
      </c:forEach>
      </table>
    </div>
    <script>
      var chart = new G2.Chart({
        id: 'c3',
        width: 1000,
        height: 500
      });
      chart.source(print1, {
        flight_num: {
          alias: '日期',
        },
        price: {
          alias: '最低价格(￥)'
        }
      });
      chart.interval().position('flight_num*price').color('flight_num');
      chart.render();
    </script>
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
    <script src="test/jquery_003.js"></script>
    <script src="test/bootstrap.js"></script>
    <script src="test/jquery_004.js"></script>
    <script src="test/jquery_002.js"></script>
    <script src="test/toc.js"></script>
    <script src="test/jquery.js"></script>
    <script src="test/site.js"></script>

<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"><i class="fa fa-angle-up"></i></a></body></html>