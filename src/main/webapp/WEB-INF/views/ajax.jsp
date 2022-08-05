<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	<script type="text/javascript">
		function ajax01() {
			$.ajax({
				uri : "ajax01", //어디로 연결할 것인지
				type : "get", //요청방식
				success : function() { //연결 성공시
					console.log("성공")
				},
				error: function(){//연결 실패시
					alert("연결 실패")
				}
			})
		}
	</script>

</head>
<body>

	<h1>1</h1> <h1>1</h1> <h1>1</h1>
	<h1>1</h1> <h1>1</h1> <h1>1</h1>
	<h1>1</h1> <h1>1</h1> <h1>1</h1>
	<button onclick="ajax01()">ajax01</button>
	
</body>
</html>