<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script type="text/javascript">

function formCheck(){

var id = document.getElementById('searchId');
if(id.value.length <3 || id.value.length>12){
	alert('3~12자 이내로 ㄱㄱ')
	return false;

	}
	return true;
}


function inputId(){

opener.document.getElementById("id").value = '${searchId}';			//컴마 중요 opener 중요
this.close();
	

}



</script>



</head>
<body>
	<div class="centerdiv">
		<h1>[ID 중복확인]</h1>


		<form action="idcheck" method="post" onsubmit="return formCheck()">


			검색할 ID <input type="text" name="searchId" id="searchId"> <input
				type="submit" value="검색">


		</form>


	


		<c:if test="${result != null}">

			<c:if test="${result =='yes'}">
				<p>${searchId}: 사용가능한 ID입니다.</p>
				<p>
					<input type="button" value="ID사용하기" onclick="inputId()">
				</p>
			</c:if>

			<c:if test="${result == 'no'}">
				<p>${searchId}: 이미 사용중인 ID입니다.</p>
			</c:if>
		</c:if>





	</div>


</body>
</html>