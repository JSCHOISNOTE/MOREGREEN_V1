<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.moregreen.vo.FundingVo, java.util.ArrayList" %>
<%@ page import="java.sql.DriverManager, java.sql.Connection" %>
<%@ page import="java.sql.Statement, java.sql.ResultSet" %>
<%@ page import="com.moregreen.model.FundingDao, com.moregreen.model.FundingDaoImpl" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>More Green 친환경 크라우드 펀딩</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/moregreen.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<script src="/js/jquery-3.6.0.js"></script>
<script>
        $(document).ready(function(){
			$('#btnRegister').click(function(){
				location.href = "register.html";
			});
			$('#btnLogin').click(function(){
				location.href = "login.jsp";
			});
			$('#btnLogout').click(function(){
				if(confirm('정말 로그아웃 하시겠습니까?')){
					location.href = "logout.jsp";
				}else{
					history.go(0);   //현재 페이지 그대로
				}
			});
        });  
    </script>
</head>

<body class="d-flex flex-column min-vh-100">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="index.html"><img
				src="assets/smoregreen1.png" width="150"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="funding.jsp">펀&nbsp;&nbsp;&nbsp;&nbsp;딩</a></li>
					<li>&nbsp;&nbsp;&nbsp;</li>
					<li class="nav-item"><a class="nav-link" href="notice.jsp">공&nbsp;지&nbsp;사&nbsp;항</a></li>
				</ul>
				<form class="d-flex">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<c:out value="${sessionScope.m_id}" default="회 원 " /></a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<c:if test="${empty sessionScope.m_id}">
									<a class="dropdown-item" href="#" id="btnRegister">회 원 가 입</a>
									<li><a class="dropdown-item" href="#" id="btnLogin">로 그 인</a></li>
								</c:if>
								<c:if test="${not empty sessionScope.m_id}">
									<li><a class="dropdown-item" href="#" id="btnLogout">로 그 아 웃</a></li>
								</c:if>
							</ul>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</nav>
<%
		// 1 .Driver Loading
		Class.forName("com.mysql.cj.jdbc.Driver");

		// 2. MySQL Connection
		final String URL = "jdbc:mysql://192.168.1.34:3306/moregreen";
		final String USER = "moregreen";
		final String PASSWD = "P@$$W0rd";
		Connection conn = DriverManager.getConnection(URL, USER, PASSWD);

		// 3. Statement 객체 생성
		Statement stmt = conn.createStatement();

		// 4. SQL 문 실행하기,
		String sql = "SELECT f_number, f_title, f_comments, f_image, f_target, f_price FROM funding ORDER BY f_number DESC";
		ResultSet rs = stmt.executeQuery(sql);
%>
	<!-- Header-->
   <header class="bg-light1 py-5 mt-auto">
      <div class="container px-4 px-lg-5 my-5">
         <div class="mybtns">
	      <c:if test="${not empty sessionScope.m_id}">
              <a href="fundingregister.jsp" class="btn btn-dark pull-right">등록하기</a> 
              </c:if>
            <br />
         </div>
         <div class="mycards">
               <div class="row row-cols-1 row-cols-md-4 g-4">
				<% while(rs.next()){ %>
				<form method="get" action="fundinginfo.jsp">
					<div class="col">
						<div class="card h-100">
							<img src="/filestorage/<%=rs.getString("f_image") %>" width="280" height="280" class="card-img-top" alt="...">
							<div class="card-body">
								<h3 class="card-title"><a style="text-decoration-line: none; color: black"
										href="fundinginfo.jsp?f_number=<%=rs.getString("f_number")%>">
										<%=rs.getString("f_title")%></a></h3>
								<p class="card-text"><%=rs.getString("f_comments")%></p>
								<p class="fundingrate">펀딩률(준비중)</p>
							</div>
						</div>
					</div>
				</form>
				<%
				}
				%>
               </div>
         </div>
         
       </div>
      
<%	
	// 6. DB Close
	if(rs != null) rs.close();
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();
%>

         

   </header>
	<!-- Footer-->
	<footer class="py-3 bg-dark mt-auto">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; MOREGREEN
				CROWD FUNDING 2022</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
