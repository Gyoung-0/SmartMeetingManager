<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session != null) {
        session.invalidate(); // 현재 세션 종료
    }

    response.sendRedirect("index.jsp");
%>