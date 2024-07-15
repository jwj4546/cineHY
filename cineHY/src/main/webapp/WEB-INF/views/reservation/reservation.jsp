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
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<main>
	<div id="page1"></div>
    <div id="page2" class="container">
	    <div class="text-center mb-4">
	        <button class="btn btn-secondary" style="float: right; margin-left: 10px;">예매 다시하기</button>
	        <button class="btn btn-primary" style="float: right;">상영시간표</button>
	    </div>  
	    <br><br>
        <div class="row mb-3">
            <div class="col">
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-secondary active">
                        <input type="radio" name="options" id="option1" autocomplete="off" checked> 박스오피스 순
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="options" id="option2" autocomplete="off"> 가나다순
                    </label>
                </div>
            </div>
        </div>
        
        <div class="row mb-3">
            <div class="col">
            	<div class="list-group-item list-group-item-info">영화</div>
                <select class="form-control" id="movieSelect" size="10">
                    <option></option>
                </select>
            </div>
            <div class="col">
            	<div class="list-group-item list-group-item-info">극장</div>
                <select class="form-control" id="theaterSelect" size="10">
                    <c:forEach var="theater" items="${theaters}">
                    	<option value="${theater.theaterCode }">${theater.theaterName }</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col">
            	<div class="list-group-item list-group-item-info">날짜</div>
                <select class="form-control" id="dateSelect" size="10">
                    <option>2024-6-19 수</option>
                </select>
            </div>
            <div class="col">
            	<div class="list-group-item list-group-item-info">시간</div>
                <select class="form-control" id="timeSelect" size="10">
                    <option>조회된 스케줄이 없습니다.</option>
                </select>
            </div>
        </div>


        <div class="row">
            <div class="col" style="display: flex;">
                <div class="card" style=" margin-right: 50px;">
                    <div class="card-body">
                        <img src="" alt="">
                        <p class="card-text">영화 제목: 영화선택하면~</p>
                    </div>
                </div>
                <div class="card" >
                    <div class="card-body">
                        <p class="card-text">극장: 극장 선택하면~</p>
                        <p class="card-text">일시: 날짜 선택하면~</p>
                        <p class="card-text">상영관: 시간 선택하면~</p>
                    </div>
                </div>
            </div>
            <div class="col d-flex justify-content-end align-items-center">
                <button class="btn btn-primary mx-2">좌석선택</button>
                <button class="btn btn-danger">취소</button>
            </div>
        </div>
        </div>
    </main>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>

$(document).ready(function() {
	
	const selectedMovieCode = '${movieCode}';
    const selectedTicketDate = '${ticketDate}';
    const selectedScreenCode = '${screenCode}';
    const selectedTheaterCode = '${theaterCode}';
    const selectedStartTime = '${startTime}';
	
	function findAllMovie() {
		
		$.ajax({
			url : 'movieList/movieEnrollList',
			method : 'get',
			dataType : 'json',
			success: function(data) {
				//console.log(data.data);
				const movieTitleList = data.data;
				let ListHtml ='';
				for(let i in movieTitleList) {
					ListHtml += '<option value="'+ movieTitleList[i].movieCode +'">'+ movieTitleList[i].movieTitle +'</option>';
					//console.log(movieTitleList[i].movieTitle);
				}
				$('#movieSelect').html(ListHtml);
				$('#movieSelect').val(selectedMovieCode); // 자동 선택
	            fetchScheduleTime();
				
				$('#movieSelect').change(function() {
			   		fetchScheduleTime();
			    });
				
			},
			error: function(jqXHR, textStatus, errorThrown) {
	            console.error('Error fetching movie data:', textStatus, errorThrown);
	        }
		});
	}

	findAllMovie();
	
	// 극장 선택 시 스케줄을 업데이트하는 함수 호출
    $('#theaterSelect').change(function() {
        fetchScheduleTime();
    });
    $('#theaterSelect').val(selectedTheaterCode); // 극장 자동 선택
	
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
		
	    $.ajax({
    		url : 'movieSchedule/schedule/' + movie + '/' + theater + '/' + startdate + '/' + enddate,
    		method : 'get',
    		dataType : 'json',
    		success : function(data) { // data => 
    			console.log(data);
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
    		}
		});
	}
});


</script>

</body>
</html>