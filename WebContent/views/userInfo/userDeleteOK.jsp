<%@page import="com.bdi.erp.common.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
	String uiNo = request.getParameter("uiNo");
	Connection con = DBCon.getCon();
	String sql = "delete from user_info where uiNo=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,uiNo);
	int cnt = ps.executeUpdate();
	DBCon.close();
	if (cnt == 1) {
%>
<script>
	alert("유정 등록이 정상적으로 삭제되었습니다.");
	location.href="<%=rPath%>/views/userInfo/userList.jsp";
</script>
<%
	}
%>