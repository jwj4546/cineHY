<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.video-container {
        position: relative;
        padding-bottom: 56.25%; /* 16:9 aspect ratio */
        height: 0;
        overflow: hidden;
        max-width: 100%;
    }
    .video-container iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }
    .gallery-item {
        margin-bottom: 20px;
    }
    .gallery-item img {
        max-width: 100%;
        height: auto;
    }
</style>
<title>영화 상세페이지</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
    <main>
    	<div id="page1"></div>
   	 	<div class="row" id="movieDetails">
   	 	
            <div class="col-md-4 mt-5">
                <img src="https://picsum.photos/300/450" class="img-fluid" alt="Movie Poster">
            </div>
            <div class="col-md-8 mt-5">
                <h2 class="mb-4">영화 제목</h2>
                <p class="lead">영화 줄거리 Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum veniam sunt, quia sed error in explicabo.</p>
                <p><strong>개봉일:</strong> 2023-01-01</p>
                <p><strong>감독:</strong> 감독 이름</p>
                <p><strong>출연:</strong> 배우 이름1, 배우 이름2, 배우 이름3</p>
                <p><strong>장르:</strong> 드라마, 로맨스</p>
                <p><strong>관람 등급:</strong> 15세 이상 관람 가능</p>
                <p><strong>상영 시간:</strong> 120분</p>
                <p><strong>평점:</strong> 4.5 / 5.0</p>
                <div class="mt-4">
                    <a href="#" class="btn btn-primary mr-3">예매하기</a>
                    <a href="#" class="btn btn-outline-primary">영화 목록으로 돌아가기</a>
                </div>
            </div>
		</div>
        <hr>
        <div class="row mt-5">
            <div class="col-md-12">
                <h3>트레일러</h3>
            </div>
            <div class="col-md-4 mt-3">
                <div class="video-container">
                    <!-- YouTube Embed 예시 -->
                    <iframe width="560" height="315" src="" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
            <div class="col-md-4 mt-3">
                <div class="video-container">
                    <!-- YouTube Embed 예시 -->
                    <iframe width="560" height="315" src="" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
            <div class="col-md-4 mt-3">
                <div class="video-container">
                    <!-- YouTube Embed 예시 -->
                    <iframe width="560" height="315" src="" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-md-12">
                <h3>스틸컷</h3>
            </div>
            <div class="col-md-3 mt-3">
                <div class="gallery-item">
                    <a href="#">
                        <img src="https://picsum.photos/id/237/300/200" class="img-fluid" alt="Still Image">
                    </a>
                </div>
            </div>
            <div class="col-md-3 mt-3">
                <div class="gallery-item">
                    <a href="#">
                        <img src="https://picsum.photos/id/238/300/200" class="img-fluid" alt="Still Image">
                    </a>
                </div>
            </div>
            <div class="col-md-3 mt-3">
                <div class="gallery-item">
                    <a href="#">
                        <img src="https://picsum.photos/id/239/300/200" class="img-fluid" alt="Still Image">
                    </a>
                </div>
            </div>
            <div class="col-md-3 mt-3">
                <div class="gallery-item">
                    <a href="#">
                        <img src="https://picsum.photos/id/240/300/200" class="img-fluid" alt="Still Image">
                    </a>
                </div>
            </div>
        </div>
    </main>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <script>
    $(document).ready(function() {
        const searchParams = new URLSearchParams(window.location.href);
        const values = searchParams.values();
        console.log(values);
        
        let movieId;  // 외부 변수 선언

        for (var param of searchParams) {
            const parsedMovieId = parseInt(param[1]);
            console.log(parsedMovieId);
            if (!isNaN(parsedMovieId)) {
                movieId = parsedMovieId;  // 외부 변수에 할당
            }
        }
        console.log(movieId);  // 외부 변수 사용
	    function getDetails(movieId) {
	        $.ajax({
	            url: 'movieList/details',
	            method: 'get',
	            dataType: 'json',
	            data: { movie_id: movieId },
	            success: function(data) {
	            	console.log(data);
	                var movieDetails = $('#movieDetails');
	                let InfoHtml = '';
	                InfoHtml += '<div class="col-md-4 mt-5">'
	                    + '<img src="https://image.tmdb.org/t/p/w500' + data.poster_path + '"class="img-fluid" alt="Movie Poster" style="width:300px;">'
	                    + '</div>'
	                    + '<div class="col-md-6 mt-5" >'
	                    + '<h4 class="mb-4">' + data.title + '</h4>'
	                    + '<p>' + data.overview + '</p>'
	                    + '<p><strong>개봉일:</strong>'+ data.release_date + '</p>';
					
	                //장르 문자열 변환
					var genres = data.genres.map(function(genre) {
	                	return genre.name;
	                }).join(',');
	                
	                InfoHtml += '<p><strong>장르:</strong>'+ genres +'</p>';
	               
	                //등급 정보 가져오기
	                $.ajax({
	                    url: 'movieList/rating',
	                    method: 'get',
	                    dataType: 'json',
	                    data: { movie_id: movieId },
	                    success: function(releaseData) {
	                        let rating = 'N/A';
	                        let countries = releaseData.results;
	                        for (let i = 0; i < countries.length; i++) {
	                            if (countries[i].iso_3166_1 === 'KR') {
	                                let releases = countries[i].release_dates;
	                                for (let j = 0; j < releases.length; j++) {
	                                    if (releases[j].certification) {
	                                        rating = releases[j].certification;
	                                        break;
	                                    }
	                                }
	                                break;
	                            }
	                        }
	                        
	                        InfoHtml += '<p><strong>관람 등급:</strong>'+ rating +'</p>'
	                            + '<p><strong>상영 시간:</strong>'+ data.runtime +'분</p>'
	                            + '<p><strong>평점:</strong>'+ data.vote_average +'</p>'
	                            + '<div class="mt-4">'
	                            + '<a href="#" class="btn btn-primary mr-3">등록하기</a>'
	                            + '</div>';
	                    
	                        movieDetails.html(InfoHtml);
	                    },
	                    error: function(jqXHR, textStatus, errorThrown) {
	                        console.error('Error fetching movie rating data:', textStatus, errorThrown);
	                        InfoHtml += '<p><strong>관람 등급:</strong> N/A</p>'
	                            + '<p><strong>상영 시간:</strong>'+ data.runtime +'분</p>'
	                            + '<p><strong>평점:</strong>'+ data.vote_average +'</p>'
	                            + '<div class="mt-4">'
	                            + '<a href="#" class="btn btn-primary mr-3">등록하기</a>'
	                            + '</div>';
	                        movieDetails.html(InfoHtml);
	                    }
	                });
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.error('Error fetching movie data:', textStatus, errorThrown);
	            }
	        });
	    }
	});
    
    </script>
    
</body>
</html>