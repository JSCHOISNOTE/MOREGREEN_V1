<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moregreen.controller.SelectController" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="sc" class="com.moregreen.controller.SelectController" />
<c:set var="m_id" value="${param.m_id}" />
<c:set var="m_pwd" value="${param.m_pwd}" />
<c:set var="result" value="${sc.login(m_id, m_pwd)}" />

<c:if test="${result eq -1}">
	<script>
		alert("아이디를 잘못 입력하셨습니다.\n확인 후 다시 로그인 해주세요.");
		history.back();
	</script>
</c:if>
<c:if test="${result eq 0}">
	<script>
		alert("비밀번호가 일치하지 않습니다.\n확인 후 다시 로그인 해주세요.");
		history.back();
	</script>
</c:if>
<%-- 로그인 성공하면 --%>
<c:if test="${result eq 1}">
	<c:set var="m_id" value="${m_id}" scope="session" />
	<c:set var="m_name" value="${sc.read(m_id).m_name}" scope="session" />
	<c:set var="m_email" value="${sc.read(m_id).m_email}" scope="session" />
	<c:redirect url="/index.jsp"/>
</c:if>
