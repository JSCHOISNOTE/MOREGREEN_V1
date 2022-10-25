<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                $(document).ready(function () {
                	
                	 $('#btnFunding').click(function () {
                         location.href = "register.html";
                     });
                	
                    $('#btnRegister').click(function () {
                        location.href = "register.html";
                    });
                    $('#btnLogin').click(function () {
                        location.href = "login.jsp";
                    });
                    $('#btnLogout').click(function () {
                        if (confirm('정말 로그아웃 하시겠습니까?')) {
                            location.href = "logout.jsp";
                        } else {
                            history.go(0); //현재 페이지 그대로
                        }
                    });
                });
            </script>
</head>




<body class="d-flex flex-column min-vh-100">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">
			<img src="assets/smoregreen1.png" width="150"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="/funding.jsp">펀&nbsp;&nbsp;&nbsp;&nbsp;딩</a></li>
					<li>&nbsp;&nbsp;&nbsp;</li>
					<li class="nav-item"><a class="nav-link" href="/notice.jsp">공&nbsp;지&nbsp;사&nbsp;항</a></li>

				</ul>



				<form class="d-flex">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<c:out value="${sessionScope.m_id}" default="회 원 " />
						</a>

							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">

								<c:if test="${empty sessionScope.m_id}">
									<a class="dropdown-item" href="#" id="btnRegister">회 원 가 입</a>



									<li><a class="dropdown-item" href="#" id="btnLogin">로
											그 인</a></li>
								</c:if>
								<c:if test="${not empty sessionScope.m_id}">
									<li><a class="dropdown-item" href="#" id="btnLogout">로
											그 아 웃</a></li>
								</c:if>
							</ul></li>
					</ul>
				</form>
			</div>
		</div>
	</nav>
	<!-- Header-->
	
	<header class="bg-light1 py-5 mt-auto">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-dark">
				
				<img src="assets/index1.jpg" width="1000" height="500">
				
				
				
				
			</div>
		</div>
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
	<script src="/js/scripts.js"></script>
</body>

</html>
