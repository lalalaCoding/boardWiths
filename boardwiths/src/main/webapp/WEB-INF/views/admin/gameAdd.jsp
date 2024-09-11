<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게임 추가 페이지</title>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath }/resources/css/gameAdd.css" rel="stylesheet" type="text/css"/>
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
        <div id="adminContainer">
            <div id="admin_title">
                <div>
                	<i class="fa fa-quote-left text-primary" aria-hidden="true"></i>
                    <h3 class="bg-warning" style="display:inline;">게임정보 추가</h3>
                    <i class="fa fa-quote-right text-primary" aria-hidden="true"></i>
                </div>
            </div>
            <div id="admin_search" style="display: grid; grid-template-columns: 1fr 1000px 1fr;"> <!-- 검색바 넣을 자리-->
                <div><!-- 공백 --></div>
                <div id="tempSave" style="display:grid; grid-template-columns: 200px 200px 200px 200px 200px; grid-template-rows:60px;">
                	<div>
                		<img class="tempImg" style="width:60px; height:60px"/>
			            <span></span>
                	</div>
                	
                	<div>
                		<img class="tempImg" style="width:60px; height:60px"/>
			            <span></span>
                	</div>
                	
                	<div style="text-align:left;">
                		<img class="tempImg" style="width:60px; height:60px"/>
			            <span></span>
                	</div>
                	
                	<div>
                		<img class="tempImg" style="width:60px; height:60px"/>
			            <span></span>
                	</div>
                	
                	<div>
                		<img class="tempImg" style="width:60px; height:60px"/>
			            <span></span>
                	</div>
                </div>
                <div><!-- 공백 --></div>
            </div>
            <div id="admin_submit">
                <div></div>
                <div></div>
                <div></div>
            </div> 
            <div id="admin_list"> <!-- ul태그의 li태그 안에 span 때려박기-->
                <div></div>
            	<form id="gameForm" action="${contextPath }/insertGame.ad" method="post" enctype="multipart/form-data">
			        <table class="table align-middle" style="height:100%;">
			            <tbody>
			                <tr>
			                    <td class="align-middle">게임 이름</td>
			                    <td class="align-middle">
			                        <input type="text" class="gameName form-control" name="gameName" style="display:inline; width:300px;"/>
			                        <input type="text" class="gameName form-control" name="gameName" style="display:none; width:300px;"/>
			                        <input type="text" class="gameName form-control" name="gameName" style="display:none; width:300px;"/>
			                        <input type="text" class="gameName form-control" name="gameName" style="display:none; width:300px;"/>
			                        <input type="text" class="gameName form-control" name="gameName" style="display:none; width:300px;"/>
			                        &nbsp;&nbsp;&nbsp;
			                        <span class="badge"></span>
			                    </td>
			                </tr>
			                <tr>
			                    <td class="align-middle">제조사</td>
			                    <td class="align-middle">
			                        <input type="text" name="gameCompany" class="gameCompany form-control" style="display:inline; width:300px;"/>
			                        <input type="text" name="gameCompany" class="gameCompany form-control" style="display:none; width:300px;"/>
			                        <input type="text" name="gameCompany" class="gameCompany form-control" style="display:none; width:300px;"/>
			                        <input type="text" name="gameCompany" class="gameCompany form-control" style="display:none; width:300px;"/>
			                        <input type="text" name="gameCompany" class="gameCompany form-control" style="display:none; width:300px;"/>
			                    </td>
			                </tr>
			                <tr>
			                    <td class="align-middle">게임 장르</td>
			                    <td class="align-middle">
			                        <select name="genre" class="gameInfo genre form-select" style="display:inline; width:200px; height:38px;">
			                            <option value="-----/">-----</option>
			                            <option value="카드게임/">카드게임</option>
			                            <option value="파티게임/">파티게임</option>
			                            <option value="블러핑/">블러핑</option>
			                            <option value="가족게임/">가족게임</option>
			                            <option value="어린이게임/">어린이게임</option>
			                            <option value="추상게임/">추상게임</option>
			                            <option value="전략게임/">전략게임</option>
			                        </select>
			                        &nbsp;&nbsp;
			                        <select name="genre" class="gameInfo genre form-select" style="display:inline; width:200px; height:38px;">
			                            <option value="-----/">-----</option>
			                            <option value="카드게임/">카드게임</option>
			                            <option value="파티게임/">파티게임</option>
			                            <option value="블러핑/">블러핑</option>
			                            <option value="가족게임/">가족게임</option>
			                            <option value="어린이게임/">어린이게임</option>
			                            <option value="추상게임/">추상게임</option>
			                            <option value="전략게임/">전략게임</option>
			                        </select>
			                        &nbsp;&nbsp;
			                        <select name="genre" class="gameInfo genre form-select" style="display:inline; width:200px; height:38px;">
			                            <option class="none">-----</option>
			                            <option value="카드게임">카드게임</option>
			                            <option value="파티게임">파티게임</option>
			                            <option value="블러핑">블러핑</option>
			                            <option value="가족게임">가족게임</option>
			                            <option value="어린이게임">어린이게임</option>
			                            <option value="추상게임">추상게임</option>
			                            <option value="전략게임">전략게임</option>
			                        </select>
			                        <input type="hidden" name="gameGenre" class="gameGenre" value=""/>
			                        <input type="hidden" name="gameGenre" class="gameGenre" value=""/>
			                        <input type="hidden" name="gameGenre" class="gameGenre" value=""/>
			                        <input type="hidden" name="gameGenre" class="gameGenre" value=""/>
			                        <input type="hidden" name="gameGenre" class="gameGenre" value=""/>
			                        &nbsp;&nbsp;
			                        <span class="badge text-bg-info">최소 1개 선택</span>
			                    </td>
			                </tr>
			                <tr>
			                    <td class="align-middle">게임시간</td>
			                    <td class="align-middle">
			                        <input type="number" name="gamePlayTime" class="gamePlayTime form-control" step="1" min="0" style="display:inline; width:200px;"/>
			                        <input type="number" name="gamePlayTime" class="gamePlayTime form-control" step="1" min="0" style="display:none; width:200px;"/>
			                        <input type="number" name="gamePlayTime" class="gamePlayTime form-control" step="1" min="0" style="display:none; width:200px;"/>
			                        <input type="number" name="gamePlayTime" class="gamePlayTime form-control" step="1" min="0" style="display:none; width:200px;"/>
			                        <input type="number" name="gamePlayTime" class="gamePlayTime form-control" step="1" min="0" style="display:none; width:200px;"/>
			                        &nbsp;&nbsp;
			                        <span class="badge text-bg-info">숫자 입력 | 필수 입력</span>
			                    </td>
			                </tr>
			                <tr>
			                    <td class="align-middle">게임 난이도</td>
			                    <td class="align-middle">
			                        <input type="number" name="gameLevel" class="gameLevel form-control" step="0.01" min="0.00" max="5.00" style="display:inline; width:200px;"/>
			                        <input type="number" name="gameLevel" class="gameLevel form-control" step="0.01" min="0.00" max="5.00" style="display:none; width:200px;"/>
			                        <input type="number" name="gameLevel" class="gameLevel form-control" step="0.01" min="0.00" max="5.00" style="display:none; width:200px;"/>
			                        <input type="number" name="gameLevel" class="gameLevel form-control" step="0.01" min="0.00" max="5.00" style="display:none; width:200px;"/>
			                        <input type="number" name="gameLevel" class="gameLevel form-control" step="0.01" min="0.00" max="5.00" style="display:none; width:200px;"/>
			                        &nbsp;&nbsp;
			                        <span class="badge text-bg-info">숫자 입력 | 필수 입력</span>
			                    </td>
			                </tr>
			                <tr>
			                    <td class="align-middle">게임인원</td>
			                    <td class="align-middle">
			                        <label>2 <input type="radio" name="people" class="gameRadio" value="2"/></label>&nbsp;
			                        <label>3 <input type="radio" name="people" class="gameRadio" value="3"/></label>&nbsp;
			                        <label>4 <input type="radio" name="people" class="gameRadio" value="4"/></label>&nbsp;
			                        <label>5 <input type="radio" name="people" class="gameRadio" value="5"/></label>&nbsp;
			                        <label>6 <input type="radio" name="people" class="gameRadio" value="6"/></label>
			                        <input type="hidden" name="gamePeople" class="gamePeople"/>
			                        <input type="hidden" name="gamePeople" class="gamePeople"/>
			                        <input type="hidden" name="gamePeople" class="gamePeople"/>
			                        <input type="hidden" name="gamePeople" class="gamePeople"/>
			                        <input type="hidden" name="gamePeople" class="gamePeople"/>
			                        &nbsp;&nbsp;
			                        <span class="badge text-bg-info">1개만 선택</span>
			                    </td>
			                </tr>
			                <tr>
			                    <td class="align-middle">게임이미지</td>
			                    <td class="align-middle">
			                        <input type="file" accept=".PNG, .JPG" name="gameImage" class="gameImage form-control" style="display:inline; width:300px;"/>
			                        <input type="file" accept=".PNG, .JPG" name="gameImage" class="gameImage form-control" style="display:none; width:300px;"/>
			                        <input type="file" accept=".PNG, .JPG" name="gameImage" class="gameImage form-control" style="display:none; width:300px;"/>
			                        <input type="file" accept=".PNG, .JPG" name="gameImage" class="gameImage form-control" style="display:none; width:300px;"/>
			                        <input type="file" accept=".PNG, .JPG" name="gameImage" class="gameImage form-control" style="display:none; width:300px;"/>
			                    </td>
			                </tr>
			            </tbody>
			        </table>
			    </form>
                <div></div>
            </div>
            <div id="pageButton"> <!-- 버튼 공간 -->
            	<br/>
                <button id="tempSaveBtn" class="btn btn-primary">임시저장</button> 
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <span id="saveCount" class="badge text-bg-success">0/5 저장 중</span>
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <button id="insertBtn" class="btn btn-primary">추가하기</button> 
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <button id="gameListBtn" class="btn btn-primary">게임목록</button>
            </div>
        </div>
        <div class="blank"><!-- 오른쪽 --></div>
    </div>
    <footer>나 푸터</footer>
    
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		window.onload = () => {
			// 게임이름 실시간 중복확인
			for(const g of document.querySelectorAll('.gameName')) {
				g.addEventListener('change', function() {
					const span = this.parentElement.querySelector('span');
					$.ajax({
						url: '${contextPath}/checkGameName.ad',
						data: {gameName : this.value},
						success: data => {
							if(data == 'success') {
								span.classList.remove('text-bg-danger');
								span.classList.add('text-bg-info');
								span.innerText = '사용 가능한 게임이름입니다.';
							} else if(data == 'fail') {
								span.classList.remove('text-bg-info');
								span.classList.add('text-bg-danger');
								span.innerText = '사용 불가능한 게임이름입니다.';
							}
						},
						error: data => alert('서비스 요청에 실패하였습니다.')
					})
				
				})
			}
			
			const gameForm = document.querySelector('#gameForm'); // 제출 form요소
            let saveCount = 0; // 임시저장한 데이터의 갯수 구분

            //현재 화면에 대한 입력값을 검사하는 함수 작성 => 입력필드와 선택필드를 나누어서 검사
            const checkInput = () => {
                const gameNames = document.querySelectorAll('.gameName'); // 입력, 길이5
                const gameCompanys = document.querySelectorAll('.gameCompany'); // 입력, 길이5
                const gamePlayTimes = document.querySelectorAll('.gamePlayTime'); // 입력, 길이5
                const gameLevels = document.querySelectorAll('.gameLevel'); // 입력, 길이5
                const gameImages = document.querySelectorAll('.gameImage'); // 입력, 길이5

                let docGameName;
                let docGameCompany;
                let docGamePlayTime;
                let docGameLevel;
                let docGameImage;

                for(let i = 0; i < 5; i++) {
                    if(gameNames[i].offsetWidth > 0 && gameNames[i].offsetHeight > 0) docGameName = gameNames[i].value;
                    if(gameCompanys[i].offsetWidth > 0 && gameCompanys[i].offsetHeight > 0) docGameCompany = gameCompanys[i].value;
                    if(gamePlayTimes[i].offsetWidth > 0 && gamePlayTimes[i].offsetHeight > 0) docGamePlayTime = gamePlayTimes[i].value;
                    if(gameLevels[i].offsetWidth > 0 && gameLevels[i].offsetHeight > 0) docGameLevel = gameLevels[i].value;
                    if(gameImages[i].offsetWidth > 0 && gameImages[i].offsetHeight > 0) docGameImage = gameImages[i].value;      
                }

                const genres = document.querySelectorAll('.genre'); // 선택              
                const gameRadios = document.querySelectorAll('.gameRadio'); // 선택
                let radioCheck = false;
                for(const r of gameRadios) {
                    if(r.checked) {
                        radioCheck = true;
                    }
                }
                
                let checkResult = false;
                if(docGameName == '') alert('게임이름을 입력해주세요');
                else if(docGameCompany == '') alert('제조사를 입력해주세요');
                else if(docGamePlayTime == '') alert('게임 플레이 시간을 입력해주세요.');
                else if(docGameLevel == '') alert('게임 난이도를 선택해주세요');
                else if(docGameImage == '') alert('게임 이미지를 첨부해주세요!');
                else if(genres[0].value.includes('-') && genres[1].value.includes('-') && genres[2].value.includes('-')) alert('게임장르는 한가지 이상 선택해주셔야 합니다.')
                else if(!radioCheck) alert('게임 인원을 선택해주세요.')
                else checkResult = true;
                return checkResult;
            }
    
            // 저장하기
            document.querySelector('#insertBtn').addEventListener('click', () => { 
                // 입력요소를 곧바로 추가하는 경우
                // 0) 현재 화면에 나타나있는 입력요소를 검사한다.
                const checkResult = checkInput();
                const genreList = document.querySelectorAll('.genre');
                const gameGenreList = document.querySelectorAll('.gameGenre');
                const gamePeopleList = document.querySelectorAll('.gamePeople'); // 옮겨담을 그릇
                const gameRadioList = document.querySelectorAll('.gameRadio');
                
                if(checkResult) { // 입력요소 검사 결과가 true인 경우에 전송을 시작한다.
                    if(saveCount == 0) { // * 임시저장하지 않고 추가버튼을 클릭함 *
                        // 1) 장르 데이터를 옮겨담음
                        let genreResult = '';
                        for(let i = 0; i < genreList.length; i++) {
                            genreResult += genreList[i].value;
                        }
                        gameGenreList[0].value = genreResult;
            
                        // 2) 게임인원 데이터를 옮겨담음
                        
                        for(const r of gameRadioList) {
                            if(r.checked) {
                                gamePeopleList[0].value = r.value;
                            }
                        } 
                        // 3) 컨트롤러에게 데이터를 전달한다.
                        if(confirm('추가하시겠습니까?')) {
                            gameForm.submit();
                        }
                    } else if(saveCount > 0 && saveCount < 5) { // * 임시저장을 하다가 추가버튼을 클릭함 *
                        /*
                            saveCount가 2인 상황을 가정 => index가 2인 요소에 옮겨담으면 됨
                        */
                        let genreResult = '';
                        for(let i = 0; i < genreList.length; i++) {
                        	genreResult += genreList[i].value;
                        }
                        gameGenreList[saveCount].value = genreResult;

                        for(const r of gameRadioList) {
                            if(r.checked) {
                            	gamePeopleList[saveCount].value = r.value;
                            }
                        }
                        
                        if(confirm('추가하시겠습니까?')) {
                            gameForm.submit();
                        }
                    } else if(saveCount == 5) {
                    	if(confirm('추가하시겠습니까?')) {
                            gameForm.submit();
                        }
                    }
                }
    
            })
            
            // 임시저장 기능 구현
            // 몇번째 저장인지를 알아야 화면의 요소를 회전시킬 수 있음
            
            document.querySelector('#tempSaveBtn').addEventListener('click', function() {
                // 현재 화면에 대한 입력값을 체크
                const checkResult = checkInput();
                if(checkResult) {
                    // 아래 기술한 로직은 이 조건에서만 기술되어야 한다.
	                const gameNames = document.querySelectorAll('.gameName'); // 입력, 길이5
	                const gameCompanys = document.querySelectorAll('.gameCompany'); // 입력, 길이5
	                const gamePlayTimes = document.querySelectorAll('.gamePlayTime'); // 입력, 길이5
	                const gameLevels = document.querySelectorAll('.gameLevel'); // 입력, 길이5
	                const gameImages = document.querySelectorAll('.gameImage'); // 입력, 길이5
	
	                const genres = document.querySelectorAll('.genre'); // 선택, 길이3
	                const gameGenres = document.querySelectorAll('.gameGenre'); // 그릇, 길이5
	
	                const gameRadios = document.querySelectorAll('.gameRadio'); // 선택, 길이5
	                const gamePeoples = document.querySelectorAll('.gamePeople'); // 그릇, 길이5
					
	             	// 장르 데이터 패스하기 : 저장횟수와 관계없이 임시저장일 때 발생되어야 하는 수행
	                let genreResult = '';
	                for(let i = 0; i < genres.length; i++) {
	                    genreResult += genres[i].value;
	                }
	                gameGenres[saveCount].value = genreResult;
	                
	             	// 플레이타임 데이터 패스하기 : 저장횟수와 관계없이 임시저장일 때 발생되어야 하는 수행
	                for(const r of gameRadios) {
	                    if(r.checked) {
	                        gamePeoples[saveCount].value = r.value;
	                    }
	                }
	                
	                if(saveCount < 4) { // 저장횟수가 0번째에서 3번째 일 때 로직
	                    gameNames[saveCount].style.display = 'none';
	                    gameCompanys[saveCount].style.display = 'none';
	                    gamePlayTimes[saveCount].style.display = 'none';
	                    gameLevels[saveCount].style.display = 'none';
	                    gameImages[saveCount].style.display = 'none';
	
	                    gameNames[saveCount + 1].style.display = 'inline';
	                    gameCompanys[saveCount + 1].style.display = 'inline';
	                    gamePlayTimes[saveCount + 1].style.display = 'inline';
	                    gameLevels[saveCount + 1].style.display = 'inline';
	                    gameImages[saveCount + 1].style.display = 'inline';
						
	                    for(let i = 0; i < 3; i++) {
		                    genres[i].children[0].selected = true; // select태그의 옵션을 초기화!
	                    }
	                    
	                    for(const r of gameRadios) {
	                        if(r.checked) {
	                        	r.checked = false;
	                        }
	                    }
	                
	                } else if(saveCount == 4) { // 임시저장이 풀방이므로 각 입력요소와 임시저장버튼을 비활성화
	                    gameNames[saveCount].readonly = true;
	                    gameCompanys[saveCount].readonly = true;
	                    gamePlayTimes[saveCount].readonly = true;
	                    gameLevels[saveCount].readonly = true;
	                    gameImages[saveCount].readonly = true;
	
	                    for(const g of genres) {
	                        g.disabled = true;
	                    }
	                    for(const r of gameRadios) {
	                        r.disabled = true;
	                    }
	
	                    this.classList.remove('btn-primary');
	                    this.classList.add('btn-secondary');
	                    alert('더 이상 게임정보를 입력하실 수 없습니다.');
	                }
	                    
	                //    genres[i].children[0].selected = true;
	                //    r.checked = false;
	                
	                saveCount += 1; // 임시저장 중인 갯수를 1개 증가시킨다.
	                document.querySelector('#saveCount').innerText = saveCount + '/5 임시저장';
	                
	                
                }

            })
		}
	</script>
</body>
</html>