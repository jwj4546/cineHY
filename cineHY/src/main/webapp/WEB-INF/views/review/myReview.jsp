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
      #pagingArea { width: fit-content; margin: 10px auto; }

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
    }
    .tab__content.active {
    display: block;
    width: 550px;
    }
    .col-md-9 {
        width: 650px;
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
        System.out.println("MyReview JSP received userId: " + userId);
    %>


    <div class="container" id="test01">
    <h4 class="fst-italic" id="title">작성한 리뷰</h4>
    <main role="main" class="container" id="test">
        
            <div id="user_div" class="col-md-3">
                <div class="card" id="cardId">
                    <div class="card-body" id="member_info">
                        <br>
                        <p>${sessionScope.loginUser.userName} 님</p>
                        <br>
                        <ul class="nav nav-tabs">
                            <li id="rr" class="tab__item active">
                                <a id="aa" href="#tab1">작성한 리뷰 : <span id="rcount">0</span>건</a>
                            </li>
                            <li id="rr2" class="tab__item">
                                <a id="aa" href="#tab1">미작성 리뷰 : <span id="ncount">0</span>건</a>
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
                <div id="reviewList">
                	<ul class="pagination"> </ul>
            	</div>
            </div>
            
			<div id="tab2" class="tab__content">
            	<div class="col-md-9">
                    <ul class="reviewList_tab2" >
                        <!-- 리뷰 미작성 조회 AJAX  -->
                    </ul>
                </div>
                    <div id="reviewList">
		                <ul class="pagination_No"> </ul>
		            </div>
                
            </div>
            
    </main>
    
    		
            
    




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
        
        function reviewPage(movieId){
        	
        }
        
        
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

                for (let i in reviews) {
                    let starCount = reviews[i].star;
                    // 별 출력 for문
                    let stars = '';
                    for (let j = 0; j < starCount; j++) {
                        stars += '⭐';
                    }
                    const item = reviews[i];

                    text += '<li class="list_style" style="width: 700px;">' 
                            +    '<a style="width: 700px;" class="d-flex flex-row gap-3 align-items-start py-3 link-body-emphasis text-decoration-none border-bottom" href="#">' 
                            +        '<svg class="bd-placeholder-img" width="120" height="150" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">' 
                            +            '<rect width="100%" height="100%" fill="#777"></rect>' 
                            +       '</svg>' 
                            +        '<div class="col-lg-8" style="width: 500px;">' 
                            +            '<h6 class="mb-0">' + item.movieTitle + '</h6>' 
                            +            '<br>' 
                            +            '<p class="mb-0">' + stars + '</p>' 
                            +            '<p class="mb-0">' + item.reviewContent + '</p>' 
                            +            '<br>' 
                            +            '<small class="text-body-secondary">' + item.userId + ' | ' + item.reviewDate + '</small>' 
                            +        '</div>' 
                            +    '</a>' 
                            +'</li>';
                }
                $('.reviewList').html(text);
                $('#rcount').html(reviews.length);

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
            success: function(data2) {
            	
            	let reviews_No = data2.reviews_No;
                let pageInfo2 = data2.pageInfo2;
                console.log("미작성data2:", data2);
                //let pageInfo = data2.pageInfo;
                console.log("pageInfo2:", pageInfo2);
                
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
                $('#ncount').html(data2.length);
                
                 // 페이징 처리
                let pageText2 = '';
                if (pageInfo2.startPage > 1) {
                	pageText2 += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectNoReview(1)">First</a></li>';
                	pageText2 += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectNoReview(' + (pageInfo2.startPage - 1) + ')">Previous</a></li>';
                }
                
                for (let i = pageInfo2.startPage; i <= pageInfo2.endPage; i++) {
                    if (i === pageInfo2.currentPage) {
                    	pageText2 += '<li class="page-item active"><a class="page-link" href="javascript:void(0);">' + i + '</a></li>';
                    } else {
                    	pageText2 += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectNoReview(' + i + ')">' + i + '</a></li>';
                    }
                }
                
                if (pageInfo2.endPage < pageInfo2.maxPage) {
                	pageText2 += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectNoReview(' + (pageInfo2.endPage + 1) + ')">Next</a></li>';
                	pageText2 += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="selectNoReview(' + pageInfo2.maxPage + ')">Last</a></li>';
                }
                
                
                console.log("pageText:", pageText2); // 페이지 텍스트 확인
                $('.pagination_No').html(pageText2);
                
                
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    }
    
    



    </script>
</body>
</html>