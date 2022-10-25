<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moregreen.controller.SelectController" %>
<%@ page import="java.util.ArrayList, com.moregreen.vo.NoticeVo" %>
<%@ page import="java.sql.DriverManager, java.sql.Connection" %>
<%@ page import="java.sql.Statement, java.sql.ResultSet" %>
<%@ page import="com.moregreen.model.NoticeDaoImpl" %>
<%@ page import=" java.sql.PreparedStatement"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>More Green 친환경 크라우드 펀딩</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/moregreen.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/css/styles.css" rel="stylesheet" />

</head>
<body class="d-flex flex-column min-vh-100">
<%
        String m_id = null;
        if(session.getAttribute("m_id") != null) {
            m_id = (String) session.getAttribute("m_id"); //로그인한 사람들은 해당아이디가 userID에 저장
        }
        int n_number = 0;
        if (request.getParameter("n_number") != null) {
            n_number = Integer.parseInt(request.getParameter("n_number"));//게시글 번호 받아오기
        }
        if (n_number == 0) {//번호가 반드시 존재하는지 확인
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.')");
            script.println("location.href = '/notice.jsp'"); // 다시 게시글 페이지로 이동
            script.println("</script>");
        }
        
		// System.out.println(n_number);
        NoticeVo nv = new NoticeDaoImpl().selectRecord(n_number); 
%>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="/index.html"><img src="/assets/smoregreen1.png" width="150"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link" href="/funding.jsp">펀&nbsp;&nbsp;&nbsp;&nbsp;딩</a></li>
                    <li>&nbsp;&nbsp;&nbsp;</li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/notice.jsp">공&nbsp;지&nbsp;사&nbsp;항</a></li>
                </ul>
                
                <form class="d-flex">
               <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                     role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <c:out value="${sessionScope.m_id}" default="회 원 " /></a>
                     <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:if test="${empty sessionScope.m_id}">
                           <a class="dropdown-item" href="/register.html" id="btnRegister">회 원 가 입</a>
                           <li><a class="dropdown-item" href="/login.jsp" id="btnLogin">로 그 인</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope.m_id}">
                           <li><a class="dropdown-item" href="/index.jsp" id="btnLogout">로 그 아 웃</a></li>
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
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
               <thead>
                  <tr>
                     <th colspan="3" style="background-color: #eeeeee; text-align: center;"><%=nv.getN_title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></th>
                  </tr>
               </thead>
               <tbody>
               		<tr>
                        <td style="width: 20%;">글 번호</td>
                        <td colspan="2">
                          	<%=nv.getN_number()%>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%;">작성일</td>
                        <td colspan="2">
                          	<%=nv.getN_date() %>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%;">조회수</td>
                        <td colspan="2">
                          	<%=nv.getN_count()+1%>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%;">글 내용</td>
                        <td colspan="2">
                          	<%=nv.getN_contents().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                          	<img src="/filestorage/<%=nv.getN_image() %>">
                        </td>
                    </tr>
               </tbody>
            </table>
           <div class="mybtns">
				<a href="/notice.jsp" class="btn btn-dark pull-right">목록</a>
				<br />
			</div>
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
    <script src="/js/scripts.js"></script>
  
</body>

</html>




	<%-- <td><%=rs.getString("n_number") %></td>
							<td><%=rs.getString("n_title") %></td>
							<td><%=rs.getString("n_contents") %></td>
							<td><%=rs.getString("n_date") %></td>
							<td><%=rs.getString("n_count") %></td>
 --%>
