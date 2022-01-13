<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JDBC Test</h1>
<%
	Connection conn = null;	// 접속 객체
	PreparedStatement psmt = null;	// 쿼리 객체
	ResultSet rs = null;	// 쿼리 결과 객체
	String query = "";	// sql 문법용 변수
	try {
		Class.forName("com.mysql.jdbc.Driver"); // JDBC 드라이버 로드
		String url = "jdbc:mysql://localhost:3306/mysql";	// 접속 url
		String user = "root";
		String passwd = "";
		Connection conn = DriverManager.getConnection(url, user, passwd);
		out.print("드라이버 로드 성공<br>");
		out.print(conn + "<br>");
		query = "select * from tblboard";
		psmt = conn.prepareStatement(query);	// 쿼리 객체 생성
		rs = psmt.executeQuery();	// 쿼리 실행해서 결과를 rs에 반환받음
		while(rs.next()) {
			int b_num = rs.getInt("b_num");
			String b_name = rs.getString("b_name");
			String b_subject = rs.getString("b_subject");
			String b_contents = rs.getString("b_contents");
			Date b_date = rs.getDate("b_date");
			out.print(b_num + ": " + b_name + "<br>");
			out.print(b_subject + "<br>");
			out.print(b_contents + "<br>");
			out.print(b_date + "<br>");
		}
		out.print("<br>____________________________");
	} catch(Exception e) {
		out.print(e);	
	} finally {
		try() {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch(Exception ex) {
			
		}
	}
%>
</body>
</html>