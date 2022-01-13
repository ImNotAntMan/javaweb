<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="Ex20220104_04.jsp">
		성명 : <input type="text" name="username" value="홍길동" required><br>
		나이 : <input type="text" name="age" value="57"><br>
		지역 : <select name="area" value="충북">
			<option value="충북">충북</option>
			<option value="경기">경기</option>
			<option value="서울">서울</option>
		</select><br>
		<!-- 2000년부터 2030년까지 syear 변수로 전송할 수 있는 select tag 구형 -->
		년도 : <select name="syear" value="2030">
		<% for(int i = 2000; i <= 2030; i++) { %>
		<option value="<%=i%>"><%=i%></option>
		<% } %>
		</select><br>
		취미 : <input type="radio" name="hobby" value="등산" required>등산&nbsp;&nbsp;&nbsp;
				<input type="radio" name="hobby" value="게임" required>게임&nbsp;&nbsp;&nbsp;
				<input type="radio" name="hobby" value="게임2" required>게임2&nbsp;&nbsp;&nbsp;
				<input type="radio" name="hobby" value="게임3" required>게임3&nbsp;&nbsp;&nbsp;
				<input type="radio" name="hobby" value="잠자기" required>잠자기<br>
		<input type="submit" value="submit">
	</form>
</body>
</html>