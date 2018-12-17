<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manager page</title>
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
%>
<h2>매니저 인터페이스</h2>
<h4>고객 재고 요청 목록</h4>
<table width="400" cellpadding="5" border ="1">
		<tread>
			<tr>
				<th>요청 번호</th>
				<th>요청 날짜</th>
				<th>아이템 번호</th>
			</tr>
	    </tread>
<%
sql = "SELECT Rnumber, Rdate, Sitem FROM REQUEST, STOCK WHERE Ino = Inumber";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

int Rnumber = 0;
String date = null, item = null;
while (rs.next()){
	Rnumber = rs.getInt(1);
	date = rs.getString(2);
	item = rs.getString(3);
	%>
	<tr>
		<td id="title"><%=Rnumber%></td>
		<td id="title"><%=date%></td>
		<td id="title"><%=item%></td>
	</tr>
	<%
}
%>
</table>
<form action = "updateStock.jsp" method="post">
	아이템 고유 번호 입력: <input type = "number" name = "id"><br>
	수량 입력: <input type = "number" name = "quantity"><br>
	<input type = "submit" value = "해당 상품 주문">
</form>
</body>
</html>
