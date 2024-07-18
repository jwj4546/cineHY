<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	#page1 { height: 80px;}
    .rank {
       background-color: black;
       color: aliceblue;
       text-align: center;
       line-height: 1.5em;
       border-radius: 2px;
       margin-bottom: 3px;
     }
     #page2 {
		height: 200px;
		display: flex;
		justify-content: center;
		flex-direction: column;
		text-align: center;
		align-items: center;
     }
     #MovieList-btn-group {
       margin-top: 50px;
     }
     
     #pills-tab { margin-top: 50px; }
     
     .nav-link { color: grey;}
     .nav-link:hover { color: #29b9a5;}
     .nav-pills .nav-link.active { background-color: #29b9a5; }
     
     .card-img-top {
        height: 32rem; /* 고정된 높이 설정 */
        object-fit: cover; /* 이미지 자르기 */
    }
    
    #pagination-btn {
    	display: flex;
       	align-items: center;
       	justify-content: center;
       	margin-top : 50px;
    }
    
    #likeMovie-title {
    	margin-bottom: 50px;
    	font-weight: 500;
    }
	
}
     
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
    <main>
    	<div id="page1"></div>
    	<div id="page2">
	      	<h2>무비차트</h2>
	    	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">상영중인 영화</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">상영예정작</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">선호도별 추천영화</button>
			  </li>
			</ul>
		</div>
		<div class="tab-content" id="pills-tabContent">
		  <!-- 상영중인 영화 -->
			<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
				<div class="album py-5 bg-light">
					<div class="container">
					   	<div class="row" id="movieList">
					   	<!-- 영화 출력 -->
						
						</div>
					</div>
				</div>   
		  	
			</div>
		 
		<!-- 상영예정 영화 -->
		<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
	  		<div class="album py-5 bg-light">
				<div class="container">
				   	<div class="row" id="movieUpList">
				   	<!-- 영화 출력 -->
					
					</div>
				</div>
			</div>   
		</div>  
		  
		<!-- 선호도별 추천영화 -->
		<div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
			<div class="album py-5 bg-light">
				<div class="container">
					<div id="likeMovie-title" class="text-center">
					<c:choose>
						<c:when test="${not empty sessionScope.loginUser}">
							<h4>${sessionScope.loginUser.userNick}님을 위한 추천영화</h4>
						</c:when>
						<c:otherwise>
							<h4>로그인 후 추천영화 리스트를 확인하세요.</h4>
						</c:otherwise>
					</c:choose>
					</div>
				   	<div class="row" id="movieLikeList">
				   		
				   	<!-- 영화 출력 -->
					
					</div>
				</div>
			</div>
		</div>
	    
    </main>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <script>
	$(document).ready(function() {
	    var movieIdList = []; // DB movieCode 리스트 전역 변수로 선언
		
	    function getMovieDB() {
	        $.ajax({
	            url: 'movieList/movieDB',
	            method: 'GET',
	            dataType: 'json',
	            success: function(result) {
	                console.log(result);
	                movieIdList = result; // movieIdList에 결과 할당
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
	                displayLikeMovies(data); //선호도별 추천영화
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.error('영화 데이터를 불러오는 중 오류 발생:', textStatus, errorThrown);
	            }
	        });
	    }
	    
	
	    function displayMovies(data) {
	        var movieList = $('#movieList');
	       	movieList.empty(); // 기존 내용 비우기
	        var rank = 1; // 순위 초기화
	        for (var j = 0; j < data.length; j++) {
	            if (data[j].results && data[j].results.length > 0) {
	                var movies = data[j].results;
	                var movieHtml = '';
	                for (var i = 0; i < movies.length; i++) {
	                    var movieId = movies[i].id;
	                    if (movieIdList.includes(movieId)) {
	                    	//console.log(movies[i].title);
	                        movieHtml += '<div class="col-md-4">'
	                            + '<div class="card mb-4 box-shadow">'
	                            + '<div class="rank">No ' + rank + '</div>'
	                            + '<img class="card-img-top" src="https://image.tmdb.org/t/p/w500' + movies[i].poster_path + '" alt="Card image cap">'
	                            + '<div class="card-body">'
	                            + '<h5 class="card-title">' + movies[i].title + '</h5>'
	                            + '<p class="card-text">' + movies[i].release_date + ' 개봉</p>'
	                            + '<div class="d-flex justify-content-between align-items-center">'
	                            + '<div class="btn-group">'
	                            + '<a href="movieDetails?movieId=' + movieId + '" class="btn btn-sm btn-outline-secondary">View</a>'
	                            + '<form action="reservationById" method="get">'
	                            + '<input type="hidden" value="' + movieId + '" name="movieId">'
	                            + '<button type="submit" class="btn btn-sm btn-danger">예매하기</button>'
	                            + '</form>'
	                            + '</div>'
	                            + '<small class="text-muted">인기도 ' + movies[i].popularity + '</small>'
	                            + '</div>'
	                            + '</div>'
	                            + '</div>'
	                            + '</div>';
	                        rank++;
	                    }
	                }
	                movieList.append(movieHtml);
	            }
	        }

	        // 모든 데이터를 처리한 후, movieHtml이 비어 있으면 '현재 상영 중인 영화가 없습니다.' 메시지를 추가
	        if (movieList.children().length === 0) {
	            movieList.html('<li>현재 상영 중인 영화가 없습니다.</li>');
	        }
	    }
	    
	    
	    function displayLikeMovies(data) {
	        var movieLikeList = $('#movieLikeList');
	        movieLikeList.empty(); // 기존 내용 비우기
	        var promises = [];

	        // DB 회원 선호장르 리스트 전역 변수
	        var MemberGenre1 = '${sessionScope.loginUser.preGenre1}';
	        var MemberGenre2 = '${sessionScope.loginUser.preGenre2}';
			
	        for (var j = 0; j < data.length; j++) {
	            if (data[j].results && data[j].results.length > 0) {
	                var likeMovies = data[j].results; // 1페이지에 할당된 영화들
	                for (var i = 0; i < likeMovies.length; i++) {
	                    (function(movie) {
	                        var likeMovieId = movie.id; // API 영화ID (movieCode)
	                        if (movieIdList.includes(likeMovieId)) {
	                            promises.push(
	                                $.ajax({
	                                    url: 'movieList/details',
	                                    method: 'get',
	                                    dataType: 'json',
	                                    data: { movie_id: likeMovieId }
	                                }).then(function(movieDetails) {
	                                    var genres = movieDetails.genres.map(function(genre) {
	                                        return genre.name;
	                                    });
	                                    // 회원의 선호 장르와 영화 장르 비교
	                                    if (genres.includes(MemberGenre1) || genres.includes(MemberGenre2)) {
	                                        return {
	                                            movie: movie, // movie[i] 대신 movie 사용
	                                            genres: genres
	                                        };
	                                    } else {
	                                        return null;
	                                    }
	                                })
	                            );
	                        }
	                    })(likeMovies[i]); // IIFE 사용
	                }
	            }
	        }
	       

	        // 모든 AJAX 요청이 완료된 후 처리
	        $.when.apply($, promises).done(function() {
	            var likeResults = Array.prototype.slice.call(arguments);
	            var movieLikeHtml = '';

	            likeResults.forEach(function(result) {
	                if (result !== null && result.movie) {
	                    var likeMovie = result.movie;
	                    movieLikeHtml += '<div class="col-md-4">'
	                        + '<div class="card mb-4 box-shadow">'
	                        + '<img class="card-img-top" src="https://image.tmdb.org/t/p/w500' + likeMovie.poster_path + '" alt="Card image cap">'
	                        + '<div class="card-body">'
	                        + '<h5 class="card-title">' + likeMovie.title + '</h5>'
	                        + '<p class="card-text">' + likeMovie.release_date + ' 개봉</p>'
	                        + '<div class="d-flex justify-content-between align-items-center">'
	                        + '<div class="btn-group">'
	                        + '<a href="movieDetails?movieId=' + likeMovie.id + '" class="btn btn-sm btn-outline-secondary">View</a>'
	                        + '<form action="reservationById" method="get">'
	                        + '<input type="hidden" value="' + likeMovie.id + '" name="movieId">'
	                        + '<button type="submit" class="btn btn-sm btn-danger">예매하기</button>'
	                        + '</form>'
	                        + '</div>'
	                        + '<small class="text-muted">인기도 ' + likeMovie.popularity + '</small>'
	                        + '</div>'
	                        + '</div>'
	                        + '</div>'
	                        + '</div>';
	                }
	            });

	            movieLikeList.append(movieLikeHtml);

	            // 모든 데이터를 처리한 후, movieHtml이 비어 있으면 '현재 상영 중인 영화가 없습니다.' 메시지를 추가
	            if (movieLikeList.children().length === 0) {
	                movieLikeList.html('<p class="text-center">추천영화가 없습니다.</p>');
	            }
	        });
	    }
	    
	    
	
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
	        movieUpList.empty();
	        
	     	// 모든 영화 목록을 하나의 배열로 합치기
	        var allMovies = [];
	        for (var j = 0; j < data.length; j++) {
	            if (data[j].results && data[j].results.length > 0) {
	                allMovies = allMovies.concat(data[j].results);
	            }
	        }

	        // 빠른 날짜 순으로 정렬 (release_date 기준)
	        allMovies.sort(function(a, b) {
	            return new Date(a.release_date) - new Date(b.release_date);
	        });
	        
	     	// 날짜별로 영화 그룹화
	        var groupedMovies = {};
			for (var i = 0; i < allMovies.length; i++) {
			    var releaseDate = allMovies[i].release_date;
			    var upMovieId = allMovies[i].id;
			    
			    if (releaseDate && upMovieId && movieIdList.includes(upMovieId)) {
			        if (!groupedMovies[releaseDate]) {
			            groupedMovies[releaseDate] = [];
			        }
			        groupedMovies[releaseDate].push(allMovies[i]);
			    }
			}
			
			var upMovieHtml = '';
			for (var releaseDate in groupedMovies) {
			    upMovieHtml += '<h3>' + releaseDate + '</h3>';
			    for (var i = 0; i < groupedMovies[releaseDate].length; i++) {
			        var movie = groupedMovies[releaseDate][i];
			        var upMovieId = movie.id;
			        upMovieHtml += '<div class="col-md-4">'
			            + '<div class="card mb-4 box-shadow">'
			            + '<img class="card-img-top" src="https://image.tmdb.org/t/p/w500' + movie.poster_path + '" alt="Card image cap">'
			            + '<div class="card-body">'
			            + '<h5 class="card-title">' + movie.title + '</h5>'
			            + '<p class="card-text">' + movie.release_date + ' 개봉</p>'
			            + '<div class="d-flex justify-content-between align-items-center">'
			            + '<div class="btn-group">'
			            + '<a href="movieDetails?movieId=' + upMovieId + '" class="btn btn-sm btn-outline-secondary">View</a>'
			            + '<form action="reservationById" method="get">'
			            + '<input type="hidden" value="' + upMovieId + '" name="movieId">'
			            + '<button type="submit" class="btn btn-sm btn-danger">예매하기</button>'
			            + '</form>'
			            + '</div>'
			            + '<small class="text-muted">인기도 ' + movie.popularity + '</small>'
			            + '</div>'
			            + '</div>'
			            + '</div>'
			            + '</div>';
			    }
			}

	        // 정렬된 영화 목록 추가
	        movieUpList.append(upMovieHtml);

	        // 모든 데이터를 처리한 후, movieUpHtml이 비어 있으면 '현재 상영 중인 영화가 없습니다.' 메시지를 추가
	        if (movieUpList.children().length === 0) {
	            movieUpList.html('<p class="text-center">현재 상영 중인 영화가 없습니다.</p>');
	        }
	    }
	    
	
	    getMovieDB();
	    fetchMovies();
	    fetchUpMovies();
	});
	</script>
    
	</body>
</html>