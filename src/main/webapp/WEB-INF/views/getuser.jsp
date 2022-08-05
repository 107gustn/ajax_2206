<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		function getUsers() {
			$.ajax({
				url : "users", type : "get" , dataType : "json",
				success : function(list) {
					let content = ""
					for(i=0 ; i < list.length ; i++) {
						content += "<b>아이디 : </b>" + list[i].name +"님<br>"
						content += "<b>나이 : </b>" + list[i].age +"살<hr>"
					}
					
					/*
					content += "<b>아이디 : </b>" + list[0].name +"님<br>"
					content += "<b>나이 : </b>" + list[0].age +"살<hr>"
					
					content += "<b>아이디 : </b>" + list[1].name +"님<br>"
					content += "<b>나이 : </b>" + list[1].age +"살<hr>"
					*/
					
					//$("#users").text( content ) //텍스트로 값을 보여줌
					//$("#users").html( content ) //html로 값을 보여줌 - 내용 바꿈
					$("#users").append( content ) //값을 추가시켜줌 - 이어쓰기
					console.log( list )
				}
			})
		}
		
		function userInfo() { //입력한 아이디 정보 가져옴
			$.ajax({
				url : "user?id="+$("#userId").val() , type:"get", dataType:"json",
				success : function(data) {
					content = ""
					content += "<b>아이디 : </b>" + data.name +"님<br>"
					content += "<b>나이 : </b>" + data.age +"살<hr>"
					
					$("#users").html( content )
				}
			})
		}
		
		function userInfo2() {
			$.ajax({
				url : "user2/"+$("#userId").val() , type:"get", dataType:"json", //데이터를 경로처럼 넘겨줌
				success : function(data) {
					content = ""
					content += "<b>아이디 : </b>" + data.name +"님<br>"
					content += "<b>나이 : </b>" + data.age +"살<hr>"
					
					$("#users").html( content )
				}
			})
		}
		
		function modify() {
			let name = $("#name").val()
			let age = $("#age").val()
			let form = { name:name , age:age}
			$.ajax({
				url : "modify", type : "put",
				data : JSON.stringify(form),
				contentType : "application/json; charset=utf-8"
			})
		}
		
		function membership() {
			
			/*
			let form = {
					uId : $("#uId").val(),
					uName : $("#uName").val(),
					uAge : $("#uAge").val(),
					uAddr : $("#uAddr").val(),
					uPhone : $("#uPhone").val()
			}
			*/
			
			form = {}
			let arr = $("#frm").serializeArray() //배열형태로 name과 value를 얻어옴
			console.log( arr )
			for(i=0 ; i<arr.length ; i++) {
				form[arr[i].name] = arr[i].value //key와 value형태로 만들어줌
			}
			console.log(form)
			
			$.ajax({
				url : "membership", type : "post",
				data : JSON.stringify( form ),
				contentType : "application/json;charset=utf8",
				dataType : "text",//리턴타입 텍스트로 받음
				success:function(bool) {
					console.log(typeof bool)
					console.log(bool == true)
					if(bool == true){
						alert("저장 성공!!!")
					}else {
						alert("저장 실패!!!")
					}
				}
			})
		}
	</script>
	
</head>
<body>getuser.jsp<br>
	
	<span id="users"></span>
	<hr>
	<button type="button" onclick="getUsers()">전체 목록</button>
	<hr>
	<input type="text" id="userId"><br>
	<input type="button" onclick="userInfo()" value="검색">
	<input type="button" onclick="userInfo2()" value="검색2">
	<hr>
	검색 아이디 : <input type="text" id="name"><br>
	수정 나이 : <input type="text" id="age"><br>
	<input type="button" onclick="modify()" value="수정">
	<hr>
	
	<form id="frm">
		<input type="text" name="id" id="uId"><br>
		<input type="text" name="name" id="uName"><br>
		<input type="text" name="age" id="uAge"><br>
		<input type="text" name="addr" id="uAddr"><br>
		<input type="text" name="phone" id="uPhone"><br>
		<input type="button" onclick="membership()" value="가입"><br>
	</form>
	<hr>
	
	<script type="text/javascript">
		function test() {
			console.log( $("#t_id").val() )
		}
	</script>
	<input type="text" oninput="test()" id="t_id"> <!-- 입력을 감지해줌 -->
	
</body>
</html>