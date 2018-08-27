<%@page import="com.bdi.erp.common.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
	<div class="container">
		<%
			String tId = "";
			String tContent = "";
			int tNo = Integer.parseInt(request.getParameter("tNo"));
			String tBirth = "";

			Connection con = DBCon.getCon();
			String sql = "select tId, tBirth, tContent, tNo from Test";
			sql += " where tNo=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, tNo);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				tId = rs.getString("tId");
				tBirth = rs.getString("tBirth");
				tContent = rs.getString("tContent");
			}
		%>
		<form action="<%=rPath%>/views/Test/testUpdateOK.jsp" onsubmit="return checkval()">
			<fieldset>
				<legend>수정</legend>
				<table class="table table-border">
					<tr>
						<th>번호</th>
						<td><%=tNo%></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="tId" value="<%=tId%>"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="tPwd"></td>
					</tr>
					<tr>
						<th>생일</th>
						<td><input type="text" name="tBirth" value="<%=tBirth%>"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="tContent"><%=tContent%></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button>수정</button>
							<button type="button" onclick="deleteUser()">삭제</button>
						</td>
					</tr>
				</table>
			</fieldset>
			<input type="hidden" name="tNo" value="<%=tNo%>">
		</form>
	</div>
	<script>
		function deleteUser(){
			if(confirm("삭제하시겠습니까")){
				location.href="<%=rPath%>/views/Test/testDeleteOk.jsp?tNo=<%=tNo%>";
			}
		}
		function checkval(){
			var objs= document.querySelectorAll('input');
			for(var i=0;i<objs.length;i++){
				if(objs[i].name!="tContent"){
					if(objs[i].value.length<1 || objs[i].value.lenght>=100){}
					alert(objs[i].name+ "의 값을 확인해주세요")
					objs[i].focus();
					if(objs[i].name="tBirth"){
						if(objs[i].value.length<8){
							alert(objs[i].name+"의 값을 확인해주세요");
							objs[i].focus();
							return false;
						}
					return false;
				}
			}
			return true;
		}
			
		}
			
	</script>
</body>
</html>