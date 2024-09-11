<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<c:set var="selCategory" value="${ param.category }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${ contextPath }/resources/css/boardDetail.css">
	<jsp:include page="../common/navbar.jsp"/>
    </style>
</head>
<body>
	<div class="container d-flex m-auto" style="width: 1440px;">
	    <div class="d-block p-3 text-bg-dark text-center" style="width: 240px;">
			<span class="d-block fs-4">
			Boardwiths
			</span>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item">
					<a href="list.bo?category=1" class="nav-link text-white w-100 mb-1">공지사항</a>
				</li>
				<hr>
				
				<li>
					<a href="list.bo?category=2,3" class="nav-link text-white w-100 mb-1">구매/판매 전체보기</a>
					<ul class="nav flex-column ms-3">
						<li>
							<a href="list.bo?category=2" class="nav-link text-white w-100 mb-1">- 구매게시판</a>
						</li>
						<li>
							<a href="list.bo?category=3" class="nav-link text-white w-100 mb-1">- 판매게시판</a>
						</li>
					</ul>
				</li>
			
				<li>
					<a href="list.bo?category=4,5" class="nav-link text-white w-100 mb-1">매칭/후기 전체보기</a>
					<ul class="nav flex-column ms-3">
						<li>
							<a href="list.bo?category=4" class="nav-link text-white w-100 mb-1">- 매칭게시판</a>
						</li>
						<li>
							<a href="list.bo?category=5" class="nav-link text-white w-100 mb-1">- 후기게시판</a>
						</li>
					</ul>
				</li>
				
				<hr>
				<li>
					<a href="list.bo?category=6" class="nav-link text-white w-100 mb-1">문의게시판</a>
				</li>
			</ul>
	        <hr>
	    </div>
	
	    <div class="d-inline-block p-3 text-bg-light flex-grow-1 text-align-center" style="width: 1100px;">
	    	
		    <!-- 아티클 탑 버튼 -->
		    <div class="container d-flex justify-content-between mb-3">
	        	<!--  게시판 표시 -->
	        	<a class="d-flex text-black text-decoration-none fw-bold fs-5" href="${ contextPath }/list.bo?category=${ b.category }">
					<c:choose>
						<c:when test="${ b.category eq 1 }">공지사항 ></c:when>
						<c:when test="${ b.category eq 2 }">구매 게시판 ></c:when>
						<c:when test="${ b.category eq 3 }">판매 게시판 ></c:when>
						<c:when test="${ b.category eq 4 }">매칭 게시판 ></c:when>
						<c:when test="${ b.category eq 5 }">후기 게시판 ></c:when>
						<c:when test="${ b.category eq 6 }">문의 게시판 ></c:when>
					</c:choose>
				</a>
			    <div>
				    <button id="prev" type="button" class="btn btn-secondary">▽ 이전 글</button>
				    <button id="next" type="button" class="btn btn-secondary">다음 글 △</button>
				    <button id="toTheList" type="button" class="btn btn-secondary">목록으로</button>
			    </div>
		    </div>
			<form class="needs-validation" method="POST" id="detailForm">
				<input type="hidden" value="${ b.boardNo }" name="boardNo"/>
				<input type="hidden" value="${ page }" name="page"/>
				<input type="hidden" value="${ b.category }" name="category"/>
			    <div class="bg-white p-3">
				    <!-- 아티클 타이틀 -->
				    <div class="fs-4 p-3">${ b.title }</div>
				    <!-- 유저 인포 -->
					<input type="hidden" value="${ b.usersNo }" name="usersNo"/>
				    <div class="fs-5 p-3">
				    ${ b.nickname }
				    </div>
				    <hr/>
				    <!-- 컨텐츠 -->
				    <c:if test="${ b.category ne 1 and b.category ne 6}">
				    	<div class="container mb-2 d-flex justify-content-center">
				    		<div class="d-inline-block p-3 col-4">
				    			<img src="#" alt="게임 사진	"/>
				    		</div>
				    		<div class="d-inline-block bg-secondary text-white p-3 col-7">
				    		게임정보
				    		<hr/>
				    		게임이름 :<br/>
				    		제조사 :<br/>
				    		게임 장르 :<br/>
				    		게임 시간 :<br/>
				    		게임 난이도 :<br/>
				    		게임 인원 :<br/>
				    		</div>
				    	</div>
				    </c:if>
				    
				    <div class="d-inline-block fs-6 p-3" style="height: 500px">${ b.content }</div>
				   
				    <!-- 하단 버튼 박스 -->
				    <div class="mb-3">
				    	<c:if test="${ not empty loginUser and (loginUser.usersNo ne b.usersNo)}">
					    	<button class="btn btn-warning" type="button" id="ReportModal">신고하기</button>
						</c:if>
					    <c:if test="${ loginUser.usersNo eq b.usersNo}">
							<button class="btn btn-secondary" type="button" id="updateForm">글 수정</button>
							<button class="btn btn-danger" type="button" id="deleteModal">글 삭제</button>
						</c:if>
				    </div>
				    <!-- 댓글 -->
				    <div>
				    	<div class="input-group">
				    		<!-- 로그인했을때 -->
				    		<c:if test="${ loginUser ne null }">
								<span class="input-group-text">${ loginUser.nickname }</span>
									<textarea class="form-control" rows="3" id="commentsContent" style="resize: none;" placeholder="댓글을 남겨보세요."></textarea>
								<button class="btn btn-outline-success btn-lg" id="commentsSubmit" type="button" <c:if test="${ empty loginUser }">disabled</c:if>>작성하기</button>
							</c:if>
							<!-- 로그인안했을때 -->
							<c:if test="${ loginUser eq null }">
								<textarea class="form-control" rows="3" id="commentsContent" style="resize: none;" placeholder="비회원은 로그인 후에 댓글 작성이 가능합니다." disabled></textarea>
								<input id="commentsSubmit" type="hidden"></input>
							</c:if>
						</div>
						<br>
						<table class="table">
							<thead>
								<tr class="cursor-default">
									<th width="130px">작성자</th>
									<th>작성내용</th>
									<th width="130px">작성일자</th>
									<th width="130px">좋아요</th>
									<th width="65px"></th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach items="${ cList }" var="c">
									<tr>
										<td>${ c.nickname }</td>
										<td>${ c.comContent }</td>
										<td>${ c.comDate }</td>
										<td>${ commentsLikesMap[c.comNo] }</td>
										<td>
											<input type="hidden" value="${ c.comNo }" name="comNo">									
											<c:if test="${ c.usersNo eq loginUser.usersNo }">
												<span class="updel">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16"><path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/></svg>
												</span> 
												&nbsp;
												<span class="updel">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16"><path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/></svg>
												</span> 
											</c:if>
											<input type="hidden" value="${ c.comContent }" id="comContent">
										</td>
									</tr>
								</c:forEach>
							</tbody>
							
						</table>
				    </div>
			    </div>
			</form>
	    </div>
	</div>

    <!-- 삭제 모달창 -->
    <div class="modal fade" tabindex="-1" role="dialog" id="modalDelChoice">
		<div class="modal-dialog" role="document">
    		<div class="modal-content rounded-3 shadow">
      			<div class="modal-body p-4 text-center">
        			<h3 class="mb-0">정말로 삭제하시겠습니까?</h3>
        			<p class="mb-0 text-danger">삭제 후 게시글은 복구할 수 없습니다.</p>
      			</div>
      			<div class="modal-footer flex-nowrap p-0">
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="delete">
        				<strong>네</strong>
        			</button>
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	<!-- 신고 모달창 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="modalRepChoice">
		<div class="modal-dialog" role="document">
    		<div class="modal-content rounded-3 shadow">
      			<div class="modal-body p-4 text-center">
        			<h3 class="mb-0">"${ b.nickname }" <br/> 해당 유저를 신고합니다. <br/> 계속 하시겠습니까?</h3>
        			<p class="mb-0 text-danger">신고 후 취소는 불가능합니다.</p>
      			</div>
      			<div class="modal-footer flex-nowrap p-0">
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" data-bs-target="#modalRepReason" data-bs-toggle="modal" data-bs-dismiss="modal">
        				<strong class="text-danger">네</strong>
        			</button>
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
      			</div>
    		</div>
  		</div>
	</div>
	<div class="modal fade" tabindex="-1" role="dialog" id="modalRepReason" aria-hidden="true">
		<div class="modal-dialog" role="document">
    		<div class="modal-content rounded-3 shadow">
      			<div class="modal-body p-4">
        			<p class="mb-0">신고 사유를 작성해주세요.</p>
        			
        			<form id="reportForm">
        				<input type="hidden" value="${ b.boardNo }" name="reportBoard"/>
						<input type="hidden" value="${ b.usersNo }" name="reportReceiver"/>
						<input type="hidden" id="originalUrl" name="originalUrl"/>
        			<div class="mb-3">
				        <textarea class="form-control" id="reportMsg" name="reportMsg"></textarea>
			        </div>
			        </form>
			        
      			</div>
      			<div class="modal-footer flex-nowrap p-0">
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" id="reportUsers" data-bs-target="#modalRepConfirm" data-bs-toggle="modal" data-bs-dismiss="modal">
        				<strong class="text-danger">신고하기</strong>
        			</button>
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">취소하기</button>
      			</div>
    		</div>
  		</div>
	</div>
    
    <!-- 풋터 -->
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
</body>

