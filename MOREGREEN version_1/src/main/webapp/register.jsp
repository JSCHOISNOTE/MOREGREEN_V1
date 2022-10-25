<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.moregreen.controller.InsertController" %>
<%@ page import="com.moregreen.vo.MemberVo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8" />
<jsp:useBean id="ic" class="com.moregreen.controller.InsertController"/>
<jsp:useBean id="mem" class="com.moregreen.vo.MemberVo"/>
<jsp:setProperty name="mem" property="*" />

<c:set var="result" value ="${ic.insert(mem)}" />
<c:if test="${result eq 1}">
	<script>
		location.href = "index.jsp";
	</script>
</c:if>
<c:if test="${result eq 0}">
	<script>
		alert("알 수 없는 오류가 발생하여 회원가입에 실패했습니다.\n다시 가입처리 해 주세요.");
		history.back();
	</script>
</c:if>