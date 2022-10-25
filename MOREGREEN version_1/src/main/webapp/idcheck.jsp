<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.moregreen.controller.SelectController" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="m_id" value="${param.m_id}"/>
<jsp:useBean id="sc" class="com.moregreen.controller.SelectController" />
<c:set var="enabled" value="${sc.idcheck(m_id)}" />
${enabled}