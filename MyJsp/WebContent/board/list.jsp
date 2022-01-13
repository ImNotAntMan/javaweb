<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
</head>
<body>
	<h1>게시판 리스트</h1><br>
	<a href="write.jsp">글 쓰기</a><br>
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
		conn = DriverManager.getConnection(url, user, passwd);
		query = "select count(*) as total_record from tblboard";
		psmt = conn.prepareStatement(query);	// 쿼리 객체 생성
		rs =  psmt.executeQuery();
		rs.next();
		int total_record = rs.getInt("total_record");
		out.print(total_record + "개입니다.<br>");
		rs.close();
		psmt.close();
		query = "select * from tblboard order by b_date desc";
		psmt = conn.prepareStatement(query);	// 쿼리 객체 생성
		rs = psmt.executeQuery();	// 쿼리 실행해서 결과를 rs에 반환받음
%>
		<table border=1>		
			<tr>
				<th>번호</th><th>제목</th><th>작성일</th><th>작성자</th>
			</tr>
<%
		while(rs.next()) {
			int b_num = rs.getInt("b_num");
			String b_name = rs.getString("b_name");
			String b_subject = rs.getString("b_subject");
			String b_contents = rs.getString("b_contents");
			String b_date = rs.getString("b_date");
%>
			<tr>
				<td align="center"><%=b_num%></td>
				<td><a href="./detail_view.jsp?b_num=<%=b_num %>"><%=b_subject %></a></td>
				<td align="center"><%=b_date %></td>
				<td align="center"><%=b_name %></td>
			</tr>
<%
		}
%>
		</table>
<%
	} catch(Exception e) {
		out.print(e);	
	} finally {
		try {
			if(rs != null) 
				rs.close();
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