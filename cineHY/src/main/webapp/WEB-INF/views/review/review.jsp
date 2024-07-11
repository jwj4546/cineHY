<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>리뷰상세보기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color: rgb(237, 249, 255);
            width: 80%;
            margin: auto;
            height: 800px;
        }

        #test{
        background-color: white;
        width: 1000px;
        height: 1100px;
        margin-top: 50px;
        padding: 20px auto;
      }
      #test01{
        background-color: rgb(247, 245, 245);
        height: 1400px;
        margin-top: 100px;

      }
        #boardList { text-align: center; }
        #boardList > tbody > tr:hover { cursor: pointer; }
        #pagingArea { width: fit-content; margin: auto; }
        #searchForm {
            width: 80%;
            margin: auto;
        }
        #searchForm > * {
            float: left;
            margin: 5px;
        }
        .select { width: 20%; }
        .text { width: 53%; }
        .searchBtn { width: 20%; }
        .rv {
            display: block;
        }
        .rv > p {
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
            background: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FE2bww%2FbtsviSSBz4Q%2F5UYnwSWgTlFt6CEFZ1L3Q0%2Fimg.png') no-repeat;
            background-size: 100%;
            box-sizing: border-box;
        }
        .star_rating .star.on {
            width: 25px;
            height: 25px;
            margin-right: 10px;
            display: inline-block;
            background: url('https://blog.kakaocdn.net/dn/b2d6gV/btsvbDoal87/XH5b17uLeEJcBP3RV3FyDk/img.png') no-repeat;
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

        #bubble_up{
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
        #id2{
            display: flex;
            justify-content: center;
            align-items: center;
            padding-left: 5px;
        }
        .info{
            text-align: center;
        }

        .user_img{
			height: 70px;
			width: 70px;
			border:1.5px solid #f5f6fa;
		
		}
		.user_img_msg{
			height: 40px;
			width: 40px;
			border:1.5px solid #f5f6fa;
		
		}
        .img_cont{
                position: relative;
                height: 70px;
                width: 70px;
                margin-right: 20px;
        }
        .img_cont_msg{
                height: 40px;
                width: 40px;
        }
        .user_info > p{
            margin: 0px;
        }
        #insertmodal-open{
        background-color: rgb(41, 185,165);
        color: #ffffff;
        }
    </style>
