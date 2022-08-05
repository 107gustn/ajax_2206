<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		function ajax04() {
			var n = document.getElementById("name").value; //javascript
			var a = $("#age").val() //jQuery
			var addr = $("#addr").val()
			var form = {name : n, age : a, addr : addr} //{키:값}
			console.log( form ) //입력 데이터 확인
			console.log(typeof form ) //타입 확인
			$.ajax({
				url : "ajax_result04", type : "post", //RESTful - post: 데이터 추가(insert) / get: 데이터 조회(사용자보기; select) / put: 데이터 수정(update) / delete : 데이터 삭제
				data : JSON.stringify(form), //서버로 보낼 데이터 //(해당 객체를 문자열로 변환해줌) //get방식 사용 불가
				contentType : "application/json; charset=utf8", //서버로 보낼 데이터 타입
				dataType : "json", //서버로부터 리턴받을 타입(return type)
				success : function(data) {
					$("label").text( data.name + ", " + data.age + ", " + data.addr)
					console.log("data => ", data )
				}, error : function() {
					alert('문제 발생!!!')
				}
				
			})
		}
	</script>

</head>
<body>ajax04.jsp<br>
	
	name : <input type="text" id="name"><br>
	age : <input type="text" id="age"><br>
	addr : <input type="text" id="addr"><br>
	<input type="button" onclick="ajax04()" value="전송">
	
	<br><label id="label"></label>
	
</body>
</html>