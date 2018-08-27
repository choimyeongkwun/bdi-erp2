<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.erp.common.DBCon"%>
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
					<th>이름</th>
					<th>아이디</th>
					<th>사원설명</th>
					<th>나이</th>
					<th>부서</th>
				</tr>
			</thead>
			<tbody>
				<%
					Connection con = DBCon.getCon();
							String sql = "select uiNo,uiName,uiId,uiDesc,uiAge,diNO from user_info";
							PreparedStatement ps = con.prepareStatement(sql);
							ResultSet rs = ps.executeQuery();
							while (rs.next()) {
				%>
				<tr>
					<td><a href="<%=rPath%>/views/userInfo/userView.jsp?uiNo=<%=rs.getInt("uiNo")%>"><%=rs.getInt("uiNo")%></a></td>
					<td><%=rs.getString("uiName")%></td>
					<td><%=rs.getString("uiId")%></td>
					<td><%=rs.getString("uiDesc")%></td>
					<td><%=rs.getInt("uiAge")%></td>
					<td><%=rs.getInt("diNo")%></td>
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