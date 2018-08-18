<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<div class = "container">
<form action="<%=rPath%>/views/Test/testInsertOK.jsp" onsubmit="return checkval()">
	<fieldset>
		<legend>유저등록</legend>
		<table class="table table-border">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="tId"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="tPwd"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="tBirth"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="tContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button>유저등록</button>
				</td>
			</tr>
		</table>
	</fieldset>
	</form>
</div>

	<script>
			function checkval(){
				var objs= document.querySelectorAll('input');
				for(var i=0;i<objs.length;i++){
					if(objs[i].name!="tContent"){
						if(objs[i].value.length<1 || objs[i].value.lenght>=100){}
						alert(objs[i].name+ "의 값을 확인해주세요")
						objs[i].focus();
						return false;
					}
				}else if(objs[i].name="tBirth"){
					if(objs[i].value.length<8){
						alert(objs[i].name+"의 값을 확인해주세요");
						objs[i].focus();
						return false;
					}
				}
			
				return true;
			}
	</script>
</body>
</html>