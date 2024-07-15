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
		<div id="page2">
			<div class="container mt-5">
			   <h2 class="mb-4">극장별 영화 스케줄</h2>
			   
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
		                            <td><button class="btn btn-danger btn-sm float-right delete-btn"></button></td>
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
		                            <td><button class="btn btn-danger btn-sm float-right delete-btn"></button></td>
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
		                            <td><button class="btn btn-danger btn-sm float-right delete-btn"></button></td>
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
		                            <td><button class="btn btn-danger btn-sm float-right delete-btn"></button></td>
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
		                            <td><button class="btn btn-danger btn-sm float-right delete-btn"></button></td>
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
		                            <td><button class="btn btn-danger btn-sm float-right delete-btn"></button></td>
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
		                            <td><button class="btn btn-danger btn-sm float-right delete-btn"></button></td>
		                        </tr>
		                    </tbody>
		                </table>
		            </div>
		        </div>
		    </div>
		</div>
	</main>	
    <jsp:include page="../common/footer.jsp"></jsp:include>
    <script>
    
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
        loadSchedule(); // 초기 스케줄 로드
        // 지역 선택 버튼 클릭 이벤트 처리
        $('.btn-group-toggle .btn').on('click', function() {
            $('.btn-group-toggle .btn').removeClass('active');
            $(this).addClass('active');
            $(this).find('input').prop('checked', true);
            loadSchedule();
        });
        // 날짜 탭 클릭 이벤트 처리
        $('.nav-tabs').on('click', 'a.nav-link', function(e) {
            e.preventDefault();
            $(this).tab('show');
            loadSchedule();
        });
    });
    function updateDateTabs() {
        const today = new Date();
        const days = ['일', '월', '화', '수', '목', '금', '토'];
        let tabHtml = '';
        for (let i = 0; i < 7; i++) {
            const date = new Date(today);
            date.setDate(today.getDate() + i);
            const dayOfWeek = days[date.getDay()];
            const month = date.getMonth() + 1;
            const day = date.getDate();
            const formattedDate = date.getFullYear() + '-' + (month < 10 ? '0' + month : month) + '-' + (day < 10 ? '0' + day : day);
            tabHtml += '<li class="nav-item">';
            tabHtml += '<a class="nav-link' + (i === 0 ? ' active' : '') + '" href="#date' + (i + 1) + '" data-toggle="tab" data-date="' + formattedDate + '">';
            tabHtml += month + '/' + day + ' (' + dayOfWeek + ')';
            tabHtml += '</a>';
            tabHtml += '</li>';
        }
        $('.nav-tabs').html(tabHtml);
        $('.nav-tabs a:first').tab('show');
    }
    function loadSchedule() {
        const theaterCode = $('input[name="theater"]:checked').val();
        const selectedTabDate = $('.nav-tabs .nav-link.active').attr('data-date');
        if (!theaterCode || !selectedTabDate) {
            return;
        }
        $.ajax({
            url: 'movieSchedule/AllScheduleList/' + theaterCode + '/' + selectedTabDate,
            method: 'get',
            dataType: 'json',
            success: function(data) {
                displayScheduleForDate(data);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error fetching schedule data:', textStatus, errorThrown);
            }
        });
    }
    function displayScheduleForDate(data) {
        const activeTabId = $('.nav-tabs .nav-link.active').attr('href');
        const scheduleTable = $(activeTabId + ' .schedule-table tbody');
        const selectedTabDate = $('.nav-tabs .nav-link.active').attr('data-date');
        const theaterCode = $('input[name="theater"]:checked').val();
        scheduleTable.empty();
        if (data && data.data.length > 0) {
            data.data.forEach(schedule => {
                const row = '<tr>' +
                                '<td>' + schedule.movieTitle + '</td>' +
                                '<td>' + schedule.screenCode + '</td>' +
                                '<td>' + schedule.startTime + ' - ' + schedule.endTime + '</td>' +
                                '<td>' +
	                                '<form action="reservationFromTheater" method="post">' +
	                                '<input type="hidden" value="' + schedule.movieCode + '" id="tableMovieCode" name="movieCode">' +
	                                '<input type="hidden" value="'+ selectedTabDate +'" name="ticketDate">' +
	                                '<input type="hidden" value="'+ schedule.screenCode +'" name="screenCode">' +
	                                '<input type="hidden" value="'+ theaterCode +'" name="theaterCode">' +
	                                '<input type="hidden" value="'+ schedule.startTime +'" name="startTime">' +
	                                '<input type="hidden" value="'+ schedule.screeningId+'" name="screeningId">' +
	                                '<button class="btn btn-danger btn-sm float-right delete-btn" type="submit">예매</button>' +
	                                '</form>' +
                                '</td>' +
                            '</tr>';
                scheduleTable.append(row);
            });
        } else {
            const noScheduleMessage = '<tr><td colspan="4">선택한 날짜에 해당하는 스케줄이 없습니다.</td></tr>';
            scheduleTable.append(noScheduleMessage);
        }
    }
    </script>
</body>
</html>