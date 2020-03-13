<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<title>Home</title>
</head>
<body>
	<h1>Spring Web5 - SE Bank Step4</h1>

	<c:if test="${sessionScope.logId!=null}">
		<p>${sessionScope.logId}님환영해유!~</p>
		<ul>
			<li><a href="member/myData">개인정보수정</a></li>
			<li><a href="member/logout">로그아웃</a></li>
			<li><a href="board/board">게시판</a></li>
			<li><a href="member/drop">회원탈퇴</a></li>
		</ul>
	</c:if>
	<c:if test="${sessionScope.logId==null}">
		<ul>
			<li><a href="member/joinForm">회원 가입</a></li>
			<li><a href="member/login">로그인</a></li>
			<li><a href="board/board">게시판</a></li>

		</ul>
	</c:if>




</body>
</html>
