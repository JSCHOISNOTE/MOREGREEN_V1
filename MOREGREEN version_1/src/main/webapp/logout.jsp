<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<c:remove var="m_id" scope="session" />
<c:remove var="m_name" scope="session" />
<c:remove var="m_email" scope="session" />
<c:redirect url="/" />