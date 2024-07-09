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
    .rank {
       background-color: crimson;
       color: aliceblue;
       margin-bottom: 5px;
       text-align: center;
       line-height: 1.5em;
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
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
    <main>
    	<div id="page1"></div>
    	<div id="page2">
	      	<h2>박스오피스</h2>
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
		  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
		  	<div class="album py-5 bg-light">
		    	<div class="container">
		        	<div class="row" id="movieList">
		        	<!-- 영화 출력 -->
		        	
		        	</div>
	        </div>
		  </div>   
		  	<nav aria-label="Page navigation example">
			  <ul class="pagination" id="pagination-btn">
			    <li class="page-item" id="p-pageNo"><a class="page-link" href="#" onclick="previousPage()">Previous</a></li>
			    <li class="page-item" id="pageNo"><a class="page-link" href="#" onclick="nextPage()">Next</a></li>
			  </ul>
			</nav>
		  </div>
		  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">...</div>
		  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">...</div>
		  <div class="tab-pane fade" id="pills-disabled" role="tabpanel" aria-labelledby="pills-disabled-tab" tabindex="0">...</div>
		</div>
	    
    </main>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
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
                    movieHtml += '<div class="col-md-4">'
                      + '<div class="card mb-4 box-shadow">'
                      + '<div class="rank">No1</div>'
                      + '<img class="card-img-top" src="https://image.tmdb.org/t/p/w500' + movies[i].poster_path + '" alt="Card image cap" >'
                      + '<div class="card-body">'
                      + '<h5 class="card-title">' + movies[i].title + '</h5>'
                      + '<p class="card-text">' + movies[i].release_date + ' 개봉</p>'
                      + '<div class="d-flex justify-content-between align-items-center">'
                      + '<div class="btn-group">'
                      + '<button type="button" class="btn btn-sm btn-outline-secondary" onclick="viewDetail('+movieId+')">View</button>'
                      + '<button type="button" class="btn btn-sm btn-outline-secondary" href="#">등록하기</button>'
                      + '</div>'
                      + '<small class="text-muted">9 mins</small>'
                      + '</div>'
                      + '</div>'
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
    });
    </script>
</body>
</html>