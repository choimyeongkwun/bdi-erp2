<%@page import="com.bdi.erp.common.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<style>
	h4,th,tr{text-align:center;}
</style>
<body>
	<div class="container">
		<h4>유저리스트</h4>
		<table class="table table-boreder table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>생일</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<%
					Connection con = DBCon.getCon();
							String sql = "select tNo,tId,tBirth,tContent from Test";
							PreparedStatement ps = con.prepareStatement(sql);
							ResultSet rs = ps.executeQuery();
							while (rs.next()) {
				%>
				<tr>
					<td><a href="<%=rPath%>/views/Test/testView.jsp?tNo=<%=rs.getInt("tNo")%>"><%=rs.getInt("tNo")%></a></td>
					<td><%=rs.getString("tId")%></td>
					<td><%=rs.getString("tBirth")%></td>
					<td><%=rs.getString("tContent")%></td>
				</tr>
				<%
					}
							rs.close();
							ps.close();
							DBCon.close();
				%>
			</tbody>
		</table>
	</div>
</body>
</html>