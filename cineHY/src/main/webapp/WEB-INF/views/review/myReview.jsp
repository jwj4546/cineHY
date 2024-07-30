<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="theme-color" content="#0093A2">
<title>작성한 리뷰</title>
<meta name="description" content="블로그 템플릿 · 부트스트랩 한국어로">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    

<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      #test01{
        background-color:rgb(247, 245, 245);
        height: 900px;
        margin-top: 100px;

      }

      #title{
        padding-top: 50px;
        padding-left: 50px;
      }

      #test{
        background-color: white;
        height: 600px;
        width: 1000px;
        margin-top: 50px;
        padding: 20px auto;
      }
      #cardId{
        margin: 15px auto;
        height: 200px;
        width: 180px;
      }
      .pagingArea { 
      	width: fit-content;  
      	margin-top:10px ;
      	margin: 0 auto;
      	}
      
      

      #member_info{
        text-align: center;
      }
      #row{
        padding-top: 30px;
      }

    #aa {
        text-decoration: none;
        color: inherit;
    }
    .tab {
    display: flex;
    align-items: center;
    padding: 1rem;
    text-decoration: none;
    }
    .tab__item {
        text-decoration: none;
        display: inline-block;
        text-decoration: none;
        
    }
    .tab__item.active {
    display: inline-block;
    border: 1px solid #6e7b83;
    background-color: #6e7b83;
    color: #fff;
    text-decoration: none;
    }
    .tab__content-wrapper {
    padding: 1rem
    }
    .tab__content {
    display: none;
    width: 550px;
    height: 600px;
    }
    .tab__content.active {
    display: block;
    width: 550px;
    height: 600px;
    }
    .col-md-9 {
        width: 650px;
        height: 650px;
    }
    #review_btn{
      background-color: rgb(41, 185,165);
      color: #ffffff;
    }
    #tab1,#tab2{float: left;}
    #user_div{float: left;}

    .list_style{
    list-style:none;}
      
    </style>

</head>

<body>

	<%
        //userId 가져옴
        String userId = request.getParameter("userId");
        //System.out.println("MyReview JSP received userId: " + userId);
    %>

