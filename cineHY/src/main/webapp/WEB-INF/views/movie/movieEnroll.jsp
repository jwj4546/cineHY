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
       .movies {
           width : 1200px;
           margin : auto;
           display: flex;
           flex-wrap: wrap;
           gap : 30px;
       }
       #page2 { 
           display: flex;
           flex-direction: column;
           align-items: center;
       }
       .Movie-enroll-title {
           text-align: center;
       }
       .Movie-enroll-title h2 {
           line-height: 1.7em;
           margin-top: 10px;
       }
       #pills-tab {
           margin-top: 50px;
           margin-bottom: 50px;
       }
       #page3 {
       display: flex;
       align-items: center;
       justify-content: center;
       margin-top: 50px;
       background-color: #eeeee4;
       padding-bottom : 80px;
    }
    
    #listbutton {
    	margin : 20px auto;
    }
    
    #pagination-btn {
    	display: flex;
       	align-items: center;
       	justify-content: center;
       	margin-top : 50px;
    }
    
    #Movie-enroll-list-card {
    	margin-top: 50px;
    	margin-bottom: 150px;
    }
    
</style>
<title>영화 등록 페이지</title>
</head>
<body>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
    <main>
    <div id="page1"></div>
    <div id="page2">
        <div>
            <div class="Movie-enroll-title">
                <h2 class="mb-4">영화 등록</h2>
            </div>
            <form class="form-inline mt-2 mt-md-0">
                <span class="input-group-text">영화검색</span>
                <input type="text" class="form-control">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
            </form>
        </div>
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button">박스오피스</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button">상영예정작</button>
            </li>
        </ul>
        <br/>
        <div class="tab-content" id="pills-tabContent">
            <hr/>
            <div class="tab-pane fade show active" id="pills-home" role="tabpanel">
                <ul id="movieList" class="movies"></ul>
                <div>${pageNo }</div>
                <nav aria-label="...">
                    <nav aria-label="Page navigation example">
					  <ul class="pagination" id="pagination-btn">
					    <li class="page-item" id="p-pageNo"><a class="page-link" href="#" onclick="previousPage()">Previous</a></li>
					    <li class="page-item" id="pageNo"><a class="page-link" href="#" onclick="nextPage()">Next</a></li>
					  </ul>
					</nav>
                </nav>
            </div>
            <div class="tab-pane fade" id="pills-profile" role="tabpanel">
                <hr/>
                 <ul id="movieUpList" class="movies"></ul>
                  <nav aria-label="...">
                    <nav aria-label="Page navigation example">
					  <ul class="pagination" id="pagination-btn">
					    <li class="page-item"><a class="page-link" href="#" onclick="previousUpPage()">Previous</a></li>
					    <li class="page-item"><a class="page-link" href="#" onclick="nextUpPage()">Next</a></li>
					  </ul>
					</nav>
                </nav>
            </div>
        </div>
    </div>
    <br>
    <hr>
    <br>
    <div id="page3">
	    <div>
	    <h2 class="mb-4">선택한 영화</h2>
	    <br><br><br>
	        <div class="row" id="movieDetails">
            <div class="col-md-4 mt-5">
                <img src="https://picsum.photos/300/450" class="img-fluid" alt="Movie Poster">
            </div>
            <div class="col-md-6 mt-5" >
                <h4 class="mb-4">영화 제목</h4>
                <p class="lead">영화 줄거리 Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum veniam sunt, quia sed error in explicabo.</p>
                <p><strong>개봉일:</strong> 2023-01-01</p>
                <p><strong>감독:</strong> 감독 이름</p>
                <p><strong>출연:</strong> 배우 이름1, 배우 이름2, 배우 이름3</p>
                <p><strong>장르:</strong> 드라마, 로맨스</p>
                <p><strong>관람 등급:</strong> 15세 이상 관람 가능</p>
                <p><strong>상영 시간:</strong> 120분</p>
                <p><strong>평점:</strong> 4.5 / 5.0</p>
                <div class="mt-4">
                    <a href="#" class="btn btn-primary mr-3">등록하기</a>
                </div>
            </div>
        </div>
        </div>
        <div class="card mb-4" id="Movie-enroll-list-card" style="width: 20rem;">
            <ul class="list-group list-group-flush">
            	<li class="list-group-item text-primary"><p><strong>등록한 영화</strong></p></li>
                <li class="list-group-item">인사이드 아웃</li>
                <li class="list-group-item">핸섬가이즈</li>
                <li class="list-group-item">매드맥스 사가</li>
                <li class="list-group-item">매드맥스 사가</li>
                <li class="list-group-item">매드맥스 사가</li>
                <li class="list-group-item">매드맥스 사가</li>
                <li class="list-group-item">매드맥스 사가</li>
                <li class="list-group-item">매드맥스 사가</li>
                <li class="list-group-item">매드맥스 사가</li>
                <li class="list-group-item">매드맥스 사가</li>
                <li class="list-group-item">매드맥스 사가</li>
            </ul>
            <div id="listbutton" class="mt-3">
            <button type="button" class="btn btn-primary btn-sm">조회하기</button>
            <button type="button" class="btn btn-secondary btn-sm">삭제하기</button>
        	</div>
        </div>
        
    </div>
    </main>
    
    <script>
        $(document).ready(function() {
            var currentPage = 1;
            function fetchMovies(pageNo) {
                $.ajax({
                    url: 'movieEnroll/nowPlaying',
                    method: 'get',
                    dataType: 'json',
                    data: { pageNo: pageNo },
                    success: function(data) {
                        displayMovies(data);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Error fetching movie data:', textStatus, errorThrown);
                    }
                });
            }

            function displayMovies(data) {
                var movieList = $('#movieList');
                movieList.empty();
                if (data.results && data.results.length > 0) {
                    const movies = data.results;
                    let movieHtml = '';
                    for(let i in movies) {
                    	const movieId = movies[i].id;
                        movieHtml += '<div class="card" style="width: 12rem;">'
                          + '<img src="https://image.tmdb.org/t/p/w500' + movies[i].poster_path + '" class="card-img-top">'
                          + '<div class="card-body">'
                          + '<h5 class="card-title">' + movies[i].title + '</h5>'
                          + '<p class="card-text">' + movies[i].title + '</p>'
                          + '</div>'
                          + '<ul class="list-group list-group-flush">'
                          + '<li class="list-group-item">' + movies[i].release_date + ' 개봉</li>'
                          + '</ul>'
                          + '<div class="card-body">'
                          + '<div class="btn-group">'
                          + '<button type="button" class="btn btn-sm btn-outline-secondary" onclick=viewDetail('+movieId+')>View</button>'
                          + '<button type="button" class="btn btn-sm btn-outline-secondary" href>등록하기</button>'
                          + '</div>'
                          + '</div>'
                          + '</div>';
                    }
                    movieList.html(movieHtml);
                } else {
                    movieList.append('<li>No movies currently playing.</li>');
                }
            }

            function changePage(pageNo) {
                currentPage = pageNo;
                fetchMovies(pageNo);
            }

            window.changePage = changePage;
            window.nextPage = function() {
                changePage(currentPage + 1);
            }
            window.previousPage = function() {
            	changePage(currentPage - 1);				
			}

            fetchMovies(currentPage);
            
            window.viewDetail = function(movieId) {
            	
                $.ajax({
                    url: 'movieEnroll/details',
                    method: 'get',
                    dataType: 'json',
                    data: { movie_id: movieId },
                    success: function(data) {
                    	displayMovieDetails(data);
                    	console.log(data);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Error fetching movie data:', textStatus, errorThrown);
                    }
                });
            }
            
            function displayMovieDetails(data) {
                var movieDetails = $('#movieDetails');
                movieDetails.empty();
                if (data.results && data.results.length > 0) {
                    const Info = data.results;
                    let InfoHtml = '';
                    for(let i in details) {
                    	InfoHtml += '<div class="col-md-4 mt-5">'
                          + '<img src="https://image.tmdb.org/t/p/w500' + details[i].poster_path + '"class="img-fluid" alt="Movie Poster">'
                          + '</div>'
                          + '<div class="col-md-6 mt-5" >'
                          + '<h4 class="mb-4">' + details[i].title + '</h4>'
                          + '<p class="lead">' + details[i].overview + '</p>'
                          + '<p><strong>개봉일:</strong>'+ details[i].release_date + '</p>'
                          + '<p><strong>감독:</strong>'
                          + '<p><strong>출연:</strong>' + details[i].release_date + ' 개봉</li>'
                          + '<p><strong>장르:</strong>'+ details[i].genres +'</p>'
                          + '<p><strong>관람 등급:</strong>'+  +'</p>'
                          + '<p><strong>상영 시간:</strong>'+ details[i].runtime +'</p>'
                          + '<p><strong>평점:</strong>'+ +'</p>'
                          + '<div class="mt-4">'
                          + '<a href="#" class="btn btn-primary mr-3">등록하기</a>'
                          + '</div>';
                    }
                    movieDetails.html(InfoHtml);
                } else {
                	movieDetails.append('<li>No movies selected</li>');
                }
            }
            
            
        });
        
       
        
        
    </script>
    
    <script>
        $(document).ready(function() {
            var currentPage = 1;
            function fetchUpMovies(pageUpNo) {
                $.ajax({
                    url: 'movieEnroll/upComming',
                    method: 'get',
                    dataType: 'json',
                    data: { pageNo: pageUpNo },
                    success: function(data) {
                        displayUpMovies(data);
                        console.log(data.results)
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Error fetching movie data:', textStatus, errorThrown);
                    }
                });
            }

            function displayUpMovies(data) {
                var movieList = $('#movieUpList');
                movieList.empty();
                if (data.results && data.results.length > 0) {
                    const movies = data.results;
                    let movieHtml = '';
                    for(let i in movies) {
                        movieHtml += '<div class="card" style="width: 12rem;">'
                          + '<img src="https://image.tmdb.org/t/p/w500' + movies[i].poster_path + '" class="card-img-top">'
                          + '<div class="card-body">'
                          + '<h5 class="card-title">' + movies[i].title + '</h5>'
                          + '<p class="card-text">' + movies[i].title + '</p>'
                          + '</div>'
                          + '<ul class="list-group list-group-flush">'
                          + '<li class="list-group-item">' + movies[i].release_date + ' 개봉</li>'
                          + '</ul>'
                          + '<div class="card-body">'
                          + '<div class="btn-group">'
                          + '<button type="button" class="btn btn-sm btn-outline-secondary" onclick=viewDetail()>View</button>'
                          + '<button type="button" class="btn btn-sm btn-outline-secondary" href>등록하기</button>'
                          + '</div>'
                          + '</div>'
                          + '</div>';
                    }
                    movieList.html(movieHtml);
                } else {
                    movieList.append('<li>No movies currently playing.</li>');
                }
            }

            function changeUpPage(pageUpNo) {
                currentPage = pageUpNo;
                fetchUpMovies(pageUpNo);
            }

            window.changeUpPage = changeUpPage;
            window.nextUpPage = function() {
                changeUpPage(currentPage + 1);
            }
            window.previousUpPage = function() {
            	changeUpPage(currentPage - 1);				
			}

            fetchUpMovies(currentPage);
        });
    </script>
    	
   
    		
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>