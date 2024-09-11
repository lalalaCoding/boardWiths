<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>td:hover{cursor: pointer;}</style> 
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/boardList.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 헤더 -->
	<header class="p-3 text-bg-white">
        <div class="container-fluid">
            <div class="d-flex flex-wrap align-items-center justify-content-between">
                <a href="${pageContext.servletContext.contextPath}/bhome.do" class="d-flex align-items-left mb-2 mb-lg-0 text-black text-decoration-none">
                    <img class="d-flex align-items-left" src="${pageContext.servletContext.contextPath}/resources/logo.png" width="350px" height="100px"/>
                </a>
                
				<div class="d-flex align-items-center justify-content-between">
				    <div>
				        <div class="dropdown">
				            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
				                 ${loginUser.nickName}님
				            </button>
				            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				                <li class="d-flex justify-content-between">
				                    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/usermypage.us">마이페이지<br>확인하기</a>
				                    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/userchange.us">회원정보<br>수정하기</a>
				                </li>
				            </ul>
				        </div>
				    </div>
				</div>
				
            </div>
        </div>
    </header>
    
		<div class="container" style="display:flex; width: 1440px;">
	    	<div class="d-block p-3 text-bg-dark text-center" style="width: 240px; height: 1000px;">
	            <span class="d-block fs-4">
	            Boardwiths
	            </span>
	        <hr>
	        <ul class="nav nav-pills flex-column mb-auto">
	            <li class="nav-item">
	                <a href="${pageContext.servletContext.contextPath}/usermypage.us" class="nav-link text-white" aria-current="page">마이페이지</a>
	            </li>
	            <li>
	                <a href="${pageContext.servletContext.contextPath}/userchange.us" class="nav-link text-white">회원정보 수정</a>
	            </li>
	            <li>
	                <a href="${pageContext.servletContext.contextPath}/goodlist.bo" class="nav-link text-white">좋아요 목록</a>
	            </li>
	            <li>
	                <a href="${pageContext.servletContext.contextPath}/siteout.us" class="nav-link text-white">탈퇴하기</a>
	            </li>
	        </ul>
	        <hr>
	    </div>
	
	    <div class="d-inline-block p-3 text-bg-light flex-grow-1 text-align-center" style="width: 1100px;">
	    
        <div class="container d-flex justify-content-between mb-3">
        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${pageContext.servletContext.contextPath}/usermypage.us">마이페이지</a>
        	<div class="input-group mb-0" style="width:20%">
        	</div>
     	</div>
	
	
	        <table class="table table-hover align-middle">
		            <thead>
		                <tr>
		                    <th scope="col" width="100px" height="60">이름</th><td>${ loginUser.usersName }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">닉네임</th><td>${ loginUser.nickName }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">아이디</th><td>${ loginUser.id }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">비밀번호</th><td>${ loginUser.pwd }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">휴대전화</th><td>${ empty loginUser.phone ? '-' : loginUser.phone }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">이메일</th><td>${ empty loginUser.email ? '-' : loginUser.email }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">회원등급</th><td>${ loginUser.grade }</td>
		                </tr>
		                 <tr>
		                    <th scope="col" width="100px" height="60">회원번호</th><td>${ loginUser.usersNo }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">가입날짜</th><td>${ loginUser.enrollDate }</td>
		                </tr>
		                <tr>
		                    <th scope="col" width="100px" height="60">신고횟수</th><td>${ loginUser.reportCount }</td>
		                </tr>
		            </thead>
	           </table>
	        
	         <div class="mh-100" style="width: 100px; height: 280px;"></div>
	        
	    </div>
	</div>
	

	<div class="container py-3 my-4">
	    <ul class="nav justify-content-center pb-3 mb-3" style="position:sticky; ">
	      <li class="nav-item"><a href="${pageContext.servletContext.contextPath}/common/communityrule" class="nav-link px-2 text-body-secondary">커뮤니티 규칙</a></li>
	      <li class="nav-item"><a href="${pageContext.servletContext.contextPath}/common/regulation" class="nav-link px-2 text-body-secondary">서비스 약관/정책</a></li>
	      <li class="nav-item"><a href="${pageContext.servletContext.contextPath}/common/personal_info" class="nav-link px-2 text-body-secondary">개인정보취급방침</a></li>
	    </ul>
	    <p class="text-center text-body-secondary">회사명: 보드라이프 | 서울시 중구 을지로 | 등록번호: 594-39-29383 | <br>
	    Copyright © boardwiths / All rights reserved</p>
	</div>
    
    <script>
	    window.onload = () => {
	        const loginUser = '${loginUser}';
	        if(loginUser == ''){
	            alert('로그인 후 이용해주세요.');
	            location.href='${pageContext.servletContext.contextPath}/loginView.us';
	        }
	    }
	</script>
	
</body>
</html>
	