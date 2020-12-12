<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<c:if test="${!empty success}">
    <script>
      alert("${success}");
    </script>
</c:if>
<h1>메인화면</h1>
<jsp:include page="common/top.jsp" flush="true" />
<br>
<jsp:include page="common/menu.jsp" flush="true" />
<br>
</body>
</html>
