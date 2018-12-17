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
String keyword = null;
try {
	keyword = new String(request.getParameter("name").getBytes("8859_1"), "EUC-KR");
}
catch (Exception E) {
	%>
	<script>
	alert('제대로 검색을 해주세요.')
	location.href = 'searchItem.jsp'
	</script>
	<%
}
sql = String.format("SELECT Inumber, Sitem, quantity FROM STOCK WHERE Sitem LIKE '%%%s%%'", keyword);
System.out.println(sql);
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
int number = 0, quantity = 0;
String name = null;
%>
<table width="700" cellpadding="5" border ="1">
			<tread>
				<tr>
					<th>상품 이름</th>
					<th>재고량</th>
					<th>수량</th>
				</tr>
		    </tread>
	<%
	while (rs.next()) {
		number = rs.getInt(1);
		name = rs.getString(2);
		quantity = rs.getInt(3);
	%>
				<tr>
			        <td id="title"><%=name%></td>
			        <td id="title"><%=quantity%></td>
			        <td> <form action = "putShoppingBag.jsp" method="post">
			        	<input type = "number" name = "quantity">
						<input type = "hidden" name = "num" value =<%=number%>>
						<input type = "submit" value = "장바구니 담기">
						</form> 
					</td>
					<td> <form action = "requestStock.jsp" method="post">
			        	<input type = "hidden" name = "num" value =<%=number%>>
						<input type = "submit" value = "재고 요청하기">
						</form> 
					</td>
			    </tr>
	<%
}
	%>
</body>
</html>
