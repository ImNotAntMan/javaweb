<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 자바 문법 적용 영역
	out.print("안녕하세요<br>");
	out.print("웹프로그램입니다." + "<br>");
	out.print("청주입니다.");
	out.print("&lt;br&gt");
	out.print("<h1>JSP 프로그램</h1>");
	int i;
	int total = 0;
	for(i = 1; i <= 10; i++) {
		total += i;
		out.print("1 부터" + i + "까지의 합은" +total + "입니다.<br>");
	}
%>
</body>
</html>