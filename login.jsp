<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_page</title>
</head>
<body>
<h1>소프트웨어 설계 2팀</h1>
<h2>김민수, 김소빈, 김요엘, 손명빈, 이재성, 여찬우</h2>
<hr>
<form action = "loginSession.jsp" method="post">
	아이디: <input type = "text" name = "id"><br>
	패스워드: <input type = "password" name = "passwd"><br>
	<input type = "submit" value = "로그인">
</form>
</body>
</html>
