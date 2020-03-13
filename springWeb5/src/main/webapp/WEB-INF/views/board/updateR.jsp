<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글수정</title>

<script type="text/javascript">


function updateR(){
	var form = document.getElementById("hiddenR");
	var text1 = document.getElementById("text1").value;

	text.value = text1;
	replynum.value=${r.replynum};
	boardnum.value = ${r.boardnum};
	form.submit();
}



</script>


</head>
<body>



	<table border=1>

		<tr>
			<th>내용</th>
			<td><input type="text" name="text1" id="text1" value="${r.text}"></td>
		</tr>

		<tr>
			<th colspan="2"><input type="button" value="수정" onclick="updateR()"> <input
				type="reset" value="다시쓰기"></th>
		</tr>
	</table>



	<form id="hiddenR" action="updateR" method="POST">

		<input type="hidden" name="boardnum" id="boardnum">
		 <input	type="hidden" name="replynum" id="replynum"> 
		 <input type="hidden" name="text" id="text">



	</form>

</body>
</html>