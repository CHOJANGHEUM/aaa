<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하나 읽기</title>

<script type="text/javascript">


function boardDelete() {

		if (confirm("삭제하시겠습니까??")) {

			location.href = 'delete?boardnum=${b.boardnum}';

		}

	}

	function boardUpdata() {

		if (confirm("수정하시겠습니까??")) {

			location.href = 'updateB?boardnum=${b.boardnum}';

		}

	}
	

	function list1() {

		location.href = 'board';

	}

	function insertReply() {

		var form = document.getElementById("hiddenFo");
		var text1 = document.getElementById("text1").value;
		var boardnum = document.getElementById("boardnum");
		boardnum.value = ${b.boardnum};
		text.value = text1;

		form.submit();

	}


	
	
</script>



</head>
<body>


	<table border=1>
		<tr>
			<th>ID</th>
			<td>${b.id}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${b.inputdate}</td>

		</tr>
		<tr>
			<th>조회수</th>
			<td>${b.hits}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${b.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${b.contents}</td>
		</tr>

		<tr>
			<th>파일첨부</th>
			<td><c:if test="${b.originalfile != null}">
					<a href="download?boardnum=${b.boardnum}">${b.originalfile} </a>
				</c:if></td>
		</tr>
		<tr>

			<c:if test="${sessionScope.logId == b.id }">

				<td><input type="button" value="수정" onclick="boardUpdata()">
					<input type="button" value="삭제" onclick="boardDelete()"></td>

			</c:if>

			<th><input type="button" value="목록으로" onclick="list1()"></th>
		</tr>
	</table>

	<br>
	<br>

	<c:if test="${sessionScope.logId != null }">

		<a>리플 : <input type="text" id="text1" name="text1"></a>
		<input type="button" value="리플달기" onclick="insertReply()">

		<form id="hiddenFo" action="insertR" method="POST">
			<input type="hidden" name="boardnum" id="boardnum"> <input
				type="hidden" name="text" id="text">

		</form>

	</c:if>

	<table border=1>

		<c:forEach var="r" items="${r}">
			<tr>
			<th>${r.id}</th>
			<td>${r.text}</td>
			
			<td>${r.boardnum}</td>
			<td>${r.replynum}</td>
			<c:if test="${r.id == sessionScope.logId}">						<!-- 띄어쓰기 주의....... -->
		<td><a href="updateR?replynum=${r.replynum}&boardnum=${r.boardnum}">  {수정}  </a></td>
		<td><a href="deleteR?replynum=${r.replynum}&boardnum=${r.boardnum}">  {삭제}  </a></td>
		
			</c:if>
			
		
			</tr>
		</c:forEach>

	</table>



</body>
</html>