<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>리뷰상세보기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.content {
	background-color: rgb(237, 249, 255);
	width: 80%;
	margin: auto;
	height: 800px;
}

#test {
	background-color: white;
	width: 1000px;
	height: 1100px;
	margin-top: 50px;
	padding: 20px auto;
}

#test01 {
	background-color: rgb(247, 245, 245);
	height: 1400px;
	margin-top: 100px;
}

#boardList {
	text-align: center;
}

#boardList>tbody>tr:hover {
	cursor: pointer;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}

#searchForm {
	width: 80%;
	margin: auto;
}

#searchForm>* {
	float: left;
	margin: 5px;
}

.select {
	width: 20%;
}

.text {
	width: 53%;
}

.searchBtn {
	width: 20%;
}

.rv {
	display: block;
}

.rv>p {
	margin: 0px;
}

.dd {
	margin: 0px;
	padding-top: 25px;
	padding-right: 0px;
}

.popup-wrap {
	background-color: rgba(0, 0, 0, .7);
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: none;
	padding: 15px;
	z-index: 1000; /* z-index 값 추가 */
}

.popup {
	width: 500px;
	background-color: #ffffff;
	border-radius: 10px;
	overflow: hidden;
	background-color: #ffffff;
	box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, .3);
	margin: auto;
}

.body-contentbox {
	word-break: break-word;
	overflow-y: auto;
	height: 300px;
	text-align: center;
}

.popup-foot {
	width: 100%;
	height: 50px;
}

.pop-btn {
	display: inline-flex;
	width: 49.5%;
	height: 100%;
	float: left;
	justify-content: center;
	align-items: center;
	color: #000000;
	cursor: pointer;
	border-top: 1px solid #000000;
}

.pop-btn.confirm {
	border-right: 1px solid #000000;
}

.star_rating {
	width: 100%;
	align-items: center;
	text-align: center;
	box-sizing: border-box;
	display: inline-flex;
	float: left;
	flex-direction: row;
}

.star_rating .star {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	display: inline-block;
	align-self: center;
	background:
		url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FE2bww%2FbtsviSSBz4Q%2F5UYnwSWgTlFt6CEFZ1L3Q0%2Fimg.png')
		no-repeat;
	background-size: 100%;
	box-sizing: border-box;
}

.star_rating .starUp {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	display: inline-block;
	align-self: center;
	background:
		url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FE2bww%2FbtsviSSBz4Q%2F5UYnwSWgTlFt6CEFZ1L3Q0%2Fimg.png')
		no-repeat;
	background-size: 100%;
	box-sizing: border-box;
}

.star_rating .star.on {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	display: inline-block;
	background:
		url('https://blog.kakaocdn.net/dn/b2d6gV/btsvbDoal87/XH5b17uLeEJcBP3RV3FyDk/img.png')
		no-repeat;
	background-size: 100%;
	box-sizing: border-box;
}
.star_rating .starUp.on {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	display: inline-block;
	background:
		url('https://blog.kakaocdn.net/dn/b2d6gV/btsvbDoal87/XH5b17uLeEJcBP3RV3FyDk/img.png')
		no-repeat;
	background-size: 100%;
	box-sizing: border-box;
}

.star_box {
	width: 400px;
	box-sizing: border-box;
	display: inline-block;
	margin: 15px 0;
	background: #ffffff;
	border: 0.5;
	border-radius: 10px;
	height: 150px;
	resize: none;
	padding: 15px;
	font-size: 13px;
	font-family: sans-serif;
}

.btn02 {
	display: inline-flex;
	width: 250px;
	font-weight: bold;
	border: 0;
	border-radius: 10px;
	max-height: 50px;
	padding: 15px 0;
	font-size: 1.1em;
	text-align: center;
	background: rgb(196, 220, 255);
	float: left;
	cursor: pointer;
}

.btn02.confirm {
	border-right: 1px solid #000000;
}

.right {
	padding-right: 0px;
	text-align: right;
}

#bubble_sp {
	position: absolute;
	background: #d6d6d6;
	border-radius: .4em;
	width: 130px;
	height: 50px;
	display: none;
	justify-content: center;
	align-items: center;
}

#bubble_sp:after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 0;
	height: 0;
	border: 10px solid transparent;
	border-top-color: #d6d6d6;
	border-bottom: 0;
	margin-left: -10px;
	margin-bottom: -10px;
}

#bubble_up {
	position: absolute;
	background: #d6d6d6;
	border-radius: .4em;
	width: 130px;
	height: 100px;
	display: none;
	justify-content: center;
	align-items: center;
}

