<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일자별 요약 페이지</title>
	<link href="${contextPath }/resources/css/dailyInfo.css" rel="stylesheet" type="text/css"/>
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
	<header>나 헤더</header>
    <div id="mid">
        <div class="blank"><!-- 왼쪽 공백 --></div>
        <nav>
            <jsp:include page="adminMenu.jsp"/>        
        </nav>
        
        <div id="daily">
            <div id="admin_title">
                <div>
                	<i class="fa fa-quote-left text-primary" aria-hidden="true"></i>
                    <h3 class="bg-warning" style="display:inline;">일자별 이용량</h3>
                    <i class="fa fa-quote-right text-primary" aria-hidden="true"></i>
                </div>
            </div>
            <div id="admin_search" style="display: grid; grid-template-columns: 1fr 1000px 1fr; grid-template-rows: 100px;"> <!-- 검색바 넣을 자리-->
                <div><!-- 공백 --></div>
                <form method="get" action="${contextPath }/dailyInfoSearch.ad">
                    <label>
                    	<i class="fa fa-quote-left text-success" aria-hidden="true"></i>
                    	<span class="bg-success">날짜 선택</span>
                   		<i class="fa fa-quote-right text-success" aria-hidden="true"></i>
                   		&nbsp;
                   	</label>
                    <input type="date" class="form-control" name="beginDt" style="width:130px; height:37.6px; display:inline;"/>
                    - - - - - - - 
                    <input type="date" class="form-control" name="endDt" style="width:130px; height:37.6px; display:inline;"/>
                    &nbsp;&nbsp;
                    <button class="dailyInfoSearch btn btn-primary">조회하기</button>
                    &nbsp;&nbsp;
                	<button type="button" class="btn btn-primary dailyInfoSearch" name="btn" value="week">이번주</button>
                	&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary dailyInfoSearch" name="btn" value="month">이번달</button>
                    &nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" id="allListBtn">전체보기</button>
                </form>
                <div><!-- 공백 --></div>
            </div>
            <div id="admin_list"> 
                <div></div>
                <table class="table table-hover">
                    <thead>
	                    <tr>
	                        <th>일자</th>
	                        <th>방문자</th>
	                        <th>가입자 수</th>
	                        <th>새로운 거래 글 수</th>
	                        <th>새로운 소셜 글 수</th>
	                        <th>새로운 댓글 수</th>
	                        <th>신고 횟수</th>
	                    </tr>
                    </thead>
                    
                    <tbody>
	                    <c:forEach items="${result }" var="r">
	                    	<tr>
		                        <td>${r.daily }</td>
		                        <td>${r.usersCount }</td>
		                        <td>${r.enrollNo }</td>
		                        <td>${r.newMarketNo }</td>
		                        <td>${r.newMatchingNo }</td>
		                        <td>${r.newCommentNo }</td>
		                        <td>${r.newReportNo }</td>
		                    </tr>
	                    </c:forEach>
	                    
	                    <c:if test="${result.size() < pi.boardLimit }">
	                    	<c:forEach begin="${result.size()+1 }" end="${pi.boardLimit }">
		                    	<tr>
			                        <td>-</td>
			                        <td>-</td>
			                        <td>-</td>
			                        <td>-</td>
			                        <td>-</td>
			                        <td>-</td>
			                        <td>-</td>
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
                        	<!-- 이전버튼 -->
                        	<c:url var="goBack" value="${loc }">
                        		<c:param name="page" value="${pi.currentPage - 1 }"/>
                        		<c:if test="${empty term}">
                        			<c:param name="beginDt" value="${beginDt }"/>
                        			<c:param name="endDt" value="${endDt }"/>
                        		</c:if>
                        		<c:if test="${!empty term }">
                        			<c:param name="term" value="${term }"/>
                        		</c:if>
                        	</c:url>
                        	<c:if test="${pi.currentPage <= 1}">
                        		<li class="page-item disabled">
	                            	<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            	</li>
                        	</c:if>
                        	<c:if test="${pi.currentPage > 1}">
                        		<li class="page-item">
	                            	<a class="page-link" href="${goBack }" tabindex="-1" aria-disabled="true">Previous</a>
                            	</li>
                        	</c:if>
                        
                        <c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
                        	<c:url var="goNum" value="${loc }">
                        		<c:param name="page" value="${p }"/>
                        		<!-- 파라미터 같이 넘겨야함 -->
                        		<c:if test="${term == null}">
                        			<c:param name="beginDt" value="${beginDt }"/>
                        			<c:param name="endDt" value="${endDt }"/>
                        		</c:if>
                        		<c:if test="${term != null }">
                        			<c:param name="term" value="${term }"/>
                        		</c:if>
                        	</c:url>
                        	<c:if test="${pi.currentPage == p }">
		                        <li class="page-item active">
		                        	<a class="page-link" href="${goNum }">${p }</a>
		                       	</li>
                        	</c:if>
                        	<c:if test="${pi.currentPage != p }">
		                        <li class="page-item">
		                        	<a class="page-link" href="${goNum }">${p }</a>
		                       	</li>
                        	</c:if>
                        </c:forEach>
                        
                       
                        	<!-- 다음 버튼 -->
                        	<c:url var="goNext" value="${loc }">
                        		<c:param name="page" value="${pi.currentPage + 1 }"/>
                        		<c:if test="${term == null}">
                        			<c:param name="beginDt" value="${beginDt }"/>
                        			<c:param name="endDt" value="${endDt }"/>
                        		</c:if>
                        		<c:if test="${term != null }">
                        			<c:param name="term" value="${term }"/>
                        		</c:if>
                        	</c:url>
                        	<c:if test="${pi.currentPage >= pi.maxPage }">
                        		<li class="page-item disabled">
                        			<a class="page-link" href="#" aria-disabled="true">Next</a>
                       			</li>
                        	</c:if>
                        	<c:if test="${pi.currentPage < pi.maxPage }">
                        		<li class="page-item">
                        			<a class="page-link" href="${goNext }" aria-disabled="true">Next</a>
                        		</li>
                        	</c:if>
                       
                    </ul>
                </div>
                <div></div>
            </div>

        </div>
        <div class="blank"><!-- 오른쪽 공백 --></div>
    </div>
    <footer>나 푸터</footer>
    
    <!-- Modal -->
    <div class="modal fade" id="dailySearchModal" tabindex="-1" aria-labelledby="dailySearchModalLabel" aria-hidden="true">
        <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	            <h1 class="modal-title fs-5" id="dailySearchModalLabel">검색 조건 확인</h1>
	            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
	            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
					 	<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
					</svg>
	            </button>
	            </div>
	            <div class="modal-body">
	            	시작 날짜와 종료 날짜를 모두 선택하셔야 합니다.
	            </div>
	            <div class="modal-footer">
	            <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
	            <button type="button" class="btn btn-primary" id="dailySearchModalCommit" data-bs-dismiss="modal">확인</button>
	            </div>
	        </div>
        </div>
    </div>
    
    
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <script>
    // 조회 버튼들을 클릭할 때 요청url로 이동하는 로직
    // 조회에는 날짜 기간 지정과 이번주, 이번달의 3종류가 존재하는데 동적 SQL로 처리할 수 있기 때문에 같은 요청 url을 공유하는 것이 좋겠음.
    	window.onload = () => {
    		const beginDt = document.getElementsByName('beginDt')[0];
    		const endDt = document.getElementsByName('endDt')[0];
    		const dt = document.getElementsByClassName('dailyInfoSearch')[0];
    		
    		dt.addEventListener('click', e => {
    			if(beginDt.value == '' || endDt.value == '') {
    				$('#dailySearchModal').modal('show');
    				e.preventDefault();
    			}
    			
    		})
    		
    		const btnList = document.getElementsByName('btn');
    		for(const btn of btnList) {
    			btn.addEventListener('click', function() {
    				const weekMonth = this.value;
    				location.href="${contextPath}/dailyInfoSearch.ad?term=" + weekMonth;
    			})
    		}
    		
    		document.querySelector('#allListBtn').addEventListener('click', () => {
    			console.log('클릭')
    		})
    		
    		
    		
    	}
    </script>
</body>
</html>