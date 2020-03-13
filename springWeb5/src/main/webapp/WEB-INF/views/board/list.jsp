<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet" media="all" href="../resources/css/web5.css" />
<!-- 경로주이ㅡ -->

<script type="text/javascript">
	function goWriteForm() {

		/* window.open('','','') */
		location.href = 'write'; //get방식 상대경로.jsp

	}

	function pagingFormSubmit(currentPage) {
		var form = document.getElementById('pagingForm');
		var page = document.getElementById('page');
		page.value = currentPage;
		form.submit();
	}
</script>

</head>
<body>

	<h1>게시판</h1>

<p>전체 : ${navi.totalRecordsCount}</p>

	<c:if test="${sessionScope.logId!=null}">

		<p>
			<input type="button" value="글쓰기" onclick="goWriteForm()">
		</p>
	</c:if>

	<table border=1>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>


		<c:forEach var="s" items="${bb}">
			<tr>

				<td>${s.boardnum}</td>
				<td><a href="read?boardnum=${s.boardnum}">${s.title}</a></td>
				<td>${s.id}</td>
				<td>${s.hits}</td>
				<td>${s.inputdate}</td>

			</tr>
		</c:forEach>



	</table>

<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>


<br><br>

		<!-- 검색폼 -->
		<form id="pagingForm" method="get" action="board">
			<input type="hidden" name="page" id="page" />
			 제목 : <input type="text" name="searchText" value="${searchText}" />
			  <input type="button" onclick="pagingFormSubmit(1)" value="검색">
		</form>
		<!-- /검색폼 -->
</body>
</html>