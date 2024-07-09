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
            <!-- view 버튼 누르면 나오는 부분 -->
            </div>
        </div>
	        
	        <div class="card mb-4" id="Movie-enroll-list-card" style="width: 300px; min-width: 200px;">
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
	                url: 'movieList/nowPlaying',
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
	                      + '<img src="https://image.tmdb.org/t/p/w500' + movies[i].poster_path + '" class="card-img-top" >'
	                      + '<div class="card-body">'
	                      + '<h5 class="card-title">' + movies[i].title + '</h5>'
	                      + '<p class="card-text">' + movies[i].title + '</p>'
	                      + '</div>'
	                      + '<ul class="list-group list-group-flush">'
	                      + '<li class="list-group-item">' + movies[i].release_date + ' 개봉</li>'
	                      + '</ul>'
	                      + '<div class="card-body">'
	                      + '<div class="btn-group">'
	                      + '<button type="button" class="btn btn-sm btn-outline-secondary" onclick="viewDetail('+movieId+')">View</button>'
	                      + '<button type="button" class="btn btn-sm btn-outline-secondary" href="#">등록하기</button>'
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
	                url: 'movieList/details',
	                method: 'get',
	                dataType: 'json',
	                data: { movie_id: movieId },
	                success: function(data) {
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
    
    <script>
        $(document).ready(function() {
            var currentPage = 1;
            function fetchUpMovies(pageUpNo) {
                $.ajax({
                    url: 'movieList/upComming',
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
                          + '<button type="button" class="btn btn-sm btn-outline-secondary" onclick=viewDetail('+ movieId +')>View</button>'
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