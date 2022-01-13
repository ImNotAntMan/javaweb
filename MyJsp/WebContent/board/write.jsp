<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 쓰기</title>
</head>
<body>
	<h3>글 입력</h3><br>
	<form method="post" action="./write_end.jsp">
		제목 : <input type="text" name="b_subject" value="홍범도 토착왜구 토벌하다!"><br>
		작성자 : <input type="text" name="b_name" value="홍범도"><br>
		내용 : <textarea cols="44" rows="10" name="b_contents"></textarea><br>
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>