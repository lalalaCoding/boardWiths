<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	html, body {height: 100%;}
	body {display: flex; align-items: center; padding-top: 40px; padding-bottom: 40px; background-color: white;}
	.form-signin {max-width: 330px; }
	.form-signin input[type="email"] {margin-bottom: 3px; border-bottom-right-radius: 0; border-bottom-left-radius: 0;}
	.form-signin input[type="password"] {margin-bottom: 10px; border-top-left-radius: 0; border-top-right-radius: 0;}
	.form-signin a>label{color: black;}
	.form-signin a>label:hover{text-decoration: underline;}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body class="text-center">
	<main class="form-signin w-100 m-auto">
		<form action="${contextPath}/insertUsers.me" method="post">
			<h1 class="h3 mb-1 fw-normal">- 회원 가입 -</h1>

			<div class="mb-1" style="margin-top: 0px;">
				<label for="id" class="form-label"></label>
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디">
			</div>	
			<label id="idCheckResult" style="font-size: 12px; margin-right: 0px; padding-right: 0px;">Please check your ID.</label>
			<div class="mb-1" ">
				<label for="pwd" class="form-label"></label>
				<input type="password" class="form-control" id="pwd" name="pwd"placeholder="비밀번호">
			</div>
			<div class="mb-1">
				<label for="pwd" class="form-label"></label>
				<input type="text" class="form-control" id="email" name="email"placeholder="비밀번호 분실시 확인용 이메일">
			</div>
			<div class="mb-1">
				<label for="pwd" class="form-label"></label>
				<input type="text" class="form-control" id="nickname" name="nickname"placeholder="닉네임">
			</div>
			<div class="mb-1">
				<label for="pwd" class="form-label"></label>
				<input type="text" class="form-control" id="name" name="name"placeholder="이름">
			</div>
			<div class="mb-1">
				<label for="pwd" class="form-label"></label>
				<input type="text" class="form-control" id="phone" name="phone"placeholder="휴대전화">
			</div>
			<br>
			<button class="w-100 btn btn-primary" type="submit" >회원 가입</button><br><br>
		</form>
	</main>
	<script>
		window.onload =()=> {
			document.getElementById('id').addEventListener('change', function(){
				const idResult = document.getElementById('idCheckResult');
				if(this.value.trim() == ' '){
					idResult.innerText = "Please check your ID.";
					idResult.style.color = 'gray';
				} else {
					$.ajax({
						url: '${contextPath}/checkId.me',
						data: {id:this.value.trim()},
						success: (data)=>{
							console.log(data);
							if(data.trim() == 'yes'){
								idResult.innerText = "You can use this id";
								idResult.style.color = 'green';
							} else {
								idResult.innerText = "You can't use this id";
								idResult.style.color = 'red';
							}
						},
						error: data => console.log(data)
					})
				}
			})
		}
	</script>
</body>
</html>