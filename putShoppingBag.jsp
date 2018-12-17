<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>update shoppingBag</title>
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
int item = 0, quantity = -1;
boolean key = true;
String temp = null;
try {
	temp = request.getParameter("num");
	if (!(temp == null)) item = Integer.parseInt(temp);
	temp = request.getParameter("quantity");
	if (!(temp == null)) quantity = Integer.parseInt(temp);
}
catch(Exception e) {}
if (item < 1 || item > 45) {
	key = false;
	%>
	<script>
	alert('아이템을 정하지 않았습니다.')
	location.href = 'mainPage.jsp'
	</script> 
	<%
}
else if (quantity <= 0) {
	key = false;
	%>
	<form action = "showItem.jsp" method="post">
		<input type = "hidden" name = "num" value =<%=item%>>
		<input type = "submit" value = "이전으로 돌아가기">
	</form>
	<script>
	alert('제대로된 수량을 정해주세요.')
	</script> 
	<%
}
%>
<%
if (key){
	sql = String.format("SELECT Cnumber FROM CUSTOMER WHERE C_ID = '%s'", id);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	int number = 0;
	while (rs.next()) {
		number = rs.getInt(1);
	}
	sql = String.format("SELECT Squantity FROM SHOPPINGBASKET WHERE Cnum = %d AND Inum = %d", number, item);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	int overlap = 0;
	while (rs.next()) {
		overlap = rs.getInt(1);
		sql = String.format("DELETE FROM SHOPPINGBASKET WHERE Cnum = %d AND Inum = %d", number, item);
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
	}
	sql = String.format("INSERT INTO SHOPPINGBASKET VALUES (%d, %d, %d)", number, item, quantity + overlap);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	%>
		<script>
			alert('장바구니에 담았습니다.')
			location.href = 'mainPage.jsp'
		</script>
	<% 
}
%>
</body>
</html>
