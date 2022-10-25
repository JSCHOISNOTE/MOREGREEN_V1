<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>More Green 친환경 크라우드 펀딩</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/moregreen.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/css/styles.css" rel="stylesheet" />
<script src="/js/jquery-3.6.0.js"></script>
<script>
	$("input[type='button']").bind("click", function() {
		if (!$("#f_title").val()) {
			alert("제목을 입력해 주세요!!");
			$("#title").focus();
			return false;
		}
		$('form').submit();
	});

	$(document).ready(function() {
		$('#btnRegister').click(function() {
			location.href = "register.html";
		});
		$('#btnLogin').click(function() {
			location.href = "login.jsp";
		});
		$('#btnLogout').click(function() {
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
            <a class="navbar-brand" href="index.html"><img src="assets/smoregreen1.png" width="150"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" href="funding.jsp">펀&nbsp;&nbsp;&nbsp;&nbsp;딩</a></li>
                    <li>&nbsp;&nbsp;&nbsp;</li>
                    <li class="nav-item"><a class="nav-link" aria-current="page" href="/notice.jsp">공&nbsp;지&nbsp;사&nbsp;항</a></li>
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
    <!-- Header-->
    <header class="bg-light1 py-5 mt-auto">
        <div class="container px-4 px-lg-5 my-5">
		<div class="row">
			<form method="post" action="/fundingregisterAction.jsp" enctype="multipart/form-data">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">펀딩 프로젝트 등록</th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="글 제목" name="f_title" maxlength="50"></td>
							</tr>
							<tr>
								<td><input class="form-control" placeholder="한 줄 소개"
										name="f_comments" maxlength="40"></input></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="글 내용"
										name="f_contents" maxlength="2048" style="height: 350px;"></textarea></td>
							</tr>
							<tr>
								<td><input type="file" class="form-control" value="첨부파일" name="f_image"></td>
							</tr>
							<tr>
								<td><input type="number" class="form-control"
									placeholder="목표 금액" name="f_target" maxlength="50"></td>
							</tr>
							<tr>
								<td><input type="number" class="form-control"
									placeholder="펀딩 금액" name="f_price" maxlength="50"></td>
							</tr>

						</tbody>
				</table>
				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" class="btn btn-dark pull-right" value="글등록">
			</form>
		</div>
        </div>
    </header>
    
    <!-- Footer-->
    <footer class="py-3 bg-dark mt-auto">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; MOREGREEN CROWD FUNDING 2022</p>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>

</html>


