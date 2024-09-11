<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>탈퇴 메시지 확인 페이지</title>
	<link href="${contextPath }/resources/css/leaveMsg.css" rel="stylesheet" type="text/css"/>
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
                <div>탈퇴메시지 확인</div>
            </div>
            <div id="admin_search"> <!-- 검색바 넣을 자리-->
                <div>공백</div>
                <div></div>
                <div></div>
                <div>공백</div>
            </div>
            <div id="admin_submit">
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div id="admin_list"> <!-- ul태그의 li태그 안에 span 때려박기-->
                <div></div>
                <ul class="summary_info">
                    <li>
                        <div>아이디</div>
                        <div><input type="text" name="id" id="id"/></div>
                    </li>
                    
                    <li>
                        <div>탈퇴일자</div>
                        <div><input type="text" name="leaveDate" id="leaveDate"/></div>
                    </li>

                    <li>
                        <div>사유</div>
                        <div>
                            <textarea name="leaveMsg" id="leaveMsg" readonly></textarea>
                        </div>
                    </li>
                </ul>
                <div></div>
            </div>
            <div id="pageButton"> <!-- 페이지 버튼 공간 -->
                <button>메인으로</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button>회원목록으로</button>
            </div>

        </div>
        <div class="blank">오른쪽</div>
    </div>
    <footer>나 푸터</footer>
</body>
</html>