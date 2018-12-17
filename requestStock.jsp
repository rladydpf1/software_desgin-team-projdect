<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>search result</title>
</head>
<body>
<%
String id = null;
try {
	id = (String)session.getAttribute("id");
}
catch (Exception e) {
	%>
	<script>
	alert('로그인 해주세요.')
	location.href = 'login.jsp'
	</script>
	<%
}
String user = "root";
String password = "rladydpf2";
String url = "jdbc:mysql://localhost:3306/database1?autoReconnect=true& useUnicode=true& characterEncoding=utf8 &useSSL=false&serverTimezone=Asia/Seoul";
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Connection conn = null;
String sql = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	System.out.println("Driver loading success");
}
catch (ClassNotFoundException e) {
	e.printStackTrace();
}
String temp = null;
int item = 0, rnumber = 0;
temp = request.getParameter("num");
if (!(temp == null)) item = Integer.parseInt(temp);

sql = "SELECT MAX(Rnumber) FROM REQUEST";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while (rs.next()) rnumber = rs.getInt(1) + 1;

sql = String.format("INSERT INTO REQUEST VALUES (%d, %d, STR_TO_DATE('2018-12-18' ,'%%Y-%%m-%%d'));", rnumber, item);
pstmt = conn.prepareStatement(sql);
pstmt.executeUpdate();
%>
<script>
	alert('요청을 완료했습니다.')
	location.href = 'mainPage.jsp'
</script>
</body>
</html>
