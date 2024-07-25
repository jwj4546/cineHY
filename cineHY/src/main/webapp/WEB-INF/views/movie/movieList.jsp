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
    
    #noMovieLike {
    	margin: 0 auto;
    	width: 200px;
    }
    
    #noMovieLike img { 
    	width: 100%;
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
								<div id="noMovieLike"><img alt="noMovieLike" src="${pageContext.servletContext.contextPath }/resources/images/noMovieLike2.png"></div>
							</c:otherwise>
						</c:choose>
						</div>
					   	<div class="row" id="movieLikeList">
					   		
					   	<!-- 영화 출력 -->
						
						</div>
					</div>
				</div>
			</div>
		</div>
	    
    </main>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <script>
	$(document).ready( () => {
	    var movieIdList = []; // DB movieCode 리스트 전역 변수로 선언
		var movieRatings = {};
	    
	    const getMovieDB = () => {
	        $.ajax({
	            url: 'movieList/movieDB',
	            method: 'GET',
	            dataType: 'json',
	            success: result => {
	                movieIdList = result; // movieIdList에 결과 할당
	            },
	            error: function() {
	                console.log('데이터를 불러올 수 없습니다.');
	            }
	        });
	    }
	    
	    
	    const getMovieRatings = () => {
	        return $.ajax({
	            url: 'movieList/movieEnrollList',
	            method: 'GET',
	            dataType: 'json',
	            success: response => {
	                var data = response.data; // response에서 data 배열 가져오기
	                if (!Array.isArray(data)) {
	                    data = [data]; // data가 배열이 아닌 경우 배열로 변환
	                }
	                data.forEach(movie => {
	                    movieRatings[movie.movieCode] = movie.rating; // movieCode와 rating 매핑
	                });
	            },
	            error: function() {
	                console.log('데이터를 불러올 수 없습니다.');
	            }
	        });
	    }
	    

	    const fetchMovies = () => {
	        $.ajax({
	            url: 'movieList/nowPlaying',
	            method: 'GET',
	            dataType: 'json',
	            success: data => {
	                displayMovies(data);
	                displayLikeMovies(data);
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.error('영화 데이터를 불러오는 중 오류 발생:', textStatus, errorThrown);
	            }
	        });
	    }

	    const displayMovies = (data) => {
	        const movieList = $('#movieList');
	        movieList.empty();
	        let rank = 1;

	        const $fragment = $(document.createDocumentFragment());

	        data.forEach((entry) => {
	            if (entry.results && entry.results.length > 0) {
	                entry.results.forEach((movie) => {
	                    if (movieIdList.includes(movie.id)) {
	                        const rating = movieRatings[movie.id] || 'N/A';
	                        const movieCardHtml = `
	                            <div class="col-md-4">
	                                <div class="card mb-4 box-shadow">
	                                    <div class="rank">No \${rank}</div>
	                                    <img class="card-img-top" src="https://image.tmdb.org/t/p/w500\${movie.poster_path}" alt="\${movie.title} Poster">
	                                    <div class="card-body">
	                                        <h5 class="card-title">\${movie.title}<span class="badge text-bg-dark">\${rating}</span></h5>
	                                        <p class="card-text">\${movie.release_date} 개봉</p>
	                                        <div class="d-flex justify-content-between align-items-center">
	                                            <div class="btn-group">
	                                                <a href="movieDetails?movieId=\${movie.id}" class="btn btn-sm btn-outline-secondary">View</a>
	                                                <form action="reservationById" method="get">
	                                                    <input type="hidden" value="\${movie.id}" name="movieId">
	                                                    <button type="submit" class="btn btn-sm btn-danger">예매하기</button>
	                                                </form>
	                                            </div>
	                                            <small class="text-muted">인기도 ${movie.popularity}</small>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        `;

	                        $fragment.append(movieCardHtml);
	                        rank++;
	                    }
	                });
	            }
	        });

	        movieList.append($fragment);

	        if (movieList.children().length === 0) {
	            movieList.html('<li>현재 상영 중인 영화가 없습니다.</li>');
	        }
	    };
	    

	     
	
	
	    const displayLikeMovies = (data) => {
	        var movieLikeList = $('#movieLikeList');
	        movieLikeList.empty(); // 기존 내용 비우기
	        var promises = [];

	        // DB 회원 선호장르 리스트 전역 변수
	        var MemberGenre1 = '${sessionScope.loginUser.preGenre1}';
	        var MemberGenre2 = '${sessionScope.loginUser.preGenre2}';

	        for (var j = 0; j < data.length; j++) {
	            if (data[j].results && data[j].results.length > 0) {
	                var likeMovies = data[j].results;
	                for (var i = 0; i < likeMovies.length; i++) {
	                    ( movie => {
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
	                                    if (genres.includes(MemberGenre1) || genres.includes(MemberGenre2)) {
	                                        var likeRating = movieRatings[likeMovieId] || 'N/A'; 
	                                        return {
	                                            movie: movie, 
	                                            genres: genres,
	                                            rating: likeRating 
	                                        };
	                                    } else {
	                                        return null;
	                                    }
	                                })
	                            );
	                        }
	                    })(likeMovies[i]);
	                }
	            }
	        }

	        // 모든 AJAX 요청이 완료된 후 처리
	        $.when.apply($, promises).done(function() {
	            let likeResults = Array.prototype.slice.call(arguments);
	            let movieLikeHtml = '';
	            likeResults.forEach(result => {
	                if (result !== null && result.movie) {
	                    let likeMovie = result.movie;
	                    let likeRating = result.rating;
	                    movieLikeHtml += `
	                    <div class="col-md-4">
	                    	<div class="card mb-4 box-shadow">
	                        	<img class="card-img-top" src="https://image.tmdb.org/t/p/w500\${likeMovie.poster_path}" alt="Card image cap">
	                        	<div class="card-body">
	                       		<h5 class="card-title">\${likeMovie.title}<span class="badge text-bg-dark">\${likeRating}</span></h5>
	                        	<p class="card-text">\${likeMovie.release_date} 개봉</p>
	                        	<div class="d-flex justify-content-between align-items-center">
	                        		<div class="btn-group">
	                        			<a href="movieDetails?movieId=\${likeMovie.id}" class="btn btn-sm btn-outline-secondary">View</a>
	                        			<form action="reservationById" method="get">
		                       				<input type="hidden" value="\${likeMovie.id}" name="movieId">
		                       				<button type="submit" class="btn btn-sm btn-danger">예매하기</button>
	                        			</form>
	                        		</div>
	                       			<small class="text-muted">인기도 \${likeMovie.popularity}</small>
                        		</div>
                        	</div>
                        </div>
                    </div>
                    `;
	                }
	            });

	            movieLikeList.append(movieLikeHtml);

	            if (movieLikeList.children().length === 0) {
	                movieLikeList.html('<p class="text-center">추천영화가 없습니다.</p>');
	            }
	        });
	    }
	    
	    
	
	  	//상영예정작 영화 API
	    const fetchUpMovies = () => {
	        $.ajax({
	            url: 'movieList/upComming',
	            method: 'GET',
	            dataType: 'json',
	            success: data => {
	                displayUpMovies(data);
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.error('영화 데이터를 불러오는 중 오류 발생:', textStatus, errorThrown);
	            }
	        });
	    }
	
	    const displayUpMovies = (data) => {
	        const movieUpList = $('#movieUpList');
	        movieUpList.empty();
	        
	     	// 모든 영화 목록을 하나의 배열로 합치기
	        let allMovies = [];
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
			        let movie = groupedMovies[releaseDate][i];
			        let upMovieId = movie.id;
			        let rating = movieRatings[upMovieId] || 'N/A'; // rating 가져오기
			        upMovieHtml += `
			        <div class="col-md-4">
			        	<div class="card mb-4 box-shadow">
			            	<img class="card-img-top" src="https://image.tmdb.org/t/p/w500\${ movie.poster_path}" alt="Card image cap">
			            	<div class="card-body">
			            	<h5 class="card-title">\${ movie.title}<span class="badge text-bg-dark">\${rating}</span></h5>
			            	<p class="card-text">\${ movie.release_date} 개봉</p>
			            	<div class="d-flex justify-content-between align-items-center">
			           			<div class="btn-group">
				           			<a href="movieDetails?movieId=\${upMovieId}" class="btn btn-sm btn-outline-secondary">View</a>
				            		<form action="reservationById" method="get">
					            		<input type="hidden" value="\${upMovieId}" name="movieId">
				            			<button type="submit" class="btn btn-sm btn-danger">예매하기</button>
			            			</form>
			            		</div>
			            		<small class="text-muted">인기도 \${ movie.popularity }</small>
		            		</div>
		           		</div>
	            	</div>
	           </div>
	           `;
			    }
			}

	        movieUpList.append(upMovieHtml);

	        if (movieUpList.children().length === 0) {
	            movieUpList.html('<p class="text-center">현재 상영 중인 영화가 없습니다.</p>');
	        }
	    }
	    
	
	    getMovieDB();
	    getMovieRatings();
	    fetchMovies();
	    fetchUpMovies();
	});
	</script>
    
	</body>
</html>