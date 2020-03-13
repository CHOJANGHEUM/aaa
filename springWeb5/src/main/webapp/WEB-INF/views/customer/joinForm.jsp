<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>


<link rel="stylesheet" media="all" href="../resources/css/web5.css" />	<!-- 경로주이ㅡ -->

<script>
	function idcheckOpen() {

		window.open('idcheck','idwin'); //새창여는 메소드 window.close = 컨트롤러로 감

	}


	function pwCheck(){

		var pw1 = document.getElementById('password').value;
		var pw2 = document.getElementById('password1').value;

		if(pw1 != pw2){

			alert("비밀번호가 일치하지 않습니다.")
			return false;
			}


		return true;		
		}
</script>


</head>
<body>


	<form id="inputForm" action="join" method="post" onsubmit="return pwCheck()">
		<table border=1>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="id" maxlenght="10"
					readonly="readonly" placeholder="id 중복확인 이용"> <input
					type="button" value="중복확인" onclick="idcheckOpen()"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" id="password"
					placeholder="비밀번호 입력"><br> <input type="password"
					name="password1" id="password1" placeholder="비밀번호 다시 입력"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name"
					placeholder="이름 입력"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email"
					placeholder="이메일 입력"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" id="phone"
					placeholder="전화번호를 입력하세요"></td>
			</tr>

			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="address"
					placeholder="주소입력"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="전송"> <input
					type="reset" value="다시쓰기"></th>
			</tr>
		</table>
	</form>
</body>
</html>