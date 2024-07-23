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
#test {
	background-color: white;
	width: 1000px;
	height: 1100px;
	margin-top: 50px;
	padding: 20px auto;
	
}
#test01 {
	
	height: 1400px;
	margin-top: 100px;
}
#pagingArea {
	width: fit-content;
	margin: auto;
}
.rv {
	display: block;
}
.rv>p {
	margin: 0px;
}
.date {
	margin: 0px;
	padding-top: 5px;
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
.reveiw_button {
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
.reveiw_button.confirm {
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
.center1 {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }
        .info {
            display: flex;
            align-items: center;
        }

</style>
</head>
<body>

	<%
    	//movieId 파라미터 읽어옴
	    String movieId = request.getParameter("movieId");
	    //System.out.println("Received movieId: " + movieId);
	%>


	<div class="container" id="test01">
	 <!-- <h2>Reviews for Movie ID: <%= movieId %></h2> -->
		<br>
		<br>
		<main role="main" class="container" id="test">

			
			<div class="center1">
				<br>
				<div class="info" >
					<h2 style="float:left" id="avgInfo"></h2>
					<h2 style="float:left">|</h2>
					<h2 style="float:left" id="avgStar"></h2>
				</div>
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
							<input type="button" class="reveiw_button" id="insert_confirm" onclick="saveReview()" value="리뷰등록" /> 
							<input type="button" class="reveiw_button" id="insert_close" value="취소" />
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
								<input type="hidden" id="getreviewNo" name="reviewNo" />
							</div>
							<textarea id="ReviewUpdate" class="star_box" name="ReviewUpdate" placeholder="리뷰를 수정해주세요."></textarea>
						</div>
						<div class="popup-foot">
							<input type="button" class="reveiw_button" id="update_confirm" onclick="Review_Update()"  value="리뷰 수정" /> 
							<input type="button" class="reveiw_button" id="update_close" value="취소" />
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
                    
                </ul>
            </div>
		<br clear="both">
		<br> <br>
		<br>
	</div>

	<script>
	
	 const movieId = "<%= movieId %>";
     console.log("Movie ID:", movieId);
     
		window.onload =()=>{
			const searchParams = new URLSearchParams(window.location.href);
			let movieId;
		    for (var param of searchParams) {
		        const parsedMovieId = parseInt(param[1]);
		        console.log("parsedMovieId",parsedMovieId);
		        console.log(typeof parsedMovieId);
		        if (!isNaN(parsedMovieId)) {
		            movieId = parsedMovieId;  
		        }
		    }
		    selectReview(movieId);
		}
	
		$(() => {
			$("#update_confirm").click(() => {
	            modalClose();
	            enableScroll();
	        });
	        $("#update_close").click(() => {
	            modalClose();
	            enableScroll();
	        });
	        function modalClose() {
	            $("#update_popup").fadeOut();
	        }
		})
		
		
		
		window.updatemodal_No=function(reviewNo) {
			
		        // 업데이트 모달을 열기 위한 이벤트 위임
		        $(document).on('click', '#updatemodal-open', function() {
		            $("#update_popup").css('display', 'flex').hide().fadeIn();
		            disableScroll();
		            
		            console.log("reviewNo",reviewNo); 
		            getreviewNo = reviewNo;
		            console.log("getreviewNo",getreviewNo); 
		            $('#reviewNo').val(reviewNo);
		        });
			}
		
		
		var starCount = 0;

		// 리뷰 조회
		 function selectReview(movieId, page = 1) {
		     $.ajax({
		         url: 'selectReview',
		         type: 'get',
		         data: { 
		             movieId: movieId,
		             page: page 
		         }, 
		         dataType: "json",
		         success: result => {
		             console.log(result);  // json 타입의 배열 출력됨
		             
		             let reviews = result.reviews;
		             let pageInfo = result.pageInfo;
		             
		             console.log("pageInfo", pageInfo);
		             console.log("reviews", reviews);
		             
		             let resultStr = '';
		             starAvg(movieId);
		             
		             for (let i = 0; i < reviews.length; i++) {
		                 const review = reviews[i];
		                 starCount = review.star;
		                 
		                 // 별 출력 for문
		                 let stars = '';
		                 for (let j = 0; j < starCount; j++) {
		                     stars += '⭐';
		                 }
		                 
		                 resultStr +=  '<tr>'
		                             + '<td class="rv">'
		                             +     '<div class="d-flex bd-highlight">'
		                             +         '<div class="img_cont">'
		                             +             '<img src="https://i.namu.wiki/i/M0j6sykCciGaZJ8yW0CMumUigNAFS8Z-dJA9h_GKYSmqqYSQyqJq8D8xSg3qAz2htlsPQfyHZZMmAbPV-Ml9UA.webp" class="rounded-circle user_img">'
		                             +         '</div>'
		                             +         '<div class="user_info">'
		                             +             '<p>' + stars + '</p>'
		                             + 			  '<input type="hidden" id="stars" name="stars" value="' + stars + '"/>' 
		                             +             '<p>' + review.userId + '</p>'
		                             + 			  '<input type="hidden" id="user_id" name="user_id" value="' + review.userId + '"/>' 
		                             +             '<p>' + review.reviewContent + '</p>'
		                             + 			  '<input type="hidden" id="reviewNo" name="reviewNo" value="' + review.reviewNo + '"/>' 
		                             + 			  '<input type="hidden" id="reviewContent" name="reviewContent" value="' + review.reviewContent + '"/>' 
		                             +         '</div>'
		                             +     '</div>'
		                             + '</td>'
		                             + '<td class="right">'
		                             +     '<p class="plus" onclick="test(\'' + review.userId + '\')">...</p>'
		                             +     	'<div id="bubble_sp" class="speech-bubble hidden">'
		                             +         	'<input onclick="call_confirm_sp()" class="btn btn-light" type="button" id="id2" value="스포일러 신고">'
		                             +     	'</div>'
		                             + 		'<div id="bubble_up" class="speech-bubble hidden">'
		                             +     		'<button class="btn btn-light"  type="button" id="updatemodal-open" onclick="updatemodal_No(\'' + review.reviewNo + '\')"  >리뷰수정2</button>'
		                             +     		'<input class="btn btn-light" type="button" onclick="call_confirm_up_de(\'' + review.reviewNo + '\')" value="리뷰 삭제">'		                            
		                             + 		'</div>'
		                             +     '<p class="date">' + review.reviewDate + '</p>'
		                             + '</td>'
		                             + '</tr>';
		             }
		             //console.log(resultStr);
		             $('#reviewList tbody').html(resultStr);
		             $('#rcount').html(reviews.length);
		             
		             // 페이징 처리
		             let pageText = '';
		             if (pageInfo.startPage > 1) {
		                 pageText += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectReview(' + movieId + ', 1)">First</a></li>';
		                 pageText += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectReview(' + movieId + ', ' + (pageInfo.startPage - 1) + ')">Previous</a></li>';
		             }
		             
		             for (let i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
		                 if (i === pageInfo.currentPage) {
		                     pageText += '<li class="page-item active"><a class="page-link" href="javascript:void(0);">' + i + '</a></li>';
		                 } else {
		                     pageText += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectReview(' + movieId + ', ' + i + ')">' + i + '</a></li>';
		                 }
		             }
		             
		             
		             
		             if (pageInfo.endPage < pageInfo.maxPage) {
		                 pageText += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectReview(' + movieId + ', ' + (pageInfo.endPage + 1) + ')">Next</a></li>';
		                 pageText += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectReview(' + movieId + ', ' + pageInfo.maxPage + ')">Last</a></li>';
		             }
		             
		             console.log("pageText:", pageText); // 페이지 텍스트 확인
		             $('.pagination').html(pageText);
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
	
		window.call_confirm_up_de= function(reviewNo){
	        if(confirm("리뷰를 삭세하시겠습니까?")){
	        	$('#reviewNo').val(reviewNo);
	        	console.log(reviewNo)
	        	deleteById(reviewNo);
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
        
        //class로 지정된 star을 누르면 id로 지정된 star값의 value값을 변수에 할당
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
            			reviewContent : $('#textReview').val(),
            			star: $('#star').val(),
            			userId : '${ sessionScope.loginUser.userId }',
            			movieCode : movieId
            		},
            		type : 'post',
            		
            		success : function(result)  {
            			console.log(result);
            			
            			if(result == 'success'){
            				selectReview(movieId);
            				$('#textReview').val('');
            			};
            		}
            	});
        	}else {
        		alertify.alert('내용 쓰셈');
        	}
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
        
        //리뷰 수정
        function Review_Update(){
        	
        	const reviewNo = $('#reviewNo').val(); //수정모달에서 리뷰번호 받아옴
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
            				selectReview(movieId);
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
        
        
        //리뷰 삭제
        function deleteById(reviewNo) {
    		
        	 $.ajax({
        	        url: 'deleteReview',
        	        data: {
        	            reviewNo: reviewNo
        	        },
        	        type: 'POST',
        	        success: function(response) {
        	            selectReview(movieId);
        	        },
        	        error: function(err) {
        	            console.error('Error deleting review:', err);
        	        }
        	    });
    	}
        
        function generateStars(starCount) {
            let stars = '';
            for (let i = 0; i < Math.floor(starCount); i++) {
                stars += '⭐';
            }
            if (starCount % 1 !== 0) {  // 소수점이 있을 경우 반개 별 추가
                stars += '✨';
            }
            return stars;
        }
        
        
        //평균 별점
        function starAvg(movieId) {
    		
       	 $.ajax({
       	        url: 'starAvg',
       	        data: {
       	        	movieCode: movieId
       	        },
       	        type: 'get',
       	        success: function(response) {
       	        	console.log("response{}", response);
                    $('#avgInfo').html(response);  // avgInfo에 응답값을 넣음

                    let starCount = parseFloat(response); // 필요시 적절히 변환
                    let stars = generateStars(starCount); // 별을 생성하는 함수 호출

                    console.log("stars{}", stars);
                    let starContainer = document.getElementById('avgStar'); // 별을 삽입할 <h2> 요소를 찾음
                    starContainer.innerHTML = stars; // 별을 <h2> 요소에 삽입
                  
       	        },
       	        error: function(err) {
       	            console.error('Error deleting review:', err);
       	        }
       	    });
   		}
       
        
    </script>
</body>
</html>
