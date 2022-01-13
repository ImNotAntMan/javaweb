<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String b_num = request.getParameter("b_num");
	Connection conn = null;	// 접속 객체
	PreparedStatement psmt = null;	// 쿼리 객체
	String query = "";	// sql 문법용 변수
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.jdbc.Driver"); // JDBC 드라이버 로드
		String url = "jdbc:mysql://localhost:3306/mysql";	// 접속 url
		String user = "root";
		String passwd = "";
		conn = DriverManager.getConnection(url, user, passwd);
		query = "select * from tblboard where b_num=" + b_num ;
		psmt = conn.prepareStatement(query);	// 쿼리 객체 생성
//		psmt.setInt(1, Integer.parseInt(b_num));
		rs = psmt.executeQuery();	// 쿼리 실행해서 결과를 rs에 반환받음
		rs.next();
		String b_name = rs.getString("b_name");
		String b_subject = rs.getString("b_subject");
		String b_contents = rs.getString("b_contents");
		b_contents = b_contents.replace("\n", "<br>");
		String b_date = rs.getString("b_date");
%>
	<h3>글 수정</h3><br>
	<form method="post" action="./modify_end.jsp">
		<input type="hidden" name="b_num" value="<%=b_num %>" />
		제목 : <input type="text" name="b_subject" value="<%=b_subject%>"><br>
		작성자 : <%=b_name%><br>
		내용 : <textarea cols="44" rows="10" name="b_contents"><%=b_contents%></textarea><br>
		<input type="submit" value="수정">
	</form>
<%
	} catch(Exception e) {
		out.print(e);	
	} finally {
		try {
			if(psmt != null) 
				psmt.close();
			if(conn != null) 
				conn.close();
		} catch(Exception ex) {
			out.print(ex);
		}
	}
%>
</body>
</html>