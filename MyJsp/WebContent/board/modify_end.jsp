<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String b_num = request.getParameter("b_num");
	String b_subject = request.getParameter("b_subject");
	String b_contents = request.getParameter("b_contents");
	out.print(b_subject + " " + b_contents + " " + b_num);
	Connection conn = null;	// 접속 객체
	PreparedStatement psmt = null;	// 쿼리 객체
	String query = "";	// sql 문법용 변수
	try {
		Class.forName("com.mysql.jdbc.Driver"); // JDBC 드라이버 로드
		String url = "jdbc:mysql://localhost:3306/mysql";	// 접속 url
		String user = "root";
		String passwd = "";
		conn = DriverManager.getConnection(url, user, passwd);
		out.print("드라이버 로드 성공<br>");
		out.print(conn + "<br>");
		query = "update tblboard set b_subject=?, b_contents=? where b_num=?";
		psmt = conn.prepareStatement(query);	// 쿼리 객체 생성
		psmt.setString(1, b_subject);
		psmt.setString(2, b_contents);
		psmt.setInt(3, Integer.parseInt(b_num));
		psmt.executeUpdate();	// insert, update, delete 의 경우 사용
%>
		<script>
			alert("수정되었습니다.");
			location.href = "list.jsp";
		</script>
<%
		out.print(query);
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