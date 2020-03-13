<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>



<script type="text/javascript">



function update(){
	var form = document.getElementById("hiddenF");
	var title1 = document.getElementById("title1").value;
	var contents1 = document.getElementById("contents1").value;
	var boardnum = document.getElementById("boardnum");

	title.value = title1
	contents.value=contents1
	boardnum.value = ${b.boardnum};
	form.submit();
}


</script>


</head>
<body>

<h1>게시판 수정</h1>



<table border=1>
		

		<tr>
			<th>제목</th>
			<td> <input type="text" name="title" id="title1" value="${b.title}"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><input type="text" name="contents" id="contents1" value="${b.contents}"></td>
		</tr>

		<tr>
			<th>파일첨부</th>
			<td></td>
		</tr>
		
		<tr>
				<th colspan="2"><input type="button" value="수정" onclick="update()"> <input
					type="reset" value="다시쓰기"></th>
			</tr>
		
		</table>



<form id="hiddenF" action="updateB" method="POST">

<input type="hidden" name="boardnum" id="boardnum">
<input type="hidden" name="title" id="title">
<input type="hidden" name="contents" id="contents">



</form>




</body>
</html>