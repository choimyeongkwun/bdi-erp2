<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<%
String age = request.getParameter("age");
String name = request.getParameter("name");
String[] hobby = request.getParameterValues("hobby");

if(age!=null){
	out.print(name +"은"+ age + "살 입니다.<br>");
	int y = Integer.parseInt(age);
	
	for(String hobbystr : hobby){
		out.println(hobbystr+"<br>");
	}
/* 	for(int i = 0;i<hobby.length;i++){
		hobbystr += hobby[i]+",";
	}
	out.print(hobbystr+"<br>"); */
	//int x = Integer.parseInt(name);
 if(y<10){
	 out.print("유아");
 }else if(y<20){
	 out.print("10대");
 }else if(y<30){
	 out.print("20대");
}else if(y<40){
	 out.print("30대");
}else if(y<50){
	 out.print("40대");
}else{
	out.print("노년");
}
}
%>
<form>
	이름 : <input type="text" name="name"><br>
	나이 : <input type="text" name="age"><br>
	취미 : 영화<input type ="checkbox" name="hobby" value="영화">
		음악감상<input type ="checkbox" name="hobby" value="음악감상">
		게임<input type ="checkbox" name="hobby" value="게임">
	<button>전송</button>
</form>
</body>
</html>