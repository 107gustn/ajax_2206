<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		function ajax02() {
			$.ajax({
				url : "ajax_result02", type : "get",
				success : function(data) { //data: 컨트롤러에서 결과값을 받는 변수
					console.log(data)
					$("#likes").text( data ) //텍스트로 값을 넣어줌
				}, error : function() {
					alert("문제 발생!!!")
				}
			})
		}
	</script>

</head>
<body>ajax02.jsp<br> <!-- 페이지 전체를 받는 것이 아니라 특정 값만 받아서 처리 속도가 빠르다 -->

	<h1>1</h1> <h1>1</h1> <h1>1</h1>
	<h1>1</h1> <h1>1</h1> <h1>1</h1>
	<h1>1</h1> <h1>1</h1> <h1>1</h1>
	<button onclick="ajax02()">클릭</button>
	<label id="likes">0</label>

</body>
</html>