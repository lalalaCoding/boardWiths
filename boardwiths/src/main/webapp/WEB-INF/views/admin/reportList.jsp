<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>신고 목록 페이지</title>
	<link href="${contextPath }/resources/css/reportList.css" rel="stylesheet" type="text/css"/>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
		.card-icon-border-large {
            width: 50px;
            height: 50px;
            margin: -1.53rem auto 0px;
            text-align: center;
            background-color: rgb(255, 255, 255);
            border: 3px solid;
            border-radius: 50%;
            font-size: 0.94rem;
            line-height: 45px;
            color: rgb(102, 102, 102);
		}
		.text-primary { color: rgb(240, 194, 75) !important;}
	</style>
</head>
<body>
	<div id="header">나 헤더</div>
    <div id="mid">
        <div class="blank">왼쪽</div>
        <nav>
            <jsp:include page="adminMenu.jsp"/>         
        </nav>
        <div id="adminContent">
            <div id="admin_title">
                <div>
                	<i class="fa fa-quote-left text-primary" aria-hidden="true"></i>
                    <h3 class="bg-warning" style="display:inline;">신고 목록</h3>
                    <i class="fa fa-quote-right text-primary" aria-hidden="true"></i>
                </div>
            </div>
            <div id="admin_search" style="display: grid; grid-template-columns: 1fr 1000px 1fr; grid-template-rows: 100px;"> <!-- 검색바 넣을 자리-->
                <div><!-- 공백 --></div>
                <form autocomplete="off" action="${contextPath }/searchReport.ad" method="post" id="reportForm">
                   	<select name="sel" class="form-select" style="height:38px;">
                   		<option value="reportSender">신고자</option>
                   		<option value="reportReceiver">신고대상</option>
                   	</select> 
                   	&nbsp;&nbsp;
                   	<input type="text" name="targetId" class="form-control" style="display:inline; width:150px; height:38px;"/>
                   	&nbsp;&nbsp;
                    <label>
                    	<i class="fa fa-quote-left text-success" aria-hidden="true"></i>
                    	<span class="bg-success">날짜</span>
                   		<i class="fa fa-quote-right text-success" aria-hidden="true"></i>
                   	</label>
                   	&nbsp;&nbsp;
                    <input type="date" name="beginDt" class="form-control" style="display:inline; width:150px; height:38px;"/> 
                    ----- 
                    <input type="date" name="endDt" class="form-control" style="display:inline; width:150px; height:38px;"/>
                	<button id="searchBtn" class="btn btn-primary" style="width:90px; height:38px;">조회하기</button>
                	<button type="button" class="btn btn-primary" id="resolvedBtn" onclick="location.href='${contextPath}/reportList.ad'" style="width:90px; height:38px;">전체보기</button>
                    <button type="button" class="btn btn-danger" id="resolvedBtn" onclick="location.href='${contextPath}/noConfirmReport.ad'" style="width:90px; height:38px;">미처리</button>
                </form>
                <div><!-- 공백 --></div>
            </div>
            <div id="admin_submit">
                <div></div>
                <div>
                    
                </div>
                <div></div>
            </div>
           <div id="admin_list"> 
                <div></div>
                <table class="table table-hover">
                	<thead>
	                    <tr>
	                        <th>날짜</th>
	                        <th>신고자</th>
	                        <th>신고대상</th>
	                        <th>신고 사유</th>
	                        <th>게시글</th>
	                        <th>신고대상정보</th>
	                        <th>컨펌</th>
	                    </tr>
                    </thead>
                    <tbody>
	                    <c:forEach items="${list }" var="r">
	                    	<tr>
	                    		<td><fmt:formatDate value="${r.reportDate }" dateStyle="long"/></td>
	                    		<td>${r.senderId }</td>
	                    		<td>${r.receiverId }</td>
	                    		<td><!-- 신고사유 -->
	                    			<input type="hidden" name="reportMsg" class="reportMsg" value="${r.reportMsg }"/>
	                    			<button type="button" class="btn goMsgBtn btn-info" style="width: 80px;">확인</button>
	                   			</td>
	                    		<td><!-- 신고게시글 -->
	                    			<input type="hidden" name="reportBoard" class="reportBoard" value="${r.reportBoard }"/>
	                    			<button type="button" class="btn goBoardBtn btn-info" style="width: 80px;">확인</button>
                    			</td>
	                    		<td><!-- 신고대상 정보 -->
	                    			<input type="hidden" name="reportReceiver" class="reportReceiver" value="${r.reportReceiver }"/>
	                    			<button type="button" class="btn goInfoBtn btn-info" style="width: 80px;">Info</button>
                    			</td>
	                    		<td><!-- 컨펌 -->
	                    			<input type="hidden" name="reportNo" value="${r.reportNo }"/>
	                    			<button type="button" class="btn confirmBtn ${r.reportConfirm == 'Y' ? 'btn-warning' : 'btn-secondary'}" style="width:50px;">Y</button>
                            		&nbsp;&nbsp;
                            		<button type="button" class="btn confirmBtn ${r.reportConfirm == 'N' ? 'btn-warning' : 'btn-secondary'}" style="width:50px;">N</button>
                    			</td>
	                    	</tr>
	                    </c:forEach>
	                    
	                    <c:if test="${list.size() < pi.boardLimit }">
	                    	<c:forEach begin="${list.size() + 1 }" end="${pi.boardLimit }">
	                    		<tr>
		                    		<td>0000년 00월 00일</td>
		                    		<td>#</td>
		                    		<td>#</td>
		                    		<td>
		                    			<button type="button" class="btn btn-secondary" style="width: 80px;">확인</button>
		                    		</td>
		                    		<td>
		                    			<button type="button" class="btn btn-secondary" style="width: 80px;">확인</button>
		                    		</td>
		                    		<td>
		                    			<button type="button" class="btn btn-secondary" style="width: 80px;">Info</button>
		                    		</td>
		                    		<td>
		                    			<!-- <button class="leave">-</button> -->
	                    				<button type="button" class="btn btn-secondary" style="width:50px;">Y</button>
	                            		&nbsp;&nbsp;
	                            		<button type="button" class="btn btn-secondary" style="width:50px;">N</button>
		                    		</td>
	                    		</tr>
	                    	</c:forEach>
	                    </c:if>
                   </tbody>
                </table>
                <div></div>
            </div>
            
            <div id="pageButton"> <!-- 페이지 버튼 공간 -->
                <div></div>
                <div class="pt-3">
                    <ul class="pagination justify-content-end mb-0">
                        <c:if test="${pi.currentPage <= 1 }">
                        	<li class="page-item disabled">
                            	<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        	</li>
                        </c:if>
                        <c:if test="${pi.currentPage > 1 }">
                        	<c:url var="goBack" value="${loc }">
                        		<c:param name="page" value="${pi.currentPage - 1 }"/>
                        		<c:if test="${!empty op }">
                        			<c:param name="id" value="${op.id }"/>
                        			<c:param name="grade" value="${op.grade }"/>
                        			<c:param name="usersStatus" value="${op.usersStatus }"/>
                        			<c:param name="beginDt" value="${op.beginDt }"/>
                        			<c:param name="endDt" value="${op.endDt }"/>
                        		</c:if>
                        	</c:url>
                        	<li class="page-item">
                            	<a class="page-link" href="${goBack }" tabindex="-1" aria-disabled="true">Previous</a>
                        	</li>
                        </c:if>
                        
                        <c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
                        	<c:if test="${pi.currentPage == p }">
                        		 <li class="page-item active"><a class="page-link" href="#">${p }</a></li>
                        	</c:if>
                        	<c:if test="${pi.currentPage != p }">
                        		<c:url var="goNum" value="${loc }">
                        			<c:param name="page" value="${p }"/>
                        			<c:if test="${!empty op }">
	                        			<c:param name="id" value="${op.id }"/>
	                        			<c:param name="grade" value="${op.grade }"/>
	                        			<c:param name="usersStatus" value="${op.usersStatus }"/>
	                        			<c:param name="beginDt" value="${op.beginDt }"/>
	                        			<c:param name="endDt" value="${op.endDt }"/>
	                        		</c:if>
                        		</c:url>
                        		<li class="page-item"><a class="page-link" href="${goNum }">${p }</a></li>
                        	</c:if>
                        </c:forEach>
                        
                        <c:if test="${pi.currentPage >= pi.maxPage }">
                        	<li class="page-item disabled">
                            	<a class="page-link" href="#">Next</a>
                        	</li>
                        </c:if>
                       	<c:if test="${pi.currentPage < pi.maxPage }">
                       		<c:url var="goNext" value="${loc }">
                       			<c:param name="page" value="${pi.currentPage + 1 }"/>
                       			<c:if test="${!empty op }">
                        			<c:param name="id" value="${op.id }"/>
                        			<c:param name="grade" value="${op.grade }"/>
                        			<c:param name="usersStatus" value="${op.usersStatus }"/>
                        			<c:param name="beginDt" value="${op.beginDt }"/>
                        			<c:param name="endDt" value="${op.endDt }"/>
                        		</c:if>
                       		</c:url>
                       		<li class="page-item">
                            	<a class="page-link" href="${goNext }">Next</a>
                        	</li>
                       	</c:if>
                    </ul>
                </div>
                <div></div>
            </div>
        </div>
        <div class="blank">오른쪽</div>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
	        <div class="modal-content">
	            <div class="modal-header">
	            <h1 class="modal-title fs-5" id="reportModalLabel">신고 메시지</h1>
	            <button type="button" class="btn-close" id="reportModalClose" data-bs-dismiss="modal" aria-label="Close">
	            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
					 	<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
					</svg>
	            </button>
	            </div>
	            <div class="modal-body" id="reportModalBody">
	            	<!-- 신고 메시지 출력 -->
	            </div>
	            <div class="modal-footer">
	            <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
	            <button type="button" class="btn btn-primary" id="reportModalCommit" data-bs-dismiss="modal">확인</button>
	            </div>
	        </div>
        </div>
    </div>
    
    <footer>나 푸터</footer>
    
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        window.onload = () => {
    		const label = document.querySelector('#reportModalLabel');
        	const modalBody = document.querySelector('#reportModalBody');
        	
        	const form = document.querySelector('#reportForm');
        	
        	document.querySelector('#searchBtn').addEventListener('click', () => {
        		const select = document.getElementsByName('sel')[0].value;
        		const targetNickName = document.getElementsByName('targetId')[0].value;
        		const beginDt = document.getElementsByName('beginDt')[0].value;
        		const endDt = document.getElementsByName('endDt')[0].value;
        		
        		if(beginDt != '' && endDt == '') {
        			label.innerText = '검색조건 확인';
        			modalBody.innerText ='날짜 선택은 시작 날짜와 종료날짜가 모두 필요합니다.';
        			$('#reportModal').modal('show');
        		} else if(beginDt == '' && endDt != ''){
        			label.innerText = '검색조건 확인';
        			modalBody.innerText ='날짜 선택은 시작 날짜와 종료날짜가 모두 필요합니다.';
        			$('#reportModal').modal('show');
        		} else {
        			form.submit();
        		}
        	})
        	
        	
        	const msgBtnList = document.querySelectorAll('.goMsgBtn');
        	for(const m of msgBtnList) {
        		m.addEventListener('click', function() {
        			const msg = this.previousElementSibling.value;
        			modalBody.innerText = msg;
        			label.innerText = '신고 메시지';
        			$('#reportModal').modal('show');
        		})
        	}
        	
        	// 모달박스 닫기 기능
        	document.querySelector('#reportModalCommit').addEventListener('click', () => {
        		$('#reportModal').modal('hide');
        	})
        	document.querySelector('#reportModalClose').addEventListener('click', () => {
        		$('#reportModal').modal('hide');
        	})
        	
        	// 신고글이 작성된 게시글 상세보기로 이동
        	const boardBtnList = document.querySelectorAll('.goBoardBtn');
        	for(const b of boardBtnList) {
        		b.addEventListener('click', function() { // selectBoard.bo
        			const refBoardNo = this.previousElementSibling.value;
        			location.href='${contextPath}/selectBoard.bo?bNo='+refBoardNo;
        		})
        	}
        	
        	// 신고대상 정보 보기
        	const infoBtnList = document.querySelectorAll('.goInfoBtn');
        	for(const i of infoBtnList) {
        		i.addEventListener('click', function() {
        			const reportReceiver = this.previousElementSibling.value;
        			//회원정보에 대한 요청 URL : userInfo.ad?usersNo=1&page=3
        			location.href='${contextPath}/userInfo.ad?usersNo='+reportReceiver;
        		})
        	}
        	
        	// 컨펌여부 비동기 처리
        	const confirmList = document.querySelectorAll('.confirmBtn');
        	for(const c of confirmList) {
        		c.addEventListener('click', function() {
        			if(this.className.includes('secondary')) {
        				// 회색버튼 클릭한 경우 컨펌상태값을 변경해야 한다.
        				const reportNo = this.parentElement.children[0].value;
						const changeConfirm = this.innerText;
        				$.ajax({
        					url: '${contextPath}/updateReport.ad',
        					data: {reportNo: reportNo, reportConfirm: changeConfirm},
        					success: data =>{
        						if(data == 'success') {
        							const btnList = this.parentElement.querySelectorAll('button');
        							
        							for(const b of btnList) {
        								if(b.innerText != changeConfirm) {
        									b.classList.add('btn-secondary');
                							b.classList.remove('btn-warning');
        								} else {
        									b.classList.remove('btn-secondary');
                							b.classList.add('btn-warning');
        								}
        							}
        						} else {
        							alert('컨펌 변경 중 오류 발생');
        						}
        					},
        					error: data => alert('에러 발생'),
        				})
        				
        				
        				
        				
        				
        				
        			}
        		})
        	}
        	
        }


    </script>
</body>
</html>