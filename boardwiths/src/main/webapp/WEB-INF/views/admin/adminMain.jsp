<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 메인 페이지</title>
	<link href="${contextPath }/resources/css/adminMain.css" rel="stylesheet" type="text/css"/>
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
	<header>header</header>
    <div id="mid">
        <div class="blank"><!-- 왼쪽 공백 --></div>
        
        <nav><jsp:include page="adminMenu.jsp"/></nav>

        <div id="content">
            <div class="leftContent">
                <div class="contentTitle">
                	<i class="fa fa-quote-left text-primary" aria-hidden="true"></i>
                    <span class="bg-warning">일자별 요약</span>
                    <i class="fa fa-quote-right text-primary" aria-hidden="true"></i>
               	</div>
                <div class="tableContainer" id="test">
                    <div></div>
                    <table class="table table-hover align-middle">
                        <thead>
	                        <tr>
	                            <th class="align-middle">일자</th>
	                            <th class="align-middle">방문자</th>
	                            <th class="align-middle">가입자 수</th>
	                            <th class="align-middle">게시글 수</th>
	                            <th class="align-middle">신고횟수</th>
	                        </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${dList }" var="d">
		                        <tr>
		                            <td class="align-middle">${d.daily }</td>
		                            <td class="align-middle">${d.usersCount }</td>
		                            <td class="align-middle">${d.enrollNo }</td>
		                            <td class="align-middle">${d.newMarketNo + d.newMatchingNo }</td>
		                            <td class="align-middle">${d.newReportNo }</td>
		                        </tr>
	                        </c:forEach>
                        </tbody>
                    </table>
                    <div></div>
                </div>
            </div>

            <div>
                <div class="contentTitle">
                	<i class="fa fa-quote-left text-primary" aria-hidden="true"></i>
                    <span class="bg-warning">회원 목록</span>
                    <i class="fa fa-quote-right text-primary" aria-hidden="true"></i>
                </div>
                <div class="tableContainer">
                    <div></div>
                    <table class="table table-hover">
                        <thead>
	                        <tr>
	                            <th class="align-middle">회원번호</th>
	                            <th class="align-middle">아이디</th>
	                            <th class="align-middle">이름</th>
	                            <th class="align-middle">신고횟수</th> 
	                            <th class="align-middle">회원상태</th>
	                        </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${uList }" var="u">
		                        <tr>
		                            <td class="align-middle">${u.usersNo }</td>
		                            <td class="align-middle">${u.id }</td>
		                            <td class="align-middle">${fn:substring(u.usersName, 0, 1) }****</td>
		                            <td class="align-middle">${u.reportCount }</td>
		                            <td class="align-middle">
		                            	<c:if test="${u.usersStatus == 'Y' }">
		                            		<button class="btn btn-warning">${u.usersStatus }</button>
	                            		</c:if>
	                            		<c:if test="${u.usersStatus == 'N' }">
		                            		<button class="btn btn-danger">${u.usersStatus }</button>
	                            		</c:if>
	                            	</td>
		                        </tr>
	                        </c:forEach>
                        </tbody>
                    </table>
                    <div></div>
                </div>
            </div>
            
            <div class="leftContent">
                <div class="contentTitle">
                	<i class="fa fa-quote-left text-primary" aria-hidden="true"></i>
                    <span class="bg-warning">신고 목록</span>
                    <i class="fa fa-quote-right text-primary" aria-hidden="true"></i>
                </div>
                <div class="tableContainer">
                    <div></div>
                    <table class="table table-hover">
                    	<thead>
	                        <tr>
	                            <th class="align-middle">신고일자</th>
	                            <th class="align-middle">신고자</th>
	                            <th class="align-middle">신고대상</th>
	                            <th class="align-middle">게시글</th>
	                            <th class="align-middle">신고컨펌</th>
	                        </tr>
                    	</thead>
                    	<tbody>
                    		<c:forEach items="${rList }" var="r">
		                        <tr>
		                            <td class="align-middle">${r.reportDate }</td>
		                            <td class="align-middle">${r.senderId }</td>
		                            <td class="align-middle">${r.receiverId }</td>
		                            <td class="align-middle">
		                            	<input type="hidden" name="reportBoard" class="reportBoard" value="${r.reportBoard }"/>
		                            	<button type="button" class="btn goBoardBtn btn-info" style="width: 80px;">확인</button>
	                            	</td>
		                            <td class="align-middle">
		                            	<c:if test="${r.reportConfirm == 'Y' }">
		                            		<button type="button" class="btn confirmBtn btn-warning" style="width:50px;">Y</button>
		                            	</c:if>
		                    			<c:if test="${r.reportConfirm == 'N' }">
		                            		<button type="button" class="btn confirmBtn btn-danger" style="width:50px;">N</button>
		                            	</c:if>
		                            </td>
		                        </tr>
	                        </c:forEach>
                        </tbody>
                    </table>
                    <div></div>
                </div>
            </div>
            
            <div>
                <div class="contentTitle">
                	<i class="fa fa-quote-left text-primary" aria-hidden="true"></i>
                    <span class="bg-warning">게임 목록</span>
                    <i class="fa fa-quote-right text-primary" aria-hidden="true"></i>
                </div>
                <div class="tableContainer">
                    <div></div>
                    <table class="table table-hover">
                        <thead>
	                        <tr>
	                            <th class="align-middle">게임명</th>
	                            <th class="align-middle">소요시간</th>
	                            <th class="align-middle">게임난이도</th>
	                            <th class="align-middle">구매|판매</th>
	                            <th class="align-middle">매칭|후기</th>
	                        </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${gList }" var="g">
		                        <tr>
		                            <td class="align-middle">${g.gameName }</td>
		                            <td class="align-middle">${g.gamePlayTime }</td>
		                            <td class="align-middle">${g.gameLevel }</td>
		                            <td class="align-middle">${g.marketCount }</td>
		                            <td class="align-middle">${g.matchingCount }</td>
		                        </tr>
	                        </c:forEach>
                        </tbody>
                    </table>
                    <div></div>
                </div>
            </div>
        </div>
       
        <div class="blank"><!-- 오른쪽 공백 --></div>
    </div>
    <footer>footer</footer>
    
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    	window.onload = () => {
    		const boardBtnList = document.querySelectorAll('.goBoardBtn');
    		for(const b of boardBtnList) {
    			b.addEventListener('click', function() {
    				const bNo = this.previousElementSibling.value;
    				location.href='${contextPath}/selectBoard.bo?bNo=' + bNo;
    			})
    		}
    		
    		
    		
    		
    		
    		
    		
    		
    	}	   
    
    </script>
    
    
    
    
    
    
</body>
</html>