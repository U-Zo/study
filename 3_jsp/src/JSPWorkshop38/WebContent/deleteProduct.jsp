<%@page import="com.dto.EmpDTO"%>
<%@page import="com.service.EmpService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String prodId = request.getParameter("prodId");

     EmpService service = new EmpService();
     int n = service.delete(prodId);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
  String mesg = prodId + " 상품삭제 성공";
  if(n!=1){
	  mesg = prodId + " 상품삭제 실패";
  }
  out.print(mesg);	  
 %>
 <br>
 <a href="listProduct.jsp">목록보기</a>
</body>
</html>