<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
</head>
<body>




	<form id="writeForm" action="write" method="post" enctype="multipart/form-data" >		<!-- enctype 추가. -->
	
		<table border=1>
		
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title"
					></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><input type="text" name="contents" id="contents"
					></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="upload" id="file" value="파일선택" size="30"
					></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="전송"> <input
					type="reset" value="다시쓰기"></th>
			</tr>
		</table>
	</form>

</body>
</html>