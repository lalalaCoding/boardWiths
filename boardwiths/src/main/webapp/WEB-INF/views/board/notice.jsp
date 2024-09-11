<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>td:hover{cursor: pointer;}</style>
    <link rel="stylesheet" href="${ contextPath }/resources/css/boardList.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


    
</head>
<body>
    
        <header class="p-3 text-bg-white">
        <div class="container-fluid">
            <div class="d-flex flex-wrap align-items-center justify-content-between">
                <a href="${ contextPath }/home.do" class="d-flex align-items-left mb-2 mb-lg-0 text-black text-decoration-none">
                    <img class="d-flex align-items-left" src="${pageContext.request.contextPath}/resources/logo.png" width="350px" height="100px"/>
                </a>
                <div class="d-flex align-items-center">
                    <div class="text-end">
                        <button type="button" class="btn btn-primary">로그인</button>
                        <button type="button" class="btn btn-warning">회원가입</button>
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
			        <form action="list.bo" method="post">
			            <input type="hidden" name="category" value="1">
			            <button type="submit" class="nav-link text-white w-100">공지사항</button>
			        </form>
			    </li>
			    <li>
			        <form action="list.bo" method="post" style="display: inline;">
			            <input type="hidden" name="category" value="2">
			            <button type="submit" class="nav-link text-white w-100">구매게시판</button>
			        </form>
			    </li>
			    <li>
			        <form action="list.bo" method="post" style="display: inline;">
			            <input type="hidden" name="category" value="3">
			            <button type="submit" class="nav-link text-white w-100">판매게시판</button>
			        </form>
			    </li>
			    <li>
			        <form action="list.bo" method="post" style="display: inline;">
			            <input type="hidden" name="category" value="4">
			            <button type="submit" class="nav-link text-white w-100">매칭게시판</button>
			        </form>
			    </li>
			    <li>
			        <form action="list.bo" method="post" style="display: inline;">
			            <input type="hidden" name="category" value="5">
			            <button type="submit" class="nav-link text-white w-100">후기게시판</button>
			        </form>
			    </li>
			    <li>
			        <form action="list.bo" method="post" style="display: inline;">
			            <input type="hidden" name="category" value="6">
			            <button type="submit" class="nav-link text-white w-100">문의게시판</button>
			        </form>
			    </li>
			</ul>
	        <hr>
	    	</div>
            
            <div id="content" class="d-block p-3 text-bg-light" style="width: 1100px">
            <form action="insertNotice.bo" method="POST" enctype="multipart/form-data" id="boardForm">
                <div id="content1">
                	<b>공지사항 작성</b><br>
					<div class="row g-3 align-items-center">

						<div class="input-group mb-3">
						  <span class="input-group-text" id="inputGroup-sizing-default">공지사항 제목</span>
						  <input type="text" name="title" id="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
						</div>
					</div>
                </div>
                <hr>
                <div id="content2">
	
                	<div class="mb-3">
					  <label for="formFile" class="form-label">파일 첨부</label>
					  <input class="form-control" type="file" id="formFile" name="file">
					</div>
            	
                </div>
                <div id="content3">
                <hr>
                
                
   
                	
				   <div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">공지글 작성</label>
						<textarea class="form-control" id="addText" rows="3" name="content"></textarea>
					</div>
				    
				    <button type="submit" class="btn btn-primary">공지등록</button>
				    
                </div>
                </form>
                <hr>
            </div>
        </div>
        
       <div class="container-fluid">
        <footer class="py-3 my-4">
            <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
            </ul>
            <p class="text-center text-body-secondary">© 2024 Company, Inc</p>
        </footer>
    </div> 
    
    <script>
    $(document).ready(function() {
        $('#boardForm').submit(function(event) {
            // 유효성 검사를 위한 변수
            var isValid = true;

            // 제목 입력 검사
            var title = $('#title').val().trim();
            if (title === '') {
                $('#title').removeClass('is-valid').addClass('is-invalid');
                isValid = false;
            } else {
                $('#title').removeClass('is-invalid').addClass('is-valid');
            }

            // 내용 입력 검사
            var content = $('#addText').val().trim();
            if (content === '') {
                $('#addText').removeClass('is-valid').addClass('is-invalid');
                isValid = false;
            } else {
                $('#addText').removeClass('is-invalid').addClass('is-valid');
            }
            
            if (!isValid) {
                event.preventDefault(); // 제출 중단
                alert('모든필수입력 요소에 입력을 해주세요.');
            }
        });

        // 입력 필드에 포커스가 돌아왔을 때, 유효성 검사 후 초록색으로 테두리 변경
        $('#title, #addText').focusout(function() {
            var value = $(this).val().trim();
            if (value !== '') {
                $(this).removeClass('is-invalid').addClass('is-valid');
            } else {
                $(this).removeClass('is-valid').addClass('is-invalid');
            }
        });

      
    });
    </script>
    
</body>
</html>