</head>
<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
          
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <a href="#" class="navbar-brand d-flex align-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" 
                stroke-linecap="round" stroke-linejoin="round" class="mr-2">
                <rect x="2" y="7" width="20" height="15" rx="2" ry="2"></rect>
                <path d="M16 3l-4 4H3L7 3z"></path>
                <path d="M22 3l-4 4h-9L17 3z"></path>
            </svg>
              <strong>Cine HY</strong>
            </a>
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
              </li>
            </ul>
            <form class="form-inline mt-2 mt-md-0">
              <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <ul class="navbar-nav" style="justify-content: flex-end;">
                <li class="nav-item active" style="float: right;">
                  <a class="nav-link" href="#">로그인 </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">회원가입</a>
                </li>
            </ul>
          </div>
        </nav>
      </header>




    <div class="container" id="test01">
        <br><br>
        <main role="main" class="container" id="test" >
 
            <br>
            <div class="info">
                <h4>|</h4>
            </div>
            <div class="modal-btn-box">
                    <c:if test="${ empty sessionScope.ticketNo}">
                    <button class="btn" type="button" id="insertmodal-open" style="float:right;"  >리뷰쓰기</button>
                	</c:if>
                
               
            </div>
            <div class="popup-wrap" id="insert_popup">
                <div class="popup">
	                <form name="starForm" id="starForm" method="post" action="" >
	                
	                
	                    <div class="body-contentbox">
	                        <p>리뷰작성 폼</p><br>
		                        <div class="star_rating">
		                            <span  class="star"  value="1" > </span>
		                            <span  class="star"  value="2" > </span>
		                            <span  class="star"  value="3" > </span>
		                            <span  class="star"  value="4" > </span>
		                            <span  class="star"  value="5" > </span>
		                            <input type="hidden" id="star" name="star"  />
		                        </div>
	                        <textarea id="textReview" class="star_box" name="reviewContent" placeholder="리뷰 내용을 작성해주세요."></textarea>
	                    </div>
	                    
	                    
	                    <div class="popup-foot">
	                        <input type="button" class="btn02" id="insert_confirm" onclick="saveReview()" value="리뷰등록"/>
	                        <input type="button" class="btn02" id="insert_close" value="취소"/>
	                    </div>
	                </form>
                </div>
            </div>
            <div class="popup-wrap" id="update_popup">
                <div class="popup">
                    <div class="body-contentbox">
                        <p>리뷰수정 폼</p><br>
                        <div class="star_rating">
                            <span class="star1 on" value="1"> </span>
                            <span class="star1" value="2"> </span>
                            <span class="star1" value="3"> </span>
                            <span class="star1" value="4"> </span>
                            <span class="star1" value="5"> </span>
                        </div>
                        <textarea class="star_box" placeholder="리뷰를 수정해주세요."></textarea>
                    </div>
                    <div class="popup-foot">
                        <input type="submit" class="btn02" id="update_confirm" value="리뷰 수정"/>
                        <input type="submit" class="btn02" id="update_close" value="취소"/>
                    </div>
                </div>
            </div>
            <br><br>
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
                    <button class="btn " type="button" id="insertmodal-open" style="float:right;"  >돌아가기</button>
                </c:if>
            </div>
            <br>
        </main>
            <div id="pagingArea">
                <ul class="pagination">
                    <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                    <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="p">
                        <li class="page-item">
                            <a class="page-link" href="boardlist?page=${p}">${p}</a>
                        </li>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${pageInfo.currentPage ne pageInfo.maxPage}">
                            <li class="page-item"><a class="page-link" href="=${pageInfo.currentPage + 1}">다음</a></li>
                        </c:when>
                    </c:choose>
                </ul>
            </div>
            <br clear="both"><br>
            
            <br><br>
        </div>
    
    <script>
    
    	
    
    
    
        $(() => {
            $('#searchForm option[value="${condition}"]').prop('selected', true);
            
            
            
        });
        
        function disableScroll() {
            document.body.style.overflow = 'hidden';
        }
        function enableScroll() {
            document.body.style.overflow = 'visible';
        }
        
        
        function setStar() {
          	 document.getElementById('starValue').value = point;
          	 console.log(point);
          	 console.log(2222);
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
        
        
        
        
        $(() => {
        

       
        
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
        
        
        
        $(() => {
    		selectReview();
    		//setInt
    	})
    
    
    	//바로 호출되게 하려고 ( 쓰면 업데이트도 되어야함)  !!! 나중에 data의 value에  ${ review.movieCode }  수정하기
    	function selectReview(){
    		
    		$.ajax({
    			url : 'selectReview',
    			type :'get',
    			data : {
    				movieCode : 1
    			},
    			
    			success : result => {
    				console.log(result);  //json타입의 배열 출력됨
    				
    				let resultStr ='';
    				
    				for(let i in result){
    					resultStr += 	'<tr>'
					                    +'<td class="rv">'
					                    +	    '<div class="d-flex bd-highlight">'
					                    +    	     '<div class="img_cont">'
					                    +        	     '<img src="https://i.namu.wiki/i/M0j6sykCciGaZJ8yW0CMumUigNAFS8Z-dJA9h_GKYSmqqYSQyqJq8D8xSg3qAz2htlsPQfyHZZMmAbPV-Ml9UA.webp" class="rounded-circle user_img">'
					                    +            '</div>'
					                    +            '<div class="user_info">'
					                    +                '<p>' +result[i].star +'</p>'
					                    +                '<p>' +result[i].userId +'</p>'
					                    +           	 '<p>' +result[i].reviewContent +'</p>'
					                    +    	     '</div>'
					                    +	    '</div>'
					                    +'</td>'
					                    +'<td class="right">'
					                    +	'<p class="plus" onclick="test()">...</p>'
					                    
					                    +'<div id="bubble_sp"  class="speech-bubble hidden">'
                                        +	'<input onclick="call_confirm_sp()" class="btn btn-light" type="button" id="id2" value="스포일러 신고">'
                                        +'</div>'
					                    +	'<p class="dd">' +result[i].reviewDate +'</p>'
					                    +'</td>'
					                    
					                    +'<div id="bubble_up"  class="speech-bubble hidden">'
					                    +	'<input onclick="call_confirm_up_de()" class="btn btn-light" type="button" value="리뷰 삭제">'
					                    +	'<input onclick="call_confirm_up()" class="btn btn-light" type="button"  id="updatemodal-open" value="리뷰 수정">'
                                        +'</div>'

                                        
					                    +'</tr>'
					                    
					                };
    				
    				
    				$('#reviewList tbody').html(resultStr);
    				$('#rcount').html(result.length);
    			}
    			
    			
    			
    		});
    		var i=0;
    		window.test= function() {
                var offset = $(".plus").offset();
                if(i=0){
                	$("#bubble_up").css({
                        top: offset.top - $("#bubble_sp").outerHeight() - 5,
                        left: offset.left - 10
                	}).toggle();
                }else{
                	$("#bubble_up").css({
                        top: offset.top - $("#bubble_sp").outerHeight() - 50,
                        left: offset.left - 60
                	
                	}).toggle();
                }
                
                
                
            }
    		
    		window.call_confirm_sp= function(){
    	    	
    	        if(confirm("리뷰 내용에 스포일러가 포함되어있습니까?")){
    	            alert("신고를 완료하였습니다. 내용 확인 후 반영하도록 하겠습니다.");
    	        }
    	    }
    	
    		window.call_confirm_up_de= function(){
    	
    	        if(confirm("리뷰를 삭세하시겠습니까?")){
    	            alert("리뷰가 삭제되었습니다.");
    	        }
    	    }
    	
    	    function call_confirm_up(){
    	
    	        $(() => {
    	        $("#update_confirm").click(() => {
    	                modalClose();
    	                enableScroll();
    	            });
    	
    	            $("#updatemodal-open").click(() => {
    	                $("#update_popup").css('display', 'flex').hide().fadeIn();
    	                disableScroll();
    	            });
    	            $("#update_close").click(() => {
    	                modalClose();
    	                enableScroll();
    	            });
    	            function modalClose() {
    	                $("#update_popup").fadeOut();
    	            }
    	        });
    	    }
    	}
    	
    	/* window.test= function() {
            const offset = $(this).offset();
            $("#bubble_sp").css({
                top: offset.top - $("#bubble_sp").outerHeight() - 5,
                left: offset.left - 60
            }).toggle();
        } */
    	
   
    
    document.addEventListener('DOMContentLoaded', function() {
		
    });
	    
	    
    
   
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
        
        

        function test() {
            const offset = $(this).offset();
            $("#bubble_sp").css({
                top: offset.top - $("#bubble_sp").outerHeight() - 5,
                left: offset.left - 60
            }).toggle();
        }
        
        

        $(".plusTest").click(function() {
            const offset = $(this).offset();
            $("#bubble_up").css({
                top: offset.top - $("#bubble_sp").outerHeight() - 50,
                left: offset.left - 60
            }).toggle();
        });
    });
    
    
    
    </script>
</body>
</html>
