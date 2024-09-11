<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 탈퇴</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/boardList.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

<header class="p-3 text-white">
    <div class="container-fluid">
        <div class="d-flex flex-wrap align-items-center justify-content-between">
            <a href="${pageContext.servletContext.contextPath}/bhome.do" class="d-flex align-items-left mb-2 mb-lg-0 text-black text-decoration-none">
                <img class="d-flex align-items-left" src="${ pageContext.servletContext.contextPath }/resources/logo.png" width="350px" height="100px"/>
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
                <a href="${ pageContext.servletContext.contextPath }/usermypage.us" class="nav-link text-white" aria-current="page">마이페이지</a>
            </li>
            <li>
                <a href="${ pageContext.servletContext.contextPath }/userchange.us" class="nav-link text-white">회원정보 수정</a>
            </li>
            <li>
                <a href="${ pageContext.servletContext.contextPath }/goodlist.bo" class="nav-link text-white">좋아요 목록</a>
            </li>
            <li>
                <a href="${ pageContext.servletContext.contextPath }/siteout.us" class="nav-link text-white">탈퇴하기</a>
            </li>
        </ul>
        <hr>
    </div>

    <div class="d-inline-block p-3 text-bg-light flex-grow-1 text-align-center" style="width: 1100px;">
        <div class="container d-flex justify-content-between mb-3">
            <a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${pageContext.servletContext.contextPath}/siteout.us">회원 탈퇴</a>
            <div class="input-group mb-0" style="width: 10%;">
                <div class="d-flex justify-content-end">
                    <button id="withdrawButton" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" disabled>탈퇴하기</button>
                    
                    <!-- 모달 -->
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">마지막 인사</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    탈퇴취소 할 경우 마이페이지로 넘어갑니다!<br><br>그동안 저희 사이트를 이용해주셔서 감사합니다.<br>보드위즈.
                                </div>
                                <div class="modal-footer">
                                    <a href="${pageContext.servletContext.contextPath}/usermypage.us" class="btn btn-secondary">탈퇴취소</a>
                                    <a href="${ pageContext.servletContext.contextPath }/bhome.do" class="btn btn-primary">탈퇴확인</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 회원 탈퇴 폼 -->
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h2 class="text-center mb-4">회원 탈퇴 페이지</h2>
                     <figure class="text-center">
                     <figcaption class="blockquote-footer">
    					비밀번호가 일치할때만 탈퇴버튼이 활성화됩니다
  					 </figcaption>
  					 </figure>
                    <form id="withdrawForm" method="post" action="${pageContext.servletContext.contextPath}/siteout.us">
                        <div class="mb-3">
                            <label for="inputPassword" class="form-label">비밀번호 확인</label>
                            <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="탈퇴를 위한 비밀번호를 입력하세요" required>
                        </div>
                        <div class="mb-3">
                            <label for="leaveReason" class="form-label">탈퇴 사유</label>
                            <select class="form-select" id="leaveReason" name="leaveReason" required>
                                <option value="">탈퇴 사유를 선택하세요</option>
                                <option value="1">자주 사용하지 않습니다.</option>
                                <option value="2">사이트가 불편합니다.</option>
                                <option value="3">탈퇴 후 재가입할 계획입니다.</option>
                                <option value="4">개인정보를 삭제하고 싶습니다.</option>
                                <option value="5">기타(선택시 사유를 적어주세요)</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="leaveMsg" class="form-label">기타 사유 (선택)</label>
                            <textarea class="form-control" id="leaveMsg" name="leaveMsg" rows="7" placeholder="기타 사유를 입력하세요"></textarea>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
$(document).ready(function() {
    $('#inputPassword').on('input', function() {
        var inputPassword = $(this).val();
        var correctPassword = '${loginUser.pwd}';

        if (inputPassword === correctPassword) {
            $('#withdrawButton').prop('disabled', false);
        } else {
            $('#withdrawButton').prop('disabled', true);
        }
    });

    $('#confirmWithdrawButton').click(function(event) {
        event.preventDefault();

        var inputPassword = $('#inputPassword').val();
        var correctPassword = '${loginUser.pwd}';

        if (inputPassword === correctPassword) {
            $.ajax({
                type: "POST",
                url: "${pageContext.servletContext.contextPath}/siteout.us",
                data: { inputPassword: inputPassword },
                success: function(response) {
                    window.location.href = "${pageContext.servletContext.contextPath}/bhome.do";
                },
                error: function() {
                    alert("서버 오류가 발생하였습니다.");
                }
            });
        } else {
            alert('비밀번호가 일치하지 않습니다.');
        }
    });
});
</script>


</body>
</html>
