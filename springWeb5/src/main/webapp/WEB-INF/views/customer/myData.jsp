<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" media="all" href="../resources/css/web5.css" />
<!-- 경로주이ㅡ -->

<script type="text/javascript">

function ncheck(){

	var name = document.getElementById('name');
	var password = document.getElementById('password');
	var password1 = document.getElementById('password1');
	
	if(name.value.length ==0 || name.value == null){
		alert('이름을 입력해주세요')
		return false;
		}
		
		else if(password.value != password1.value){
			alert('비밀번호가 일치하지 않습니다.')
			return false; }
		


	else
		return true;
}




</script>




</head>
<body>



	<form id="adjust" action="myData" method="post"
		onsubmit="return ncheck()">
		<table border=1>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" id="password"
					placeholder="비밀번호 입력"><br> <input type="password"
					name="password1" id="password1" placeholder="비밀번호 다시 입력"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name" value="${vo.name}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email"
					value="${vo.email}"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" id="phone"
					value="${vo.phone}"></td>
			</tr>

			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="address"
					value="${vo.address}"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="수정"> <input
					type="reset" value="다시쓰기"></th>
			</tr>
		</table>
	</form>


</body>
</html>