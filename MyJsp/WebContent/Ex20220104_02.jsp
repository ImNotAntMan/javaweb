<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 구구단 출력
	out.print("<table border=1>");
	for(int i = 1; i <= 9; i++) {
		out.print("<tr>");
		for(int j = 2; j <= 9; j++) {
			out.print("<td>");
			out.print(j + "x" + i + " = " + i*j + " ");
			out.print("</td>");
		}
		out.print("</tr>");
	}
	out.print("</table>");
 %>	
 	<!-- 구구단 출력 -->
	<table border="1">
		<% for(int i = 1; i <= 9; i++) { %>
		<tr>
		<% for(int j = 2; j <= 12; j++) { %>
		<td>
		<%=j%>x<%=i%>=<%=i*j%>
		</td>
		<% } } %>
		</tr>
	</table>
<%
	out.print("웹 프로그래밍<br>");
%>

<font size='36'><%= "웹 프로그래밍 여기에 쓰세요" %><br></font>
 </body>
</html>