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
    .cinema .row {
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
     .reserved {
        background-color: rgb(171, 47, 44); 
        pointer-events: none; 
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
            <button type="button" class="btn btn-light person-btn" id="person" onclick="selectPerson(1)">1</button>
            <button type="button" class="btn btn-light person-btn" id="person" onclick="selectPerson(2)">2</button>
            <button type="button" class="btn btn-light person-btn" id="person" onclick="selectPerson(3)">3</button>
            <button type="button" class="btn btn-light person-btn" id="person" onclick="selectPerson(4)">4</button>
            <button type="button" class="btn btn-light person-btn" id="person" onclick="selectPerson(5)">5</button>
            <button type="button" class="btn btn-light person-btn" id="person" onclick="selectPerson(6)">6</button>
            <button type="button" class="btn btn-light person-btn" id="person" onclick="selectPerson(7)">7</button>
            <button type="button" class="btn btn-light person-btn" id="person" onclick="selectPerson(8)">8</button>
            <div style="border-left: 1px solid#000; margin-left: 50px;padding: 20px;">
                <div><p id="pointName">영화관 지점명 : </p></div>
                <div><p id="startDate">상영일자 : </p></div>
                <div><p id="remainingSeats">남은 좌석 : </p></div>
                <div><p id="startTime">상영시간 / 상영관 : </p></div>
            </div>  
        </div>
        
    </div>
    <br><br><br>

    
    <div class="screen">Screen</div>
    <br><br><br><br><br>
        <div class="cinema">
            <!-- 좌석 출력 A1 ~ J12 -->
        
        </div><br><br>
            
        
        <div class="col d-flex justify-content-end align-items-center">
	        <button class="btn btn-primary mx-2" id="payBtn">결제</button>
	        <button class="btn btn-danger">취소</button>
       	</div>
        
	</main>    
        <br><br><br>
        
        <script>
        	
        	// 페이지가 로드되면 이전 페이지에서 선택한 데이터를 불러옴
        	$(document).ready(function() {
        		console.log(window.sessionStorage.getItem('resInfo'));
        		
        		const resInfo = JSON.parse(window.sessionStorage.getItem('resInfo'));
        		console.log(resInfo);
        		$("#pointName").text("영화관 지점명 : " + resInfo.theaterName);
        		$("#startDate").text("상영일자 : " + resInfo.ticketDate);
        		$("#startTime").text("상영시간 / 상영관 : " + resInfo.startTime);
        		
        		
        		// 알파벳 대문자 A ~ J 배열 생성
        		const row = Array.from({ length : 10}, (v, i) => String.fromCharCode(i + 65));
        		
        		let text = '';
        		
        		// 좌석 출력 반복문
        		for(let char of row) {
        			
        			text += '<div class="row">' +char + '</div>'
                    + '<div class="seat" id="'+ char + '1">1</div>'
                    + '<div class="seat" id="'+ char + '2">2</div>'
                    + '<div class="seat" id="'+ char + '3">3</div>'
                    + '<div class="seat" id="'+ char + '4">4</div>'
                    + '<div class="seat" id="'+ char + '5">5</div>'
                    + '<div class="seat" id="'+ char + '6">6</div>'
                    + '<div class="space"></div>'
                    
                    + '<div class="seat" id="'+ char + '7">7</div>'
                    + '<div class="seat" id="'+ char + '8">8</div>'
                    + '<div class="seat" id="'+ char + '9">9</div>'
                    + '<div class="seat" id="'+ char + '10">10</div>'
                    + '<div class="seat" id="'+ char + '11">11</div>'
                    + '<div class="seat" id="'+ char + '12">12</div>'
        			
        		};
        		$(".cinema").html(text);
        		
        		
        		const screeningId = resInfo.screeningId;
        		const totalSeats = 120;
        		
        		 $.ajax({
        		        url: `reservedSeats`,
        		        method: 'GET',
        		        dataType: 'json',
        		        data: { screeningId },
        		        success: (reservedSeats) => {
        		            const reservedSeatCount = reservedSeats.length;
        		            const remainingSeats = totalSeats - reservedSeatCount;
        		            $('#remainingSeats').text(`남은 좌석: \${remainingSeats}` + `석 / 120석`);
        		            
        		            reservedSeats.forEach(seat => {
        		                $('#' + seat).addClass('reserved').off('click');
        		            });
        		        },
        		        error: (xhr, status, error) => {
        		            console.error('Error fetching reserved seats:', status, error);
        		        }
        		    });
        		});
        		
        	
        	
        	
        	let selectedPerson = 0;

        	function selectPerson(number) {
        	    selectedPerson = number;
        	    $('.person-btn').removeClass('active');
        	    $(event.target).addClass('active');
        	    $('.seat').removeClass('selected');

        	    
        	    // 모든 seat class를 조회하여 click 이벤트를 추가함
        	    $('.seat').off('click').on('click', function() {
        	        const selectedSeats = $('.seat.selected').length;

        	        if (selectedSeats < selectedPerson) {
        	            $(this).toggleClass('selected');
        	        } else if ($(this).hasClass('selected')) {
        	            $(this).removeClass('selected');
        	        }
        	        
        	    });
        	}

            
            
            // 결제 버튼 클릭시
            $("#payBtn").on("click",  function() {
            	
            	const ticketPrice = 100;
				const count = $('.person-btn.active').text();
				const seatNumber = $('.selected');
				const totalPrice = ticketPrice * count;
				
				// 선택한 좌석의 id값을 seatArr에 push
            	const seatArr = new Array();
            	for(let i=0; i<count ; i++) {
            		seatArr.push($(seatNumber[i]).attr('id'));
            	}
            	
            	// 세션에 있는 이전 페이지의 데이터 가공
            	const res = window.sessionStorage.getItem("resInfo");
            	const resInfo = JSON.parse(res);
            	resInfo.seat = seatArr;
            	resInfo.price = totalPrice;
            	
				// sessionStorage에 JSON 형태의 예매 정보와 좌석 정보를 추가
				const seatInfo = JSON.stringify(resInfo);
				window.sessionStorage.setItem('seatInfo', '');
				window.sessionStorage.setItem('seatInfo', seatInfo);
				
				location.href = "payTicket";
            });
        </script>
        
<jsp:include page="../common/footer.jsp"></jsp:include>



</body>
</html>