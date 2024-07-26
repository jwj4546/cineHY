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
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<main>
	<div id="page1"></div>
    <div id="page2">
    	<div class="container mt-5">
	    	<h2 class="mb-4 text-center">예매하기</h2>
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
	            	<div class="navbar text-light" data-bs-theme="dark">영화</div>
	                <select class="form-control" id="movieSelect" size="10">
	                    <option></option>
	                </select>
	            </div>
	            <div class="col">
	            	<div class="navbar text-light" data-bs-theme="dark" >극장</div>
	                <select class="form-control" id="theaterSelect" size="10">
	                	<option>조회된 영화관이 없습니다.</option>
	                    <%-- <c:forEach var="theater" items="${theaters}">
	                    	<option value="${theater.theaterCode }">${theater.theaterName }</option>
	                    </c:forEach> --%>
	                </select>
	            </div>
	            <div class="col">
	            	<div class="navbar text-light" data-bs-theme="dark">날짜</div>
	                <select class="form-control" id="dateSelect" size="10">
	                    <option>2024-6-19 수</option>
	                </select>
	            </div>
	            <div class="col">
	            	<div class="navbar text-light" data-bs-theme="dark">시간</div>
	                <select class="form-control" id="timeSelect" size="10">
	                    <option>조회된 스케줄이 없습니다.</option>
	                </select>
	            </div>
	        </div>
	
	
	        <div class="row">
	            <div class="col" style="display: flex;">
	                <div class="card" style=" margin-right: 50px;">
	                    <div class="card-body" id="selectedInfo">
	                        	<p class="card-text">영화 제목: </p>
	                        	<p class="card-text">극장: </p>
	                        	<p class="card-text">날짜: </p>
	                        	<p class="card-text">시간: </p>
	                    </div>
	                </div>
	                
	            </div>
	            <div class="col d-flex justify-content-end align-items-center">
	                <button class="btn btn-primary mx-2" id="seatBtn">좌석선택</button>
	                <button class="btn btn-danger">취소</button>
	            </div>
	        </div>
	        </div>
        </div>
    </main>
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
   
	
	const updateDate = () => {
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
	
	const fetchScheduleTime = () => {
		const movie = document.getElementById('movieSelect').value;
	    const theater = document.getElementById('theaterSelect').value;
	    const startdate = document.getElementById('dateSelect').value;
	    const enddate = document.getElementById('dateSelect').value;
		
	    if (movie && theater && startdate && enddate) {
		    $.ajax({
	    		url : 'movieSchedule/schedule/' + movie + '/' + theater + '/' + startdate + '/' + enddate,
	    		method : 'get',
	    		dataType : 'json',
	    		success : data => { // data => 
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
	    		error: (jqXHR, textStatus, errorThrown) => {
	                console.error('Error fetching schedule data:', textStatus, errorThrown);
	    		}
			});
	    }
	}
	
	
	const displayScheduleForDate= (data) => {
	    const activeTabId = $('.nav-tabs .nav-link.active').attr('href');
	    const scheduleTable = $(`${activeTabId} .schedule-table tbody`);
	    const selectedTabDate = $('.nav-tabs .nav-link.active').attr('data-date');
	    const theaterCode = $('input[name="theater"]:checked').val();
	    scheduleTable.empty();
	    if (data && data.data.length > 0) {
	        data.data.forEach(schedule => {
	            const row = `
	                <tr>
	                    <td>
	                        \${schedule.movieTitle}
	                        <span class="badge text-bg-dark">\${schedule.rating}</span>
	                    </td>
	                    <td>\${schedule.screenCode}</td>
	                    <td>\${schedule.startTime} - \${schedule.endTime}</td>
	                    <td>
	                        <form action="reservationFromTheater" method="post">
	                            <input type="hidden" value="\${schedule.movieCode}" id="tableMovieCode" name="movieCode">
	                            <input type="hidden" value="\${selectedTabDate}" name="ticketDate">
	                            <input type="hidden" value="\${schedule.screenCode}" name="screenCode">
	                            <input type="hidden" value="\${theaterCode}" name="theaterCode">
	                            <input type="hidden" value="\${schedule.startTime}" name="startTime">
	                            <input type="hidden" value="\${schedule.screeningId}" name="screeningId">
	                            <button class="btn btn-danger btn-sm float-right delete-btn" type="submit">예매</button>
	                        </form>
	                    </td>
	                </tr>
	            `;
	            scheduleTable.append(row);
	        });
	    } else {
	        const noScheduleMessage = '<tr><td colspan="4">선택한 날짜에 해당하는 스케줄이 없습니다.</td></tr>';
	        scheduleTable.append(noScheduleMessage);
	    }
	}

    // 페이지 로드 시 초기 한 번 호출
    displaySelectedMovie();

    // 선택 값이 변경될 때마다 호출
    $('#movieSelect, #theaterSelect, #dateSelect, #timeSelect').change(function() {
        displaySelectedMovie();
    });

    
	
	    
});

// 좌석선택 버튼 클릭시 선택한 데이터를 sessionStorage에 저장 후 좌석 페이지로 이동
$("#seatBtn").on("click", function() {
	
	
	const movieCode = $('#movieSelect option:selected');
    const theaterName = $('#theaterSelect option:selected');
    const startDate = $('#dateSelect');
    const startTime = $('#timeSelect option:selected');
    const movie = $('#movieSelect option:selected').text();
    const theater = $('#theaterSelect option:selected').text();
    
    if(movieCode.val() !== 0 && theaterName.val() !== "" && startDate.val() !== "" && startTime.text() !== "") {
    	
    	const res = {
    			movieCode : movieCode.val(),
    			theaterCode : theaterName.val(),
    			ticketDate : startDate.val(),
    			startTime : startTime.text(),
    			movieName : movie,
    			theaterName : theater
    	};
    	console.log(res);
    
    
    const resInfo = JSON.stringify(res);
    console.log(resInfo);
    window.sessionStorage.setItem('resInfo', '');
    window.sessionStorage.setItem('resInfo', resInfo);
    location.href = "seat";
    }
    else {
    	alert("모든 항목을 선택해줘잉");
    }
});


</script>

</body>
</html>