<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>고객 페이지</title>
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
 
	String lname = null;
	String fname = null;
	
	sql = String.format("SELECT last_name, first_name FROM PERSON WHERE id = '%s'", id);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		lname = rs.getString(1);
		fname = rs.getString(2);
	}
	

%>
<h1>고객 인터페이스</h1>
<hr>
<%=lname%> <%=fname%>님이 로그인하셨습니다.<br>
<input type = "button" value = "장바구니 확인" onclick = "location.href = 'shoppingBag.jsp'">
<input type = "button" value = "상품 검색" onclick = "location.href = 'searchItem.jsp'"> <br>
</body>
</html>
