<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>shopping bag</title>
</head>
<body>
<h2>장바구니 페이지입니다.</h2>
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
sql = String.format("SELECT Sitem, Squantity FROM CUSTOMER, STOCK, SHOPPINGBASKET WHERE C_ID = '%s' AND Cnumber = Cnum AND Inumber = Inum", id);
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
%>
<table width="400" cellpadding="5" border ="1">
		<tread>
			<tr>
				<th>상품 이름</th>
				<th>수량</th>
			</tr>
	    </tread>
<%
String name = null;
int quantity = -1;
while (rs.next()) {
	name = rs.getString(1);
	quantity = rs.getInt(2);
%>
			<tr>
		        <td id="title"><%=name%></td>
		        <td id="title"><%=quantity%></td>
		    </tr>
<%
}
%>
</table>

</body>
</html>
