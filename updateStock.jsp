<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update stock</title>
</head>
<body>
<%
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
boolean key = true;
int item = 0, retail = 0, quantity = -1;
try {
	temp = request.getParameter("id");
	System.out.println(temp);
	if (!(temp == null)) item = Integer.parseInt(temp);
	temp = request.getParameter("quantity");
	if (!(temp == null)) quantity = Integer.parseInt(temp);
}
catch (Exception e) {}
if (item < 1 || item > 45) {
	key = false;
	%>
	<script>
	alert('아이템을 제대로 정하지 않았습니다.')
	location.href = 'manager.jsp'
	</script> 
	<%
}
else if (quantity < 1) {
	key = false;
	%>
	<script>
	alert('수량을 제대로 정하지 않았습니다.')
	location.href = 'manager.jsp'
	</script> 
	<%
}
if (key){
	sql = String.format("SELECT quantity FROM STOCK WHERE Inumber = %d", item);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	int overlap = 0;
	while (rs.next()) {
		overlap = rs.getInt(1);
	}
	sql = String.format("UPDATE STOCK SET quantity = %d WHERE Inumber = %d", quantity + overlap, item);
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	%>
		<script>
			alert('주문을 완료했습니다.')
			location.href = 'manager.jsp'
		</script>
	<% 
}
%>

</body>
</html>
