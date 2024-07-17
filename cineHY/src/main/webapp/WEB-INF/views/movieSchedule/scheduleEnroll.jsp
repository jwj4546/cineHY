<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 스케줄 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    #page1 { height: 80px;}
    #page3 { 
    	height: 800px;
    }
   	.mt-4 { margin-top: 1.5rem; }
    .mt-5 { margin-top: 3rem; }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<main>
    	<div id="page1"></div>
    	<div id="page2">
		    <div class="container mt-5">
		        <h2 class="mb-4">영화 스케줄 등록</h2>
		        <form id="scheduleForm">
		            <div class="form-row">
		                <div class="form-group col-md-4">
		                    <label for="movieSelect">영화선택</label>
		                    <select id="movieSelect" class="form-control">
		                        <option value="">영화를 선택하세요</option>
		                        <option>인사이드 아웃</option>
		                        <option>하이저킹</option>
		                        <option>헨젤가이즈</option>
		                    </select>
		                </div>
		                <div class="form-group col-md-2">
		                    <label for="theaterSelect">영화관 선택</label>
		                    <select id="theaterSelect" class="form-control">
		                        
		                    </select>
		                </div>
		                <div class="form-group col-md-3">
		                    <label for="startdateSelect">상영시작날짜</label>
		                    <input type="date" id="startdateSelect" class="form-control">
		                </div>
		                <div class="form-group col-md-3">
		                    <label for="enddateSelect">상영종료날짜</label>
		                    <input type="date" id="enddateSelect" class="form-control">
		                </div>
		            </div>
		            <button type="button" class="btn btn-primary mb-4" onclick="fetchSchedule()">조회하기</button>
		        </form>
		
		        <div id="scheduleResult" class="mt-4"></div>
		
		        <form id="registerForm">
		            <div class="form-row">
		                <div class="form-group col-md-4">
		                    <label for="screenSelect">상영관 선택</label>
		                    <select id="screenSelect" class="form-control" >
		                        <option value="">상영관을 선택하세요</option>
		                        <option value="1">1관</option>
		                        <option value="2">2관</option>
		                        <option value="3">3관</option>
		                    </select>
		                </div>
		                <div class="form-group col-md-4">
		                    <label for="startTime">상영시작시간</label>
		                    <input type="time" id="startTime" class="form-control" >
		                </div>
		                <div class="form-group col-md-4">
		                    <label for="endTime">상영종료시간</label>
		                    <input type="time" id="endTime" class="form-control" >
		                </div>
		            </div>
		        </form>
		
		        <div id="registerSchedule" class="mt-4">
		            <div id="newScheduleInfo"></div>
		            <button type="button" class="btn btn-success" onclick="checkSchedule()" >등록하기</button>
		        </div>
		    </div>
	    </div>
	    <br>
	    <hr>
	    <br>
	    <div id="page3">
		    <div class="container mt-5">
	        <h2 class="mb-4">등록된 영화 스케줄</h2>
	        
	        <!-- 지역 선택 버튼 -->
	        <div class="btn-group btn-group-toggle mb-4" data-toggle="buttons">
	            <c:forEach var="theater" items="${theaters}">
	                <label class="btn btn-outline-primary">
	                    <input type="radio" name="theater" autocomplete="off" value="${theater.theaterCode}"> ${theater.theaterName}
	                </label>
	            </c:forEach>
	        </div>
		
	        <!-- 날짜 선택 탭 -->
	        <ul class="nav nav-tabs">
	            <li class="nav-item">
	                <a class="nav-link active" href="#date1" data-toggle="tab">6/19 (수)</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="#date2" data-toggle="tab">6/20 (목)</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="#date3" data-toggle="tab">6/21 (금)</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="#date4" data-toggle="tab">6/22 (토)</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="#date5" data-toggle="tab">6/23 (일)</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="#date6" data-toggle="tab">6/24 (월)</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="#date7" data-toggle="tab">6/25 (화)</a>
	            </li>
	        </ul>
	
	        <!-- 스케줄 표 -->
	        <div class="tab-content">
	            <div class="tab-pane fade show active" id="date1">
	                <table class="table table-bordered schedule-table">
	                    <thead>
	                        <tr>
	                            <th>영화</th>
	                            <th>상영관</th>
	                            <th>시간</th>
	                            <th>옵션</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td><button class="btn btn-danger btn-sm float-right delete-btn">삭제</button></td>
	                        </tr>
	                        
	                    </tbody>
	                </table>
	            </div>
	            <div class="tab-pane fade" id="date2">
					<table class="table table-bordered schedule-table">
	                    <thead>
	                        <tr>
	                            <th>영화</th>
	                            <th>상영관</th>
	                            <th>시간</th>
	                            <th>옵션</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td><button class="btn btn-danger btn-sm float-right delete-btn">삭제</button></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            <div class="tab-pane fade" id="date3">
	                <table class="table table-bordered schedule-table">
	                    <thead>
	                        <tr>
	                            <th>영화</th>
	                            <th>상영관</th>
	                            <th>시간</th>
	                            <th>옵션</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td><button class="btn btn-danger btn-sm float-right delete-btn">삭제</button></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            <div class="tab-pane fade" id="date4">
	                <table class="table table-bordered schedule-table">
	                    <thead>
	                        <tr>
	                            <th>영화</th>
	                            <th>상영관</th>
	                            <th>시간</th>
	                            <th>옵션</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td><button class="btn btn-danger btn-sm float-right delete-btn">삭제</button></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            <div class="tab-pane fade" id="date5">
	                <table class="table table-bordered schedule-table">
	                    <thead>
	                        <tr>
	                            <th>영화</th>
	                            <th>상영관</th>
	                            <th>시간</th>
	                            <th>옵션</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td><button class="btn btn-danger btn-sm float-right delete-btn">삭제</button></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            <div class="tab-pane fade" id="date6">
	                <table class="table table-bordered schedule-table">
	                    <thead>
	                        <tr>
	                            <th>영화</th>
	                            <th>상영관</th>
	                            <th>시간</th>
	                            <th>옵션</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td><button class="btn btn-danger btn-sm float-right delete-btn">삭제</button></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            <div class="tab-pane fade" id="date7">
	                <table class="table table-bordered schedule-table">
	                    <thead>
	                        <tr>
	                            <th>영화</th>
	                            <th>상영관</th>
	                            <th>시간</th>
	                            <th>옵션</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td><button class="btn btn-danger btn-sm float-right delete-btn">삭제</button></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
    </div>
	    

    <script>
	    $(document).ready(function() {
		    function findAllMovie() {
				
				$.ajax({
					url : 'movieList/movieEnrollList',
					method : 'get',
					dataType : 'json',
					success: function(data) {
						//console.log(data.data);
						const movieTitleList = data.data;
						let ListHtml ='<option value="">영화를 선택하세요</option>';
						for(let i in movieTitleList) {
							ListHtml += '<option value="'+ movieTitleList[i].movieCode +'">'+ movieTitleList[i].movieTitle +'</option>';
							//console.log(movieTitleList[i].movieTitle);
						}
						$('#movieSelect').html(ListHtml);
						
					},
					error: function(jqXHR, textStatus, errorThrown) {
	    	            console.error('Error fetching movie data:', textStatus, errorThrown);
	    	        }
				});
		    }
		    findAllMovie();
		    
		    function getTheater() {
		    	
		    	$.ajax({
		    		url : 'movieSchedule/theater',
		    		method : 'get',
		    		dataType : 'json',
		    		success : function(data) {
		    			//console.log(data.data);
		    			const theaterList = data.data;
		    			let TheaterHtml ='<option value="">영화관을 선택하세요</option>';
		    			for(let i in theaterList) {
		    				//console.log(theaterList[i].theaterName);
		    				TheaterHtml += '<option value="'+ theaterList[i].theaterCode +'">'+ theaterList[i].theaterName +'</option>';
		    			}
		    			$('#theaterSelect').html(TheaterHtml);
		    		},
		    		error: function(jqXHR, textStatus, errorThrown) {
	    	            console.error('Error fetching movie data:', textStatus, errorThrown);
		    		}
		    	});
		    }
		    getTheater();
	    });
    	
	    //영화-극장-날짜 선조회 함수 
        function fetchSchedule() {
            const movie = document.getElementById('movieSelect').value;
            const theater = document.getElementById('theaterSelect').value;
            const startdate = document.getElementById('startdateSelect').value;
            const enddate = document.getElementById('enddateSelect').value;
            
            
            if (!movie || !theater || !startdate || !enddate ) {
                alert('영화, 영화관, 상영날짜를 모두 선택해주세요.');
                return;
            }
			
            $.ajax({
	    		url : 'movieSchedule/schedule/' + movie + '/' + theater + '/' + startdate + '/' + enddate,
	    		method : 'get',
	    		dataType : 'json',
	    		success : function(data) { // data => 
	    			console.log(data);
		            const scheduleResult = document.getElementById('scheduleResult');
		            scheduleResult.innerHTML = '';
					//console.log(data);
		            if (data.data.length > 0) {
		                data.data.forEach(s => {
		                    scheduleResult.innerHTML += '<div class="card mt-2">'
		                            + '<div class="card-body">'
		                            + '<h5 class="card-title">' + s.startDate + '-' + s.endDate + ' 상영 스케줄</h5>'
		                            + '<p class="card-text">상영관: ' + s.screenCode + '관</p>'
		                            + '<p class="card-text">시간: ' + s.startTime +'-' + s.endTime + '</p>'
		                            + '</div>'
		                        	+ '</div>'
		                  ;})
		            }
		            else {
		                scheduleResult.innerHTML = '<p>선택한 날짜에 해당 영화의 스케줄이 없습니다.</p>';
		            }
	        	}
	        });
        }
 
        
        //중복 스케줄 체크
        function checkSchedule() {
           
            const theaterCode= $('#theaterSelect').val();
            const screenCode= $('#screenSelect').val();
            const startDate= $('#startdateSelect').val();
            const endDate= $('#enddateSelect').val();
            const startTime= $('#startTime').val();
            const endTime= $('#endTime').val();
        

            $.ajax({
                url: 'movieSchedule/check/' 
                		+ theaterCode + '/' 
                		+ screenCode + '/'
                		+ startDate + '/' 
                		+ endDate + '/'
                		+ startTime + '/'
                		+ endTime,
                method: 'get',
                dataType: 'json',
                success: function(data) {
                    let result = data.data;
                    if (result == 0) {
                    	registerSchedule();
                    } else if(result > 0){
                    	alert("이미 등록된 스케줄이 있습니다.")
                    } else {
                    	alert("등록실행 오류")
                    }
                }
            });
        }
		//중복된 시간이 없으면 스케줄 등록
        function registerSchedule() {
            const requestData = {
            		movieCode: $('#movieSelect').val(),
                    theaterCode: $('#theaterSelect').val(),
                    screenCode: $('#screenSelect').val(),
                    startDate: $('#startdateSelect').val(),
                    endDate: $('#enddateSelect').val(),
                    startTime: $('#startTime').val(),
                    endTime: $('#endTime').val()
            };

            $.ajax({
                url: 'movieSchedule/insert',
                method: 'post',
                contentType: 'application/json; charset=UTF-8', // JSON 형식으로 설정
                data: JSON.stringify(requestData), // JSON 문자열로 변환하여 전송
                success: function(data) {
                    //console.log(data);

                    alert('상영 스케줄이 등록되었습니다.');

                    // 등록 후 폼 초기화
                    document.getElementById('scheduleForm').reset();
                    document.getElementById('registerForm').reset();
                    document.getElementById('newScheduleInfo').innerHTML = '';
                    document.getElementById('scheduleResult').innerHTML = '';
                }
            });
        }
		
        updateDateTabs(); // 페이지 로드 시 날짜 탭 업데이트

        $(document).ready(function() {
            // 첫 번째 지역 버튼 자동 선택
            const firstTheaterButton = $('.btn-group-toggle .btn').first();
            firstTheaterButton.addClass('active');
            firstTheaterButton.find('input').prop('checked', true);

            // 첫 번째 날짜 탭 자동 선택
            const firstDateTab = $('.nav-tabs a.nav-link').first();
            firstDateTab.tab('show');

            // 지역 및 날짜에 맞는 스케줄 자동 로드
            const selectedTabDate = firstDateTab.attr('data-date');
            const theaterCode = firstTheaterButton.find('input').val();
            AllScheduleList(theaterCode, selectedTabDate);
        });
        
        // 날짜 탭 업데이트 함수
        function updateDateTabs() {
            // 오늘 날짜를 기준으로 탭 생성
            const today = new Date();
            const days = ['일', '월', '화', '수', '목', '금', '토'];
            let tabHtml = '';

            // 7일 동안의 날짜 탭 생성
            for (let i = 0; i < 7; i++) {
                const date = new Date(today);
                date.setDate(today.getDate() + i);

                const dayOfWeek = days[date.getDay()];
                const month = date.getMonth() + 1;
                const day = date.getDate();
                const formattedDate = date.getFullYear() + '-' + (month < 10 ? '0' + month : month) + '-' + (day < 10 ? '0' + day : day);

                // 탭 HTML 생성
                tabHtml += '<li class="nav-item" value="">';
                tabHtml += '<a class="nav-link' + (i === 0 ? ' active' : '') + '" href="#date' + (i + 1) + '" data-toggle="tab" data-date="' + formattedDate + '">';
                tabHtml += month + '/' + day + ' (' + dayOfWeek + ')';
                tabHtml += '</a>';
                tabHtml += '</li>';
            }

            // 날짜 탭 업데이트
            $('.nav-tabs').html(tabHtml);

            // 첫 번째 탭을 활성화
            $('.nav-tabs a:first').tab('show');
        }
        
       
        
        $('.nav-tabs a').on('click', function(e) {
            e.preventDefault();
            const date = $(this).attr('data-date');
            const theaterCode = $('input[name="theater"]:checked').val(); // 선택된 지역 코드 가져오기

            if (!theaterCode) {
                alert('지역을 선택해주세요.');
                return;
            }

        });

        // 지역 선택 버튼 클릭 이벤트 처리
       // 탭 클릭 이벤트 핸들러
        $('.nav-tabs a.nav-link').on('click', function() {
            const selectedTabDate = $(this).attr('data-date');
            const theaterCode = $('input[name="theater"]:checked').val();

            if (!theaterCode) {
                alert('지역을 선택해주세요.');
                return;
            }

            AllScheduleList(theaterCode, selectedTabDate);
        });

    // 하단 극장,날짜별 스케줄 조회 함수
    function AllScheduleList(theaterCode, selectedTabDate) {
        //console.log(theaterCode, selectedTabDate)
        $.ajax({
            url: 'movieSchedule/AllScheduleList/' + theaterCode + '/' + selectedTabDate,
            method: 'get',
            dataType: 'json',
            success: function(data) {
            	//console.log(data)
            	
            	displayScheduleForDate(data);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error fetching schedule data:', textStatus, errorThrown);
            }
        });
    }
    
 	// 받아온 스케줄 데이터를 화면에 출력하는 함수
    function displayScheduleForDate(data) {
        // 탭 페이지의 스케줄 테이블에 출력
        const activeTabId = $('.nav-tabs .nav-link.active').attr('href'); // 현재 활성화된 탭의 ID 가져오기
        const scheduleTable = $(activeTabId + ' .schedule-table tbody'); // 현재 탭의 스케줄 테이블의 tbody 선택

        scheduleTable.empty(); // 기존 내용 비우기

        if (data && data.data.length > 0) {
        	console.log(data.data);
            data.data.forEach(schedule => {
                // 각 스케줄 항목을 테이블에 추가
                const row = '<tr>' +
                                '<td>' + schedule.movieTitle + '</td>' +
                                '<td>' + schedule.screenCode + '</td>' +
                                '<td>' + schedule.startTime + '-' + schedule.endTime + '</td>' +
                                '<input type="hidden" value=' + schedule.movieCode + ' id="tableMovieCode">' +
                                '<td><button class="btn btn-danger btn-sm float-right delete-btn" onclick="deleteSchedule(' + schedule.screeningId + ')">삭제</button></td>' +
                            '</tr>';
                scheduleTable.append(row);
            });
        } else {
            // 데이터가 없을 경우 메시지 표시
            const noScheduleMessage = '<tr><td colspan="4">선택한 날짜에 해당하는 스케줄이 없습니다.</td></tr>';
            scheduleTable.append(noScheduleMessage);
        }
    }
    
 	//스케줄 삭제 함수
    function deleteSchedule(screeningId) {
    	$.ajax ({
			url : 'movieSchedule/'+screeningId,
			type : 'delete',
			success : data => {
				//console.log(data)
				AllScheduleList();
			},
			error: function(xhr, status, error) {
                console.error("Error occurred while deleting movie:", error);
            }
		});
		
	}
        
    </script>
    </main>

    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>