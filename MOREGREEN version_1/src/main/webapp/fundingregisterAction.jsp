<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.moregreen.vo.FundingVo" %>
<%@ page import="com.moregreen.controller.InsertController" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="funding" class="com.moregreen.vo.FundingVo" />
<jsp:useBean id="ic" class="com.moregreen.controller.InsertController" />

<fmt:requestEncoding value="utf-8" />

<%
   String saveDirectory = application.getRealPath(".") + "/filestorage";
   int maxSize = 10 * 1024 * 1024;   //10MB
   MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, "utf-8", new DefaultFileRenamePolicy());
   
   String f_title = mr.getParameter("f_title");
/*
   f_title = f_title.replace("<", "&lt;");
   f_title = f_title.replace(">","&gt;");
   f_title = f_title.replace("'", "''");
*/
   funding.setF_title(f_title);
   
   String f_comments = mr.getParameter("f_comments");
   f_title = f_title.replace("<", "&lt;");
   f_title = f_title.replace(">","&gt;");
   f_title = f_title.replace("'", "''");
   funding.setF_comments(f_comments);
  
   String f_contents = mr.getParameter("f_contents");
/* 
   f_contents = f_contents.replace("\r\n", "<br/>");
   f_contents = f_contents.replace("<", "&lt;");
   f_contents = f_contents.replace(">","&gt;");
   f_contents = f_contents.replace("'", "''");
*/
   funding.setF_contents(f_contents);
   
   funding.setF_image(mr.getFilesystemName("f_image"));
   
   funding.setF_target(Integer.parseInt(mr.getParameter("f_target")));
   funding.setF_price(Integer.parseInt(mr.getParameter("f_price")));
   
%>

<c:set var="result" value="${ic.insert(funding)}" />
<c:if test="${result eq 1}">
   <script>
      location.href = "/funding.jsp";
   </script>
</c:if>
<c:if test="${result eq 0}">
   <script>
      alert("오류 발생");
      history.back();
   </script>
</c:if>

