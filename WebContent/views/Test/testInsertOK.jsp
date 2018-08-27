<%@page import="com.bdi.erp.common.DBCon"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
	String tId = request.getParameter("tId");
String tPwd = request.getParameter("tPwd");
String tBirth = request.getParameter("tBirth");
String tContent= request.getParameter("tContent");

Connection con = DBCon.getCon();
String sql ="insert into Test(tId, tPwd, tBirth, tContent)";
sql += "values(?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,tId);
ps.setString(2,tPwd);
ps.setString(3,tBirth);
ps.setString(4,tContent);
int cnt = ps.executeUpdate();
DBCon.close();
if(cnt==1){
%>
<script>
	alert("정상적작동");
	location.href="<%=rPath%>/views/Test/testList.jsp";
</script>
<%
}
%>