#bubble_up:after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 0;
	height: 0;
	border: 10px solid transparent;
	border-top-color: #d6d6d6;
	border-bottom: 0;
	margin-left: -10px;
	margin-bottom: -10px;
}

#id2 {
	display: flex;
	justify-content: center;
	align-items: center;
	padding-left: 5px;
}

.info {
	text-align: center;
}

.user_img {
	height: 70px;
	width: 70px;
	border: 1.5px solid #f5f6fa;
}

.user_img_msg {
	height: 40px;
	width: 40px;
	border: 1.5px solid #f5f6fa;
}

.img_cont {
	position: relative;
	height: 70px;
	width: 70px;
	margin-right: 20px;
}

.img_cont_msg {
	height: 40px;
	width: 40px;
}

.user_info>p {
	margin: 0px;
}

#insertmodal-open {
	background-color: rgb(41, 185, 165);
	color: #ffffff;
}
</style>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarCollapse" aria-controls="navbarCollapse"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<a href="#" class="navbar-brand d-flex align-items-center"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="mr-2">
                <rect x="2" y="7" width="20" height="15" rx="2" ry="2"></rect>
                <path d="M16 3l-4 4H3L7 3z"></path>
                <path d="M22 3l-4 4h-9L17 3z"></path>
            </svg> <strong>Cine HY</strong>
				</a>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
					</li>
				</ul>
				<form class="form-inline mt-2 mt-md-0">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
				<ul class="navbar-nav" style="justify-content: flex-end;">
					<li class="nav-item active" style="float: right;"><a
						class="nav-link" href="#">로그인 </a></li>
					<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
				</ul>
			</div>
		</nav>
	</header>



	<div class="container" id="test01">
		<br>
		<br>
		<main role="main" class="container" id="test">

			<br>
			<div class="info">
			<div id="reviewList">로딩 중...</div>
				<h4>|</h4>
			</div>
			<div class="modal-btn-box">
				<c:if test="${ empty sessionScope.ticketNo}">
					<button class="btn" type="button" id="insertmodal-open" style="float: right;">리뷰쓰기</button>
				</c:if>

			</div>
			<div class="popup-wrap" id="insert_popup">
				<div class="popup">
					<form name="starForm" id="starForm" method="post" action="">

						<div class="body-contentbox">
							<p>리뷰작성 폼</p>
							<br>
							<div class="star_rating">
								<span class="star" value="1"> </span> 
								<span class="star" value="2"> </span> 
								<span class="star" value="3"> </span> 
								<span class="star" value="4"> </span> 
								<span class="star" value="5"> </span> 
								<input type="hidden" id="star" name="star" />
							</div>
							<textarea id="textReview" class="star_box" name="reviewContent" placeholder="리뷰 내용을 작성해주세요."></textarea>
						</div>

						<div class="popup-foot">
							<input type="button" class="btn02" id="insert_confirm" onclick="saveReview()" value="리뷰등록" /> 
							<input type="button" class="btn02" id="insert_close" value="취소" />
						</div>
					</form>
				</div>
			</div>
			<div class="popup-wrap" id="update_popup">
				<div class="popup">
					<form name="starForm" id="starForm" method="post" action="">
						<div class="body-contentbox">
							<p>리뷰수정 폼</p>
							<br>
							<div class="star_rating">
								<span class="starUp" value="1"> </span> 
								<span class="starUp"value="2"> </span> 
								<span class="starUp" value="3"> </span> 
								<span class="starUp" value="4"> </span> 
								<span class="starUp" value="5"> </span>
								<input type="hidden" id="starUp" name="star" />
								<input type="hidden" id="reviewNo" name="reviewNo" />
							</div>
							<textarea id="ReviewUpdate" class="star_box" name="reviewContent" placeholder="리뷰를 수정해주세요."></textarea>
						</div>
						<div class="popup-foot">
							<input type="button" class="btn02" id="update_confirm" onclick="Review_Update(13)"  value="리뷰 수정" /> 
							<input type="button" class="btn02" id="update_close" value="취소" />
						</div>
					</form>
				</div>
			</div>
			
			<br>
			<br>
			
			<div>
				<span colspan="3">리뷰(<span id="rcount">0</span>)</span>
			</div>

			<table id="reviewList" class="table table-hover">
				<tbody>
					<%--
                          ajax영역
                    --%>
				</tbody>
			</table>

			<div class="modal-btn-box">
				<c:if test="${not empty sessionScope.loginUser}">
					<button class="btn " type="button" id="insertmodal-open"
						style="float: right;">돌아가기</button>
				</c:if>
			</div>
			<br>
		</main>
		<div id="pagingArea">
			<ul class="pagination">
				<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
					var="p">
					<li class="page-item"><a class="page-link"
						href="boardlist?page=${p}">${p}</a></li>
				</c:forEach>
				<c:choose>
					<c:when test="${pageInfo.currentPage ne pageInfo.maxPage}">
						<li class="page-item"><a class="page-link"
							href="=${pageInfo.currentPage + 1}">다음</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
		<br clear="both">
		<br> <br>
		<br>
	</div>

	<script>
		
		$(() => {
			selectReview();
			
			$("#update_confirm").click(() => {
	            modalClose();
	            enableScroll();
	        });

	        // 업데이트 모달을 열기 위한 이벤트 위임
	        $(document).on('click', '#updatemodal-open', function() {
	            $("#update_popup").css('display', 'flex').hide().fadeIn();
	            disableScroll();
	            $('#reviewNo').val(reviewNo);
	        });

	        $("#update_close").click(() => {
	            modalClose();
	            enableScroll();
	        });

	        function modalClose() {
	            $("#update_popup").fadeOut();
	        }
			
			//setInt
		})
		
		
		let reviewData = [];
	
		//바로 호출되게 하려고 ( 쓰면 업데이트도 되어야함)  !!! 나중에 data의 value에  ${ review.movieCode }  수정하기
		function selectReview() {
		    $.ajax({
		        url: 'selectReview',
		        type: 'get',
		        data: { movieCode: 1 }, 
		        dataType:"json",
		        success: result => {
		            console.log(result);  // json 타입의 배열 출력됨
		            reviewData = result;
		            //console.log(data[key].reviewNo);
		            
		            var reviewListHtml = '';
		            let resultStr = '';
		
		            for (let i = 0; i < result.length; i++) {
		                const review = result[i];
		                resultStr +=  '<tr>'
		                            + '<td class="rv">'
		                            +     '<div class="d-flex bd-highlight">'
		                            +         '<div class="img_cont">'
		                            +             '<img src="https://i.namu.wiki/i/M0j6sykCciGaZJ8yW0CMumUigNAFS8Z-dJA9h_GKYSmqqYSQyqJq8D8xSg3qAz2htlsPQfyHZZMmAbPV-Ml9UA.webp" class="rounded-circle user_img">'
		                            +         '</div>'
		                            +         '<div class="user_info">'
		                            +             '<p>' + review.star + '</p>'
		                            +             '<p id="user_id">' + review.userId + '</p>'
		                            +             '<p>' + review.reviewContent + '</p>'
		                            +         '</div>'
		                            +     '</div>'
		                            + '</td>'
		                            
		                            + '<td class="right">'
		                            +     '<p class="plus" onclick="test(\'' + review.userId + '\')">...</p>'
		                            +     	'<div id="bubble_sp" class="speech-bubble hidden">'
		                            +         	'<input onclick="call_confirm_sp()" class="btn btn-light" type="button" id="id2" value="스포일러 신고">'
		                            +     	'</div>'
		                            
		                            + 		'<div id="bubble_up" class="speech-bubble hidden">'
		                            +     		'<input id="updatemodal-open"  class="btn btn-light" type="button"  value="리뷰 수정">'

		                            +     		'<input class="btn btn-light" type="button" onclick="call_confirm_up_de()" value="리뷰 삭제">'		                            
		                            + 		'</div>'
		                            
		                            +     '<p class="dd">' + review.reviewDate + '</p>'
		                            + '</td>'
		                            
		                           
		                            + '</tr>';
		            } 
		            $('#reviewList tbody').html(resultStr);
		            $('#rcount').html(result.length);
		            $('#reviewList').html(reviewListHtml); 
		        },
		        error: err => {
		            console.error('Error fetching reviews:', err);
		        }
		        
		        
		    });
		    
		    
		}
		    
		    
		
		
		
		// 리뷰쓴 id가 세션의 아이디와 같을 때 => 리뷰 수정, 삭제 버튼
		// 다를때 => 스포일러 신고버튼
		
        window.test = function(reviewUserId) {
        	var offset = $(".plus").offset();
            var loggedInUserId = '${sessionScope.loginUser.userId}'; // 세션의 사용자 ID
            
            if (reviewUserId === loggedInUserId) {
            	$("#bubble_up").css({
                    top: offset.top - $("#bubble_up").outerHeight() - 50,
                    left: offset.left - 60
            	}).toggle();
            } else {
            	$("#bubble_sp").css({
                    top: offset.top - $("#bubble_sp").outerHeight() - 50,
                    left: offset.left - 60
            	}).toggle();
            }
        };
		
		window.call_confirm_sp= function(){
	        if(confirm("리뷰 내용에 스포일러가 포함되어있습니까?")){
	            alert("신고를 완료하였습니다. 내용 확인 후 반영하도록 하겠습니다.");
	        }
	    }
	
		window.call_confirm_up_de= function(){
	        if(confirm("리뷰를 삭세하시겠습니까?")){
	        	$('#reviewNo').val(reviewNo);
	        	deleteById(13);
	            alert("리뷰가 삭제되었습니다.");
	        }
	    }
	
    
    
    	//모달뜨면 스크롤 안되게하는 함수
        function disableScroll() {
            document.body.style.overflow = 'hidden';
        }
        function enableScroll() {
            document.body.style.overflow = 'visible';
        }
        
        function generateStars(starCount) {
            let stars = '';
            for (let i = 0; i < starCount; i++) {
                stars += '★';
            }
            return stars;
        }
        const starsElement = document.getElementById(`review-stars-${review.userId}`);
        //starsElement.innerHTML = generateStars(review.star);
        //starsElement.classList.add('star');
        
        
        //class로 지정된 star을 누르면 id로 지정된 star값의 value값을 
    	document.addEventListener('DOMContentLoaded', function () {
    		
            const stars = document.querySelectorAll('.star');
            const ratingInput = document.getElementById('star');
            
            stars.forEach(star => {
                star.addEventListener('click', function () {
                    const ratingValue = this.getAttribute('value');
                    ratingInput.value = ratingValue;
                });
            });
            
        });
        
		
        
        

        $('.star_rating > .star').click(function () {
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
        });
        $('.star_rating > .starUp').click(function () {
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
        });
        
        //리뷰 추가
        function saveReview(){
        	//빈 문자열이 아닐때만 요청 보낼거임 (빈 게시글작성 막기 위해)trim(): 앞 뒤 공백 제거
        	if($('#textReview').val().trim() != ''){
        		
        		$.ajax({
            		url : 'insertReview',
            		data : {
            			star: $('#star').val(),
            			reviewContent : $('#textReview').val(),
            			userId : '${ sessionScope.loginUser.userId }'
            		},
            		type : 'post',
            		
            		success : function(result)  {
            			console.log(result);
            			
            			$('#boardTitle').text(result.reviewNo);
            			
            			if(result == 'success'){
            				selectReview();
            				$('#textReview').val('');
            			};
            		}
            	});
        	}else {
        		alertify.alert('내용 쓰셈');
        	}
        }
        
        
        //리뷰 수정
        function Review_Update(reviewNo){
        	//const review = reviewData.find(r => r.reviewNo === reviewNo);
        	//const reviewNo = $('#reviewNo').val(); // 수정할 리뷰 번호 가져오기
        	console.log(reviewNo);
        	if($('#ReviewUpdate').val().trim() != ''){
        		
        		$.ajax({
            		url : 'ReviewUpdate',
            		data : {
            			star: $('#starUp').val(),
            			reviewNo : reviewNo ,
            			reviewContent : $('#ReviewUpdate').val(),
            			userId : '${ sessionScope.loginUser.userId }'
            		},
            		type : 'post',
            		
            		success : function(result)  {
            			console.log(result);
            			
            			if(result == 'success'){
            				selectReview();
            				$('#ReviewUpdate').val('');
            			};
            		}
            	});
        	}else {
        		alertify.alert('내용 쓰셈');
        	}
        }
        
		document.addEventListener('DOMContentLoaded', function () {
    		
			const stars = document.querySelectorAll('.starUp');
            const ratingInput = document.getElementById('starUp');
            
            stars.forEach(star => {
                star.addEventListener('click', function () {
                    const ratingValue = this.getAttribute('value');
                    ratingInput.value = ratingValue;
                });
           });
        });
        
   		//리뷰 수정 모달 
	    window.call_confirm_up= function(){
	
            $(() => {
            
            });
   		}
        
         
	            
	   	//리뷰 추가하는 모달 
	    $("#insert_confirm").click(() => {
            modalClose();
            enableScroll();
        });
        $("#insertmodal-open").click(() => {
            $("#insert_popup").css('display', 'flex').hide().fadeIn();
            disableScroll();
        });
        $("#insert_close").click(() => {
            modalClose();
            enableScroll();
        });
        function modalClose() {
            $("#insert_popup").fadeOut();
        }
        
        
        
        //리뷰 삭제
        function deleteById(reviewNo) {
    		
        	 $.ajax({
        	        url: 'deleteReview',
        	        data: {
        	            reviewNo: reviewNo
        	        },
        	        type: 'DELETE',
        	        success: function(response) {
        	            selectReview();
        	        },
        	        error: function(err) {
        	            console.error('Error deleting review:', err);
        	        }
        	    });
    		
    	}
        
    </script>
</body>
</html>
