<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	#page1 { height: 80px;}
	#page2 { height: 800px;}
	.row .col .navbar {
		background-color: #29b9a5;
	}
	#selectedInfo {
		width: 800px;
		height: 200px;
	}

    .seat {
        width: 50px;
        height: 50px;
        background-color: #444;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        }    
    .screen {
            width: 1200px;
            grid-column: span 12;
            background-color: #ccc;
            height: 50px;
            text-align: center;
            padding: 10px;
            margin:0 auto;

        }
    .cinema {
            display: grid;
            grid-template-columns: repeat(7, 50px) 50px repeat(6, 50px);
            gap: 5px;
            justify-content: center;
            margin: 0 auto;
        }
    .row {
        background-color: #ccc;
        width: 50px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }
    .btn btn-light {
        margin-left: 25px;
    }
    .selected {
        background-color: #6c757d;
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<main>
	<br><br><br><br><br><br>
    <!-- 우측 상단 버튼(상영시간표, 예매 다시하기) -->
    <div style="width: 1200px; height: 100px; margin: 0 auto;">
        <button type="button" class="btn btn-secondary" style="float: right;">예매 다시하기</button>
        <button type="button" class="btn btn-secondary" style="float: right; margin-right: 20px;">상영시간표</button>
    </div>

    <!-- 인원 / 좌석 표시 -->
    <div style="width: 1200px; height: 100px; background-color: #ccc; margin: 0 auto; text-align: center;">
        <p style="color: #444;">인원 / 좌석</p>
    </div>
    <br><br><br>

    <!-- 인원 선택 버튼 -->
    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups" style="width: 800px; margin-left: 310px; display: flex;">
        <div class="btn-group mr-2" role="group" aria-label="First group" style="width: 1200px;margin: 0 auto; float: left;">
            <button type="button" class="btn btn-light" style="width: 50px; margin-left: 50px;">인원</button>
            <button type="button" class="btn btn-light" id="person" onclick="selectPerson(1)">1</button>
            <button type="button" class="btn btn-light" id="person" onclick="selectPerson(2)">2</button>
            <button type="button" class="btn btn-light" id="person" onclick="selectPerson(3)">3</button>
            <button type="button" class="btn btn-light" id="person" onclick="selectPerson(4)">4</button>
            <button type="button" class="btn btn-light" id="person" onclick="selectPerson(5)">5</button>
            <button type="button" class="btn btn-light" id="person" onclick="selectPerson(6)">6</button>
            <button type="button" class="btn btn-light" id="person" onclick="selectPerson(7)">7</button>
            <button type="button" class="btn btn-light" id="person" onclick="selectPerson(8)">8</button>
            <div style="border-left: 1px solid#000; margin-left: 50px;padding: 20px;">
                <div><p>영화관 지점명</p></div>
                <div><p>상영관</p></div>
                <div><p>남은 좌석</p></div>
                <div><p>상영일자 / 상영시간</p></div>
            </div>  
        </div>
        
    </div>
    <br><br><br>

    
    <div class="screen">Screen</div>
    <br><br><br><br><br>
        <div class="cinema">
            <!-- 좌석 나열 A1 ~ A12 -->
            <div class="row">A</div>
            <div class="seat">1</div>
            <div class="seat">2</div>
            <div class="seat">3</div>
            <div class="seat">4</div>
            <div class="seat">5</div>
            <div class="seat">6</div>
            <div class="space"></div>
            
            <div class="seat">7</div>
            <div class="seat">8</div>
            <div class="seat">9</div>
            <div class="seat">10</div>
            <div class="seat">11</div>
            <div class="seat">12</div>
            
            <!-- 좌석 나열 B1 ~ B12 -->
            <div class="row">B</div>
            <div class="seat">1</div>
            <div class="seat">2</div>
            <div class="seat">3</div>
            <div class="seat">4</div>
            <div class="seat">5</div>
            <div class="seat">6</div>
            <div class="space"></div>
            
            <div class="seat">7</div>
            <div class="seat">8</div>
            <div class="seat">9</div>
            <div class="seat">10</div>
            <div class="seat">11</div>
            <div class="seat">12</div>


            <!-- 좌석 나열 C1 ~ C12 -->
            <div class="row">C</div>
            <div class="seat">1</div>
            <div class="seat">2</div>
            <div class="seat">3</div>
            <div class="seat">4</div>
            <div class="seat">5</div>
            <div class="seat">6</div>
            <div class="space"></div>
            
            <div class="seat">7</div>
            <div class="seat">8</div>
            <div class="seat">9</div>
            <div class="seat">10</div>
            <div class="seat">11</div>
            <div class="seat">12</div>


            <!-- 좌석 나열 D1 ~ D12 -->
            <div class="row">D</div>
            <div class="seat">1</div>
            <div class="seat">2</div>
            <div class="seat">3</div>
            <div class="seat">4</div>
            <div class="seat">5</div>
            <div class="seat">6</div>
            <div class="space"></div>
            
            <div class="seat">7</div>
            <div class="seat">8</div>
            <div class="seat">9</div>
            <div class="seat">10</div>
            <div class="seat">11</div>
            <div class="seat">12</div>


            <!-- 좌석 나열 E1 ~ E12 -->
            <div class="row">E</div>
            <div class="seat">1</div>
            <div class="seat">2</div>
            <div class="seat">3</div>
            <div class="seat">4</div>
            <div class="seat">5</div>
            <div class="seat">6</div>
            <div class="space"></div>
            
            <div class="seat">7</div>
            <div class="seat">8</div>
            <div class="seat">9</div>
            <div class="seat">10</div>
            <div class="seat">11</div>
            <div class="seat">12</div>


            <!-- 좌석 나열 F1 ~ F12 -->
            <div class="row">F</div>
            <div class="seat">1</div>
            <div class="seat">2</div>
            <div class="seat">3</div>
            <div class="seat">4</div>
            <div class="seat">5</div>
            <div class="seat">6</div>
            <div class="space"></div>
            
            <div class="seat">7</div>
            <div class="seat">8</div>
            <div class="seat">9</div>
            <div class="seat">10</div>
            <div class="seat">11</div>
            <div class="seat">12</div>


            <!-- 좌석 나열 G1 ~ G12 -->
            <div class="row">G</div>
            <div class="seat">1</div>
            <div class="seat">2</div>
            <div class="seat">3</div>
            <div class="seat">4</div>
            <div class="seat">5</div>
            <div class="seat">6</div>
            <div class="space"></div>
            
            <div class="seat">7</div>
            <div class="seat">8</div>
            <div class="seat">9</div>
            <div class="seat">10</div>
            <div class="seat">11</div>
            <div class="seat">12</div>


            <!-- 좌석 나열 H1 ~ H12 -->
            <div class="row">H</div>
            <div class="seat">1</div>
            <div class="seat">2</div>
            <div class="seat">3</div>
            <div class="seat">4</div>
            <div class="seat">5</div>
            <div class="seat">6</div>
            <div class="space"></div>
            
            <div class="seat">7</div>
            <div class="seat">8</div>
            <div class="seat">9</div>
            <div class="seat">10</div>
            <div class="seat">11</div>
            <div class="seat">12</div>


            <!-- 좌석 나열 I1 ~ I12 -->
            <div class="row">I</div>
            <div class="seat">1</div>
            <div class="seat">2</div>
            <div class="seat">3</div>
            <div class="seat">4</div>
            <div class="seat">5</div>
            <div class="seat">6</div>
            <div class="space"></div>
            
            <div class="seat">7</div>
            <div class="seat">8</div>
            <div class="seat">9</div>
            <div class="seat">10</div>
            <div class="seat">11</div>
            <div class="seat">12</div>
        </div>
    </main>
        <br><br><br>
        
        
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>

$(document).ready(function() {
	
	let selectedMovieCode = '${movieCode}';
    let selectedTheaterCode = '${theaterCode}';
    const selectedTicketDate = '${ticketDate}';
    const selectedScreenCode = '${screenCode}';
    const selectedStartTime = '${startTime}';
	
	function findAllMovie() {
		
		$.ajax({
			url : 'movieList/movieEnrollList',
			method : 'get',
			dataType : 'json',
			success: function(data) {
				const movieTitleList = data.data;
				let ListHtml ='';
				for(let i in movieTitleList) {
					ListHtml += '<option value="'+ movieTitleList[i].movieCode +'">'+ movieTitleList[i].movieTitle +'</option>';
				}
				$('#movieSelect').html(ListHtml);
				$('#movieSelect').val(selectedMovieCode); // 자동 선택
	            fetchScheduleTime();
				
	            $('#movieSelect').change(function() {
                    selectedMovieCode = $(this).val();
                    getTheater();
                });
				
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
    			const theaterList = data.data;
    			let TheaterHtml ='';
    			for(let i in theaterList) {
    				TheaterHtml += '<option value="'+ theaterList[i].theaterCode +'">'+ theaterList[i].theaterName +'</option>';
    			}
				
    			$('#theaterSelect').html(TheaterHtml);
    			$('#theaterSelect').val(selectedTheaterCode); // 극장 자동 선택
    			fetchScheduleTime();
    			
    			// 극장 선택 시 스케줄을 업데이트하는 함수 호출
    			$('#theaterSelect').change(function() {
                    selectedTheaterCode = $(this).val();
                    fetchScheduleTime();
                });
    		},
    		error: function(jqXHR, textStatus, errorThrown) {
	            console.error('Error fetching movie data:', textStatus, errorThrown);
    		}
    	});
    }
    getTheater();
   
	
	function updateDate() {
        // 오늘 날짜를 기준
        const today = new Date();
        const days = ['일', '월', '화', '수', '목', '금', '토'];
        let optionHtml = '';

        // 7일 동안의 날짜 생성
        for (let i = 0; i < 7; i++) {
            const date = new Date(today);
            date.setDate(today.getDate() + i);

            const dayOfWeek = days[date.getDay()];
            const month = date.getMonth() + 1;
            const day = date.getDate();
            const formattedDate = date.getFullYear() + '-' + (month < 10 ? '0' + month : month) + '-' + (day < 10 ? '0' + day : day);
        
            optionHtml += '<option value="'+ formattedDate + '">' + month + '/' + day + ' (' + dayOfWeek + ')</option>';
        
        }
        $('#dateSelect').html(optionHtml);
        $('#dateSelect').val(selectedTicketDate); // 자동 선택
        
        $('#dateSelect').change(function() {
            fetchScheduleTime();
        });
	}
	
	updateDate();
	
	function fetchScheduleTime() {
		const movie = document.getElementById('movieSelect').value;
	    const theater = document.getElementById('theaterSelect').value;
	    const startdate = document.getElementById('dateSelect').value;
	    const enddate = document.getElementById('dateSelect').value;
		
	    if (movie && theater && startdate && enddate) {
		    $.ajax({
	    		url : 'movieSchedule/schedule/' + movie + '/' + theater + '/' + startdate + '/' + enddate,
	    		method : 'get',
	    		dataType : 'json',
	    		success : function(data) { // data => 
	    			const scheduleResult = document.getElementById('timeSelect');
		            scheduleResult.innerHTML = '';
	    			if (data.data.length > 0) {
		                data.data.forEach(s => {
		                    scheduleResult.innerHTML += '<option value="${s.startTime}" data-screen-code="${s.screenCode}">' + s.startTime + ' ' + s.screenCode + '관</option>'
		                  ;})
		            }
		            else {
		                scheduleResult.innerHTML = '<option>스케줄이 없습니다.</option>';
		            }
	    			$('#timeSelect option:first').prop('selected', true);
	    			displaySelectedMovie();
	    		},
	    		error: function(jqXHR, textStatus, errorThrown) {
	                console.error('Error fetching schedule data:', textStatus, errorThrown);
	    		}
			});
	    }
	}
	
	
	function displaySelectedMovie() {
        const movie = $('#movieSelect option:selected').text();
        const theater = $('#theaterSelect option:selected').text();
        const startDate = $('#dateSelect').val();
        const startTime = $('#timeSelect option:selected').text();
        console.log('Selected Movie:', movie);
        console.log('Selected Theater:', theater);
        console.log('Selected Date:', startDate);
        console.log('Selected Time:', startTime);

        if (movie && theater && startDate && startTime) {
        	console.log('Selected Movie:', movie);
        	console.log('Selected Theater:', theater);
        	console.log('Selected Date:', startDate);
        	console.log('Selected Time:', startTime);
            let infoHtml = '';
            infoHtml += '<p class="card-text">영화 제목: ' + movie + '</p>'
                      + '<p class="card-text">극장: ' + theater + '</p>'
                      + '<p class="card-text">날짜: ' + startDate + '</p>'
                      + '<p class="card-text">시간: ' + startTime + '</p>';

            $('#selectedInfo').html(infoHtml);
        } else {
        	let infoHtml = '';
            infoHtml += '<p class="card-text">영화 제목을 선택하세요 </p>'
                      + '<p class="card-text">극장을 선택하세요 </p>'
                      + '<p class="card-text">날짜를 선택하세요 </p>'
                      + '<p class="card-text">시간을 선택하세요 </p>';

            $('#selectedInfo').html(infoHtml);
        }
    }

    // 페이지 로드 시 초기 한 번 호출
    displaySelectedMovie();

    // 선택 값이 변경될 때마다 호출
    $('#movieSelect, #theaterSelect, #dateSelect, #timeSelect').change(function() {
        displaySelectedMovie();
    });

    
	
	    
});


</script>

</body>
</html>