<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.erp.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
	String uiName = request.getParameter("uiName");
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");
String uiDesc = request.getParameter("uiDesc");
String uiAge = request.getParameter("uiAge");
String diNo = request.getParameter("diNo");
String uiNo = request.getParameter("uiNo");
Connection con = DBCon.getCon();
String sql = "update user_Info set uiName=?,";
sql += " uiId=?,";
sql += " uiPwd=?,";
sql += " uiDesc=?,";
sql += " uiAge=?,";
sql += " diNo=?";
sql += " where uiNo=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,uiName);
ps.setString(2,uiId);
ps.setString(3,uiPwd);
ps.setString(4,uiDesc);
ps.setString(5,uiAge);
ps.setString(6,diNo);
ps.setString(7,uiNo);
try{
int cnt = ps.executeUpdate();
DBCon.close();
out.println("cnt : " + cnt);
if(cnt==1){
%>
<script>
	alert("유저수정이 정상적으로 이루어졌습니다.");
	location.href="<%=rPath%>/views/userInfo/userList.jsp";
</script>
<%
}
}catch(SQLException e){
	out.println(e);
}
%>