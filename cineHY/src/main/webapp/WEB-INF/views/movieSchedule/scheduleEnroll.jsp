<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #page2 { height: 900px;}
   	.mt-4 { margin-top: 1.5rem; }
    .mt-5 { margin-top: 3rem; }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<main>
    	<div id="page1"></div>
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
                <div class="form-group col-md-4">
                    <label for="theaterSelect">영화관 선택</label>
                    <select id="theaterSelect" class="form-control">
                        <option value="">영화관을 선택하세요</option>
                        <option>강남</option>
                        <option>강서</option>
                        <option>종로</option>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label for="dateSelect">상영날짜</label>
                    <input type="date" id="dateSelect" class="form-control">
                </div>
            </div>
            <button type="button" class="btn btn-primary mb-4" onclick="fetchSchedule()">조회하기</button>
        </form>

        <div id="scheduleResult" class="mt-4"></div>

        <form id="registerForm">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="screenSelect">상영관 선택</label>
                    <select id="screenSelect" class="form-control" onchange="updateSchedule()">
                        <option value="">상영관을 선택하세요</option>
                        <option value="1">1관</option>
                        <option value="2">2관</option>
                        <option value="3">3관</option>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label for="startTime">상영시작시간</label>
                    <input type="time" id="startTime" class="form-control" onchange="updateSchedule()">
                </div>
                <div class="form-group col-md-4">
                    <label for="endTime">상영종료시간</label>
                    <input type="time" id="endTime" class="form-control" onchange="updateSchedule()">
                </div>
            </div>
        </form>

        <div id="registerSchedule" class="mt-4">
            <h4>등록할 상영 스케줄</h4>
            <div id="newScheduleInfo"></div>
            <button type="button" class="btn btn-success" onclick="registerSchedule()">등록하기</button>
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
    
        function fetchSchedule() {
            const movie = document.getElementById('movieSelect').value;
            const theater = document.getElementById('theaterSelect').value;
            const date = document.getElementById('dateSelect').value;

            if (!movie || !theater || !date) {
                alert('영화, 영화관, 상영날짜를 모두 선택해주세요.');
                return;
            }
			
            $.ajax({
	    		url : 'movieSchedule/schedule/' + movie + '/' + theater + '/' + date,
	    		method : 'get',
	    		dataType : 'json',
	    		success : function(data) {
	    			console.log(data)

		            const scheduleResult = document.getElementById('scheduleResult');
		            scheduleResult.innerHTML = '';
		
		            if (result.length > 0) {
		                result.forEach(s => {
		                    scheduleResult.innerHTML += `
		                        <div class="card mt-2">
		                            <div class="card-body">
		                                <h5 class="card-title">${s.date} 상영 스케줄</h5>
		                                <p class="card-text">영화관: ${s.theater}</p>
		                                <p class="card-text">영화: ${s.movie}</p>
		                                <p class="card-text">상영관: ${s.screen}</p>
		                                <p class="card-text">시간: ${s.startTime} - ${s.endTime}</p>
		                            </div>
		                        </div>
		                    `;})
		                }
		            else {
		                scheduleResult.innerHTML = '<p>선택한 날짜에 해당 영화의 스케줄이 없습니다.</p>';
		            }
	        	}
	        });
        }
 
        function updateSchedule() {
            const movie = document.getElementById('movieSelect').value;
            const theater = document.getElementById('theaterSelect').value;
            const date = document.getElementById('dateSelect').value;
            const screen = document.getElementById('screenSelect').value;
            const startTime = document.getElementById('startTime').value;
            const endTime = document.getElementById('endTime').value;

            const newScheduleInfo = document.getElementById('newScheduleInfo');

            if (movie && theater && date && screen && startTime && endTime) {
                newScheduleInfo.innerHTML = `
                    <div class="card mt-2">
                        <div class="card-body">
                            <h5 class="card-title">${date} 등록할 상영 스케줄</h5>
                            <p class="card-text">영화관: ${theater}</p>
                            <p class="card-text">영화: ${movie}</p>
                            <p class="card-text">상영관: ${screen}</p>
                            <p class="card-text">시간: ${startTime} - ${endTime}</p>
                        </div>
                    </div>
                `;
            } else {
                newScheduleInfo.innerHTML = '<p>등록할 스케줄 정보를 모두 입력해주세요.</p>';
            }
        }
        
        function registerSchedule() {
            const movie = document.getElementById('movieSelect').value;
            const theater = document.getElementById('theaterSelect').value;
            const date = document.getElementById('dateSelect').value;
            const screen = document.getElementById('screenSelect').value;
            const startTime = document.getElementById('startTime').value;
            console.log(startTime);
            const endTime = document.getElementById('endTime').value;

            if (!movie || !theater || !date || !screen || !startTime || !endTime) {
                alert('모든 옵션을 선택해주세요.');
                return;
            }

            // 실제로는 서버에 요청을 보내서 스케줄을 등록해야 함.
            alert('상영 스케줄이 등록되었습니다.');

            // 등록 후 폼 초기화
            document.getElementById('scheduleForm').reset();
            document.getElementById('registerForm').reset();
            document.getElementById('newScheduleInfo').innerHTML = '';
            document.getElementById('scheduleResult').innerHTML = '';
        } 
    </script>
    </main>

    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>