<script>
window.onload = () => {
	const form = document.getElementById('detailForm');
	const rForm = document.getElementById('reportForm');
	
	
	if(document.getElementById('deleteModal') != null){
		document.getElementById('deleteModal').addEventListener('click', () => {
			$('#modalDelChoice').modal('show');
		});
	}
	
	if(document.getElementById('ReportModal') != null){
		document.getElementById('ReportModal').addEventListener('click', () => {
			$('#modalRepChoice').modal('show');
		});
	}
	
	document.getElementById('reportUsers').addEventListener('click', () => {
		const originalUrl = document.getElementById('originalUrl');
		originalUrl.value = window.location.href;
		rForm.action = '${contextPath}/reportUsers.us';
		rForm.method = "POST"
		rForm.submit();
	});
	
	document.getElementById('prev').addEventListener('click', () => {
		location.href='${contextPath}/selectBoard.bo?bNo=${b.boardNo - 1}&page=${page}';
	});
	
	document.getElementById('next').addEventListener('click', () => {
		if('${b.boardStatus}' == 'Y'){
			console.log("나올 게시글");
		} else {
			console.log("건너뛸 게시글");			
		}
	});
	
	document.getElementById('toTheList').addEventListener('click', () => {
		location.href='${contextPath}/list.bo?category=${category}&condition=${condition}&value=${value}&page=${page}';
	});
	
	//댓글 기능
	
	document.getElementById('commentsSubmit').addEventListener('click', () => {
		$.ajax({
			url:'${contextPath}/insertComments.bo',
			data: {comContent: document.getElementById('commentsContent').value, refBoardNo:${b.boardNo}, usersNo: '${loginUser.usersNo}', nickname:'${loginUser.nickname}'},
			dataType: 'json',
			// json 버전에 따라 백 또는 프론트에서 처리해야 되는 경우가 있으므로 일반적으로 둘 다 처리함
			success: data => {
				console.log(data);
				const tbody = document.querySelector('tbody');
				tbody.innerHTML='';
				
				for(const c of data){
					const tr = document.createElement('tr');
					
					const writerTd = document.createElement('td');
					writerTd.innerText = c.nickname;
					// json의 key명으로 들어감
					const contentTd = document.createElement('td');
					contentTd.innerText = c.comContent;
					const dateTd = document.createElement('td');
					dateTd.innerText = c.comDate;
					
					const iconTd = document.createElement('td');
					if(c.usersNo == '${loginUser.usersNo}') {
						iconTd.innerHTML = '<input type="hidden" value="' + c.nickname + '" name="usersNo"><span class="updel"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16"><path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/></svg></span> &nbsp <span class="updel"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16"><path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/></svg></span><input type="hidden" value="' + c.comContent + '" id="comContent">';
					}
					
					tr.append(writerTd);
					tr.append(contentTd);
					tr.append(dateTd);
					tr.append(iconTd);	
					
					tbody.append(tr);
					
				}
				
				document.getElementById('comContent').value='';
			},
			error: data => console.log(data)
		});
	});
	
	const tbody = document.querySelector('tbody');
	tbody.addEventListener('mouseover', (e) => {
		
		const eventTarget = e.target;
		const targetTagName = eventTarget.tagName.toLowerCase();
		switch(targetTagName){
		case 'span': case 'svg': case 'path':
			console.log(targetTagName);
			eventTarget.style.cursor = 'pointer';
			if(targetTagName == 'path'){
				eventTarget.setAttribute('fill','rgb(109, 179, 63)');
			} else {
				eventTarget.querySelector('path').setAttribute('fill','rgb(109, 179, 63)');
			}
		}
	});
	
	tbody.addEventListener('mouseout', (e) => {
		const eventTarget = e.target;
		const targetTagName = eventTarget.tagName.toLowerCase();
		switch(targetTagName){
		case 'span': case 'svg': case 'path':
			if(targetTagName == 'path'){
				eventTarget.setAttribute('fill','currentColor');
			} else {
				eventTarget.querySelector('path').setAttribute('fill','currentColor');
			}
		}
	});
	
	tbody.addEventListener('click', e => {
		const eventTarget = e.target;
		const targetTagName = eventTarget.tagName.toLowerCase();
		let targetSVG = null;
		switch(targetTagName){
		case 'span': targetSVG = eventTarget.children[0]; break;
		case 'svg': targetSVG = eventTarget; break;
		case 'path': targetSVG = eventTarget.parentElement; break;
		}
		
		const myTd = targetSVG.parentElement.parentElement;
		const comNo = myTd.children[0].value;
		const contentTd = myTd.parentElement.children[1];
		
		if(targetSVG != null) {
			if(targetSVG.className.baseVal.includes('pencil')){
				if(document.getElementsByClassName('bi-check-lg').length > 0){
					changePencilTrash();
				}
				
				contentTd.innerHTML = '<textarea rows="2" cols="30" style="resize:none">' + contentTd.innerText + '</textarea>';
				
				//check, x 표시
				myTd.children[1].innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16"><path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022"/></svg>';
				myTd.children[2].innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16"><path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/></svg>';
				
				
				
			} else if(targetSVG.className.baseVal.includes('trash')) {
				if(confirm('정말 삭제하시겠습니까?')){
						$.ajax({
						url: '${contextPath}/deleteComments.bo',
						data: {comNo: comNo},
						success: data => {
							if(data == 'success'){
								myTd.parentElement.remove();
							} else {
								alert('댓글 삭제 중 오류가 발생했습니다.');
							}
						},
						error: data => console.log(data)
					});
				}
			} else if(targetSVG.className.baseVal.includes('check')){
				$.ajax({
					url: "${contextPath}/updateComments.bo",
					data: {ComNo: comNo, comContent:contentTd.children[0].value},
					success: data => {
						console.log(data);
						if(data == 'success'){
							changePencilTrash(contentTd.children[0].value);
						} else {
							alert('댓글수정 중 오류가 발생했습니다.')
						}
					},
					error: data => console.log(data)
				});
				
			} else if(targetSVG.className.baseVal.includes('x')){
				changePencilTrash();
			}
		}
	});
}

const changePencilTrash = (type) => {
	const beforeCheck = document.getElementsByClassName('bi-check-lg')[0]; // check icon
	const beforeCheckSpan = beforeCheck.parentElement; // 이전에 있던 check icon을 감싸는 span
	const beforeXSpan = beforeCheckSpan.nextElementSibling; // 이전에 있던 check icon의 span의 다음 span = x의 span
	const beforeTd = beforeCheckSpan.parentElement; // check와 x를 감싸는 td
	const beforeId = beforeTd.children[0].value; // 이전에 클릭했던 댓글 번호
	const beforeContent = beforeTd.children[3].value; // 이전에 클릭했던 댓글 내용
	const beforeContentTd = beforeTd.parentElement.children[1]; // content가 들어가있는 Td
	
	
	//다시 pencil trash 넣기
	beforeCheckSpan.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16"><path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/></svg>';
	beforeXSpan.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16"><path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5M11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5"/></svg> ';

	if(type == undefined){
		beforeContentTd.innerHTML = beforeContent;
	} else {
		beforeContentTd.innerHTML = type;
		beforeTd.children[3].value = type;
	}
}
</script>
</html>