<div class="container">
    <h4 class="fst-italic" id="title">작성한 리뷰</h4>
    <main role="main" class="container" id="test">
        
            <div id="user_div" class="col-md-3">
                <div class="card" id="cardId">
                    <div class="card-body" id="member_info">
                        <br>
                        <p>${sessionScope.loginUser.userName} 님</p>
                        <br>
                        <ul class="nav nav-tabs">
                            <li id="written" class="tab__item active">
                                
                            </li>
                            <li id="unwritten" class="tab__item">
                               
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div id="tab1" class="tab__content active">
                <div class="col-md-9">
                    <ul class="reviewList">
                        <!-- 리뷰조회 AJAX  -->
                    </ul>
                </div>
                <div class=pagingArea>
                	<ul class="pagination"> </ul>
            	</div>
            </div>
            
			<div id="tab2" class="tab__content">
            	<div class="col-md-9">
                    <ul class="reviewList_tab2" >
                        <!-- 리뷰 미작성 조회 AJAX  -->
                    </ul>
                </div>
                <div class=pagingArea>
		            <ul id="pagination" class="pagination"> </ul>
		        </div>
            </div>
    </main>
    </div>


    <script>
    
    $(document).ready(() => {
        selectMyReview();
        

        const tabItems = document.querySelectorAll(".tab__item");
        const tabContents = document.querySelectorAll(".tab__content");

        tabItems.forEach((item, index) => {
            item.addEventListener("click", (e) => {
                e.preventDefault();

                tabContents.forEach((content) => {
                    content.classList.remove("active");
                });

                tabItems.forEach((item) => {
                	
                    item.classList.remove("active");
                });

                item.classList.add("active");
                tabContents[index].classList.add("active");
                
                if (index === 1) {
                    selectNoReview();
                }
                
            });
        });
        
        
        
        
    });

    function selectMyReview(page = 1) {
        $.ajax({
            url: 'MyReview',
            type: 'GET',
            data: {
                userId: '${sessionScope.loginUser.userId}',
                page: page  // 페이지 번호 추가
            },
            dataType: "json",
            success: function(data) {
                console.log("result:", data);  // 전체 데이터 구조 확인
                let text = '';
                let reviews = data.reviews;
                let pageInfo = data.pageInfo;
                let countMyReview = data.pageInfo.listCount;
                let code='';
                

                for (let i in reviews) {
                    let starCount = reviews[i].star;
                    let stars = '';

                    // 별 출력
                    for (let j = 0; j < starCount; j++) {
                        stars += '⭐';
                    }

                    const item = reviews[i];
                    const code = item.movieCode;
                    console.log("code:", code);

                    // 리뷰 항목 HTML 추가
                     text += '<li class="list_style" style="width: 700px;">'
					        + '<a href="movieDetails?movieId=' + code + '" class="d-flex flex-row gap-3 align-items-start py-3 link-body-emphasis text-decoration-none border-bottom">'
					        + '<div class="poster" id="poster_' + code + '" style="height: 180px; width: 120px; background-color: #f0f0f0;"></div>'
					        + '<div class="col-lg-8" style="width: 500px;">'
					        + '<h6 class="mb-0">' + item.movieTitle + '</h6>'
					        + '<br>'
					        + '<p class="mb-0">' + stars + '</p>'
					        + '<p class="mb-0">' + item.reviewContent + '</p>'
					        + '<br>'
					        + '<small class="text-body-secondary">' + item.userId + ' | ' + item.reviewDate + '</small>'
					        + '</div>'
					        + '</a>'
					        + '</li>';

                    // 비동기적으로 포스터 이미지를 가져와서 HTML에 삽입
                    $.ajax({
                        url: 'movieList/details',
                        type: 'get',
                        dataType: 'json',
                        data: { movie_id: code },
                        success: function(data) {
                            console.log(data);
                            $('#poster_' + code).html('<img src="https://image.tmdb.org/t/p/w500' + data.poster_path + '" style="height:180px; width:auto;"/>');
                        },
                        error: function(xhr, status, error) {
                            console.error("AJAX Error: ", status, error);
                        }
                    });
                }

                // 생성된 HTML을 특정 컨테이너에 추가
                $('.reviewList').html(text);
                
                //리뷰 카운트
                let count = `<a id="aa" href="#tab1">작성한 리뷰 : <span id="reviewCount">\${countMyReview}</span>건</a>`;
				$('#written').html(count);  
		             

                // 페이징 처리
                let pageText = '';
                if (pageInfo.startPage > 1) {
                    pageText += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectMyReview(1)">First</a></li>';
                    pageText += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectMyReview(' + (pageInfo.startPage - 1) + ')">Previous</a></li>';
                }

                for (let i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
                    if (i === pageInfo.currentPage) {
                        pageText += '<li class="page-item active"><a class="page-link" href="javascript:void(0);">' + i + '</a></li>';
                    } else {
                        pageText += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectMyReview(' + i + ')">' + i + '</a></li>';
                    }
                }

                if (pageInfo.endPage < pageInfo.maxPage) {
                    pageText += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectMyReview(' + (pageInfo.endPage + 1) + ')">Next</a></li>';
                    pageText += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectMyReview(' + pageInfo.maxPage + ')">Last</a></li>';
                }

                console.log("pageText:", pageText);  // 페이지 텍스트 확인
                $('.pagination').html(pageText);
                
                
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    }

    $(document).ready(function() {
        selectMyReview();  // 페이지 로드 시 첫 페이지 데이터 로드
        selectNoReview(); 
    });

    
    //미작성리뷰 조회
    function selectNoReview(page = 1) {
        $.ajax({
            url: 'NoReview',
            type: 'GET',
            data: {
               		userId: '${sessionScope.loginUser.userId}',
                	page: page
            },
            dataType: "json",
            success: function(data) {
            	
            	let reviews_No = data.reviews_No;
                let pageInfo_No = data.pageInfoNo;
                let countNoReview = data.pageInfoNo.listCount;
                
                
                
                let Noreview = '';
                
                for (let j in reviews_No) {
                	
                    const item = reviews_No[j];
                    Noreview += '<li class="list_style">'
		            		+	'<a class="d-flex flex-column flex-lg-row  align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-bottom" href="#">'
		                	+		'<svg class="bd-placeholder-img" width="120" height="150" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></svg>'
		                	+		'<div class="col-lg-8">'
		                	+		'<h6 class="mb-0">' + item.movieTitle + '</h6>'
		                	+		'<br>'
		                	+		'<br>'
                            + 		'<button type="button" id="review_btn" class="btn btn-sm" onclick="window.location.href=\'movieDetails?movieId=' + item.movieCode + '\'">리뷰쓰러가기</button>'

		                	+		'<br>'
		                    +       '<small class="text-body-secondary">' + '${sessionScope.loginUser.userId}' + ' | ' + item.paymentTime + '</small>' 
				           
		            		+	'</div>'
		            		+	'</a>'
		     				+'</li>';
                }
                $('.reviewList_tab2').html(Noreview);


                let countNo = `<a id="aa" href="#tab1">미작성 리뷰 : <span id="">\${countNoReview}</span>건</a>`;
                $('#unwritten').html(countNo);  
                
                
                
                 // 페이징 처리
                let pageText_No = '';
                if (pageInfo_No.startPage > 1) {
                	pageText_No += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectNoReview(1)">First</a></li>';
                	pageText_No += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectNoReview(' + (pageInfo2.startPage - 1) + ')">Previous</a></li>';
                }
                
                for (let i = pageInfo_No.startPage; i <= pageInfo_No.endPage; i++) {
                    if (i === pageInfo_No.currentPage) {
                    	pageText_No += '<li class="page-item active"><a class="page-link" href="javascript:void(0);">' + i + '</a></li>';

                    } else {
                    	pageText_No += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectNoReview(' + i + ')">' + i + '</a></li>';
                    }
                }
                
                if (pageInfo_No.endPage < pageInfo_No.maxPage) {
                	pageText_No += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectNoReview(' + (pageInfo2.endPage + 1) + ')">Next</a></li>';
                	pageText_No += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectNoReview(' + pageInfo2.maxPage + ')">Last</a></li>';
                }
                
                
                console.log("pageText_No:", pageText_No); // 페이지 텍스트 확인
                $('#pagination').html(pageText_No);
                
                
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    }
    
    



    </script>
</body>
</html>