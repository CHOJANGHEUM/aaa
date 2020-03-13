<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<script>
	function pwCheck(){

		var form = document.getElementById("dropform");
		var pw1 = document.getElementById('password').value;
		var pw2 = document.getElementById('password1').value;
		if(pw1 == pw2 && '${sessionScope.logPw}' == pw1){			//이거 중요

			alert("탈퇴완료")
			form.submit();
			}
		else
		alert("비밀번호가 일치하지 않습니다.")
				
		}
</script>

</head>
<body>


	<h1>회원탈퇴</h1>


	<form id="dropform" action="drop" method="post"	>
		<table border=1>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" id="password"
					placeholder="비밀번호 입력"><br> <input type="password"
					name="password1" id="password1" placeholder="비밀번호 다시 입력"></td>
			</tr>

			<tr>
				<th colspan="2"><input type="button" value="탈퇴" onclick="pwCheck()"> <input type="reset" value="다시쓰기"></th>
			</tr>
		</table>
	</form>


</body>
</html>