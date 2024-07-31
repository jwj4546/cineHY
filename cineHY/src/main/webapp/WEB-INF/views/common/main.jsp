<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    #page1 { 
    	padding-top: 80px;
    	background-color: #222;
    	display: flex;
		flex-direction: column;
		text-align: center;
		align-items: center;
    }
    
    #pills-tab { margin-top: 20px; }
    #page2 { 
       	height: 600px;
    	padding-top: 120px;
    }   
    
    .card {
    	background-color: transparent;
    	border: 0px;
    }
    
    .card-img-top {
    	border-radius: 10px;
    	height: 19rem; /* 고정된 높이 설정 */
        object-fit: cover; /* 이미지 자르기 */
    }
    
    .card-img-top:hover {
    	filter: brightness(0.5); 
    }
    
    .nav-link {
    	color: white;
    }
    
    .nav-link:hover {
	    color: #29b9a5;
	}
    
    .nav-link.active {
	    color: #29b9a5;
	    font-weight: 600;
	}
    
</style>
<title>main</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../openTalk/openTalk.jsp"></jsp:include>

	<main>
		<
      <div id="page1">
      
		<ul class="nav mb-3 " id="pills-tab" role="tablist">
		  <li class="nav-item" role="presentation">
		    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">상영중인 영화</button>
		  </li>
		  <li class="nav-item"> <button class="nav-link text-light"> | </button></li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">상영예정작</button>
		  </li>
		</ul>
		
		<div class="tab-content" id="pills-tabContent">
			<!-- 상영중인 영화 -->
			<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
				<div class="album py-5">
					<div class="container">
						<div class="row" id="movieList">
							<!-- 영화 출력 -->
							
						</div>
					</div>
				</div>   
			</div>
				<!-- 상영예정 영화 -->
			<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
			  	<div class="album py-5">
					<div class="container">
						   	<div class="row" id="movieUpList">
						   	<!-- 영화 출력 -->
							
							</div>
					</div>
				</div>   
			</div>  
		</div>
	</div>
	<div id="page2" class="container">
	<div class="row align-items-md-stretch">
		<div class="col-md-6">
			<div class="h-100 p-5 text-white bg-dark rounded-3">
	          <h3>POPCORN & GIFT</h3>
	          	<div class="list-group" id="product-list">
				  <c:forEach items="${ list }" var="product">
				  <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
				    <img src="${ product.changeImage }" alt="twbs" width="50" height="50" class="rounded-circle flex-shrink-0">
				    <div class="d-flex gap-2 w-100 justify-content-between">
				      <div>
				        <h6 class="mb-0"><strong>${ product.productName }</strong></h6>
				        <p class="mb-0 opacity-75"><fmt:formatNumber value="${ product.productPrice }" pattern="#,###" />원</p>
				      </div>
				      <small class="opacity-50 text-nowrap">더보기</small>
				    </div>
				  </a>
				  </c:forEach>
				  
				</div>
	        </div>
		</div>
		<div class="col-md-6">
		    <div class="h-100 p-5 bg-light border rounded-3">
				<h3>공지사항</h3>
				<a href="notiList" class="btn btn-outline-secondary" type="button" >공지사항 보기</a>
				<a href="chatAdmin" class="btn btn-outline-secondary" type="button" >1:1 문의</a>
		    </div>
		</div>
	</div>
      
      </div>
      <div id="page3">
           
      </div>
   </main>

	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
	$(document).ready(function() {
		
	    const movieIdList = []; // DB movieCode 리스트 전역 변수로 선언
	    
	    const getMovieList = () => {
	        return $.ajax({
	            url: 'movieList/movieEnrollList',
	            method: 'GET',
	            dataType: 'json',
	            success: response => {
	                const data = response.data;
	                for (const movieDB of data)
	                movieIdList.push(movieDB.movieCode);
	                
	            },
	            error: function() {
	                console.log('데이터를 불러올 수 없습니다.');
	            }
	        });
	    }
	
	    function fetchMovies() {
	        $.ajax({
	            url: 'movieList/nowPlaying',
	            method: 'GET',
	            dataType: 'json',
	            success: function(data) {
	                displayMovies(data); //상영중인 영화
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.error('영화 데이터를 불러오는 중 오류 발생:', textStatus, errorThrown);
	            }
	        });
	    }
	    
	
	    const displayMovies = (data) => {
	        const movieList = $('#movieList');
	        movieList.empty(); // 기존 내용 비우기
	        const maxDisplayCount = 5; // 총 출력할 영화 최대 수
	        let totalRankMoviesDisplayed = 0; // 총 출력한 영화 수
	        let rank = 1; // 순위 초기화
	        let movieHtml = '';
	        
	        data.forEach((item) => {
	            if (totalRankMoviesDisplayed >= maxDisplayCount) return;

	            if (item.results && item.results.length > 0) {
	                item.results.forEach((movie) => {
	                    if (totalRankMoviesDisplayed >= maxDisplayCount) return;

	                    const movieId = movie.id;
	                    if (movieIdList.includes(movieId)) {
	                        movieHtml += `
	                            <div class="card" style="width: 14rem; position: relative;">
	                                <div class="rank text-light" style="position:absolute; font-size:30px; margin-left:10px; text-shadow: 2px 2px black;">\${rank}</div>
	                                <a href="movieDetails?movieId=\${movieId}">
	                                    <img class="card-img-top" src="https://image.tmdb.org/t/p/w500\${movie.poster_path}" alt="Card image cap">
	                                </a>
	                                <div class="card-body">
	                                    <div class="d-flex justify-content-between align-items-center">
	                                        <div class="btn-group">
	                                            <form action="reservationById" method="get">
	                                                <input type="hidden" name="movieId" value="\${movieId}">
	                                                <button type="submit" class="btn btn-sm btn-danger">예매하기</button>
	                                            </form>
	                                            <small class="text-muted-light">평점 5</small>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>`;
	                        rank++;
	                        totalRankMoviesDisplayed++;
	                    }
	                });
	            }
	        });

	        // Append the generated HTML to the movieList
	        movieList.append(movieHtml);

	        // If no movies were displayed, show a message
	        if (totalRankMoviesDisplayed === 0) {
	            movieList.html('<li>현재 상영 중인 영화가 없습니다.</li>');
	        }
	    };
	
	  //상영예정작 영화 API
	    function fetchUpMovies() {
	        $.ajax({
	            url: 'movieList/upComming',
	            method: 'GET',
	            dataType: 'json',
	            success: function(data) {
	                displayUpMovies(data);
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.error('영화 데이터를 불러오는 중 오류 발생:', textStatus, errorThrown);
	            }
	        });
	    }
	
	    function displayUpMovies(data) {
	        var movieUpList = $('#movieUpList');
	        movieUpList.empty(); // 기존 내용 비우기
	        
	        var totalMoviesDisplayed = 0; // 총 출력한 영화 수
	        var movieHtml = '';

	        for (var j = 0; j < data.length && totalMoviesDisplayed < 5; j++) {
	            if (data[j].results && data[j].results.length > 0) {
	                var upMovies = data[j].results;
	                for (var i = 0; i < upMovies.length && totalMoviesDisplayed < 5; i++) {
	                    var upMovieId = upMovies[i].id;
	                    if (movieIdList.includes(upMovieId)) {
	                        movieHtml += '<div class="card" style="width: 14rem; position: relative;">'
	                            + '<a href="movieDetails?movieId=' + upMovieId + '"><img class="card-img-top" src="https://image.tmdb.org/t/p/w500' + upMovies[i].poster_path + '" alt="Card image cap"></a>'
	                            + '<div class="card-body">'
	                            + '<div class="d-flex justify-content-between align-items-center">'
	                            + '<div class="btn-group">'
	                            + '<form action="reservationById" method="get">'
	                            + '<input type="hidden" value="' + upMovieId + '" name="movieId">'
	                            + '<button type="submit" class="btn btn-sm btn-danger">예매하기</button>'
	                            + '</form>'
	                            + '<small class="text-muted-light">평점 ' + 5 + '</small>'
	                            + '</div>'
	                            + '</div>'
	                            + '</div>'
	                            + '</div>';
	                        totalMoviesDisplayed++; // 출력한 영화 수 증가
	                    }
	                }
	            }
	        }
	        movieUpList.append(movieHtml);

	        // 모든 데이터를 처리한 후, movieUpHtml이 비어 있으면 '현재 상영 중인 영화가 없습니다.' 메시지를 추가
	        if (movieUpList.children().length === 0) {
	            movieUpList.html('<p class="text-center">현재 상영 중인 영화가 없습니다.</p>');
	        }
	    }
	    
	    function fetchProducts() {
            $.ajax({
                url: 'api/products',  // URL to fetch the products
                method: 'GET',
                dataType: 'json',
                success: function(products) {
                    var productList = $('#product-list');
                    productList.empty();  // Clear any existing products
                    var productItem='';
                    $.each(products, function(index, product) {
                    	console.log(products);
                        productItem += '<a href="product-detail?productId=' + product.productId + '" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">'
                            	+ '<img src="' + product.changeImage +'" alt="' + product.productName + '" width="50" height="50" class="rounded-circle flex-shrink-0">'
                                + 	'<div class="d-flex gap-2 w-100 justify-content-between">'
                                + 		'<div>'
                                +        '<h6 class="mb-0"><strong>' +product.productName + '</strong></h6>'
                                +        '<p class="mb-0 opacity-75">' + product.productPrice.toLocaleString() + '원</p>'
                                +   	'</div>'
                                +    '<small class="opacity-50 text-nowrap">더보기</small>'
                                + '</div>'
                            	+ '</a>';
                        
                    });
                    productList.append(productItem);
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching products:', error);
                }
            });
        }
	    
	    getMovieList();
	    fetchMovies();
	    fetchUpMovies();
	    fetchProducts();
	});
	
	
	    
	    
	    
	</script>
</body>
</html>