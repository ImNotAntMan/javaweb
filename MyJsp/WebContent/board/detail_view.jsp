<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 보기</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String b_num = request.getParameter("b_num");
	out.print(b_num);
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
		query = "select * from tblboard where b_num=" + b_num + " order by b_date desc";
		psmt = conn.prepareStatement(query);	// 쿼리 객체 생성
//		psmt.setInt(1, Integer.parseInt(b_num));
		rs = psmt.executeQuery();	// 쿼리 실행해서 결과를 rs에 반환받음
		rs.next();
		String b_name = rs.getString("b_name");
		String b_subject = rs.getString("b_subject");
		String b_contents = rs.getString("b_contents");
/* 		b_contents = b_contents.replace("\n", "<br>");
 */		String b_date = rs.getString("b_date");
%>
		<table border=1>
			<tr>
				<td width=150 align="center">번호</td><td align="center"><%=b_num %></td>
			</tr>
			<tr>
				<td width=150 align="center">이름</td><td align="center"><%=b_name %></td>
			</tr>
			<tr>
				<td width=150 align="center">제목</td><td align="center"><%=b_subject %></td>
			</tr>
			<tr>
				<td width=150 align="center">내용</td><td width=444><%=b_contents %></td>
			</tr>
			<tr>
				<td width=150 align="center">등록일</td><td align="center"><%=b_date %></td>
			</tr>
			<tr>
				<td width=150 align="center"></td>
				<td width=150 align="center"><a href="modifyform.jsp?b_num=<%=b_num%>">수정</a>
				<a href="delete.jsp?b_num=<%=b_num%>">삭제</a>
				<a href="list.jsp">리스트</a>
				</td>
			</tr>
		</table>
		 <br>
		<br>
		 <br>
		<br>
		<br>
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