<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>로그인 폼 화면입니다.</h1>
    <!-- include -->
    <jsp:include page="common/top.jsp" flush="true"></jsp:include>
    <jsp:include page="common/menu.jsp" flush="true"></jsp:include>
    <hr>
    <!-- include -->
    <jsp:include page="member/loginForm.jsp" flush="true"></jsp:include>
</body>
</html>