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
	
	request.setCharacterEncoding("utf-8");
	String username = request.getParameter("username");	// 전송된 문자열 저장
	String age = request.getParameter("age");
	String area = request.getParameter("area");
	String year = request.getParameter("syear");
	String hobby = request.getParameter("hobby");
	
	int iage;
	boolean flag = true;	// 나이가 정상적으로 넘어온다고 가정
	if(username.trim().length() < 2) {
		flag = false;
	}
	try {
		iage = Integer.parseInt(age);	// 정수형태의 정수로 형변환
		out.print(iage);
	} catch(Exception e) { // 예외가 발행했을 경우 처리할 내용
		//age = "25";
		flag = false;	// 예외 발생
	} 
	
	if(flag == false) {
%>
		<script>alert('나이가 잘못되었습니다.');history.back();</script>		
<%
	} else {
		out.print("성명: " + username + "<br>");
		out.print("나이: " + age + "<br>");
		out.print("지역: " + area + "<br>");
		out.print("year: " + year + "<br>");
		out.print("취미: " + hobby + "<br>");
	}

%>	
	
</body>
</html>