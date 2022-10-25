<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.moregreen.vo.NoticeVo" %>
<%@ page import="com.moregreen.controller.InsertController" %>
<%@ page import="java.util.Calendar" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="notice" class="com.moregreen.vo.NoticeVo" />
<jsp:useBean id="ic" class="com.moregreen.controller.InsertController" />

<fmt:requestEncoding value="utf-8" /> <!-- 한글처리 -->

<%
	String saveDirectory = application.getRealPath(".") + "/filestorage";
	int maxSize = 10 * 1024 * 1024; // 10MB
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, "utf-8", new DefaultFileRenamePolicy()); // JSP에서는 request가 내장 객체임
	
	String n_title = mr.getParameter("n_title");
/*
	n_title = n_title.replace("<", "&lt;"); // user가 태그를 입력하는 경우 변환 처리
	n_title = n_title.replace(">", "&gt;"); // user가 태그를 입력하는 경우 변환 처리
	n_title = n_title.replace("'", "''"); // user가 태그를 입력하는 경우 변환 처리
*/
	notice.setN_title(n_title); // setproperty로 해도 된다.
	
	String n_contents = mr.getParameter("n_contents");	
/*
        n_contents = n_contents.replace("\r\n", "<br>"); // Windows는 엔터가 \r\n이다.
	n_contents = n_contents.replace("<", "&lt;"); // user가 태그를 입력하는 경우 변환 처리
	n_contents = n_contents.replace(">", "&gt;"); // user가 태그를 입력하는 경우 변환 처리
	n_contents = n_contents.replace("'", "''"); // user가 태그를 입력하는 경우 변환 처리
*/
	notice.setN_contents(n_contents);
	
	notice.setN_image(mr.getFilesystemName("n_image"));
	
	Calendar now = Calendar.getInstance();
	String n_date = String.valueOf(now.get(Calendar.YEAR));
	n_date += "-" + String.valueOf(now.get(Calendar.MONTH) + 1);
	n_date += "-" + String.valueOf(now.get(Calendar.DAY_OF_MONTH));
	notice.setN_date(n_date);
%>

	<c:set var="result" value="${ic.insert(notice) }" />
	<c:if test="${result eq 1}">
		<script>
			location.href = "/notice.jsp";
		</script>
	</c:if>
	<c:if test="${result eq 0 }">
		<script>
			alert("오류 발생");
			history.back();
		</script>
	</c:if>
	
	
	//out.println("저장된 파일이름 = " + mr.getFilesystemName("file"));
	//out.println("원본 파일이름 = " + mr.getOriginalFileName("file"));


