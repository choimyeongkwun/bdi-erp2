<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.erp.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
	String tId = request.getParameter("tId");
String tPwd = request.getParameter("tPwd");
String tBirth = request.getParameter("tBirth");
String tContent = request.getParameter("tContent");
String tNo = request.getParameter("tNo");

Connection con = DBCon.getCon();
String sql = "update Test set tId=?,tPwd=?,tBirth=?,tContent=? where tNo=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,tId);
ps.setString(2,tPwd);
ps.setString(3,tBirth);
ps.setString(4,tContent);
ps.setString(5,tNo);
try{
int cnt = ps.executeUpdate();
DBCon.close();
out.println("cnt : " + cnt);
if(cnt==1){
%>
<script>
	alert("유저수정이 정상적으로 이루어졌습니다.");
	location.href="<%=rPath%>/views/Test/testList.jsp";
</script>
<%
}
}catch(SQLException e){
	out.println(e);
}
%>