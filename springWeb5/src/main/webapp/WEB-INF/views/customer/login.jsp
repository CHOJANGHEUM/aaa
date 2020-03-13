<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>

	<form id="loginform" action="login" method="post">
		<table border=1>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="id" maxlenght="10" placeholder="아이디 입력"> </td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" id="password"
					placeholder="비밀번호 입력">
			</tr>
			
			<tr>
				<th colspan="2"><input type="submit" value="로그인"> <input
					type="reset" value="다시쓰기"></th>
			</tr>
		</table>
	</form>

</body>
</html>