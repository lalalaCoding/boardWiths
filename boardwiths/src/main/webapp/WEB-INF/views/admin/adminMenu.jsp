<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
        /*메뉴바 스타일*/
        nav ul{list-style-type: none; line-height:100px; font-size:18px;}
        nav span:hover{background:skyblue; cursor:pointer;}
        nav span:hover{background:pink; cursor:pointer;}
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
     <c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/> 
     <ul>
         <li>
             <span onclick="location.href='${contextPath}/adminMain.ad'">관리자 메인</span> 
         </li>
         <li>
             <span onclick="location.href='${contextPath}/dailyInfo.ad'">일자별 이용량</span> 
         </li>
         <li>
             <span onclick="location.href='${contextPath}/userList.ad'">회원 목록</span> 
         </li>
         <li>
             <span onclick="location.href='${contextPath}/reportList.ad'">신고 목록</span> 
         </li>
         <li>
             <span onclick="location.href='${contextPath}/gameList.ad'">게임 목록</span> 
         </li>
         <li>
             <span onclick="location.href='${contextPath}/queryList.ad'">문의 목록</span> 
         </li>
     </ul>
     
     
    
     
        
     <script>
 		// 현재 페이지 로드시 관리자로 로그인이 되어 있지 않다면 로그인 페이지로 이동하도록 한다.
 		// 이 기능은 모든 관리자 페이지에서 공유되어야 하므로 조각코드로 삽입될 메뉴 페이지에 구현한다.
 		// 로그인된 정보가 있을 때 관리자인지 여부를 확인해야 하므로 조건식의 위치는 다음과 같이 지정한다.
	  	/* window.onload = () => {
	  		if('${loginUser}' == '' || '${loginUser.isManager}' != 'Y') {
	  			alert('로그인 후 이용해주세요.');
	  			location.href="${contextPath}/loginView.do";
	  		}
	  	} */
 	</script>
</body>
</html>