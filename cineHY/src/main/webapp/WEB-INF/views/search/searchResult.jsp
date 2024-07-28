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
<title>검색결과</title>
<style>
	#page1 { height: 80px;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
    <main>
    	<div id="page1"></div>
    	
    	<div id="page2">
    		<div class="container mt-5">
			    <h2 class="text-center">검색 결과</h2>
			    
			    <h3>영화 검색결과</h3>
			    <h5>상영중인 영화</h5>
			    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
					<div class="album py-5">
						<div class="container">
						    <div class="row" id="moviePlaying">
							 <!-- 상영중인 영화정보 출력 -->   
							</div>
						</div>
					</div>
				</div>
				
				<h3>영화인 검색결과</h3>
				<div id="moviePeople">
				    <!-- 영화인 정보 출력 -->
			    </div>
				
			</div>
    	
    	</div>
    	
    	
    </main>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>



	<script>
	$(document).ready(function(){
	    const keyword = '<%= request.getAttribute("keyword") %>';
	    var movieIdList = []; // DB movieCode 리스트 전역 변수로 선언
	    var movieRatings = {};
	
	
	    function getMovieRatings() {
	        return $.ajax({
	            url: 'movieList/movieEnrollList',
	            method: 'GET',
	            dataType: 'json'
	        });
	    }
	
	    function searchMovies() {
	        return $.ajax({
	            url: 'movieList/search',
	            method: 'GET',
	            data: { keyword: keyword },
	            dataType: 'json'
	        });
	    }
	
	    const search = () => {
	        Promise.all([getMovieRatings(), searchMovies()])
	            .then(([movieRatingsResults, searchResults]) => {
	                const movieEnrollList = movieRatingsResults.data || [];

	                movieEnrollList.forEach(movie => {
	                    if (movie.movieCode) {
	                        movieIdList.push(movie.movieCode);
	                        movieRatings[movie.movieCode] = movie.rating;
	                    }
	                });

	                const resultsM = searchResults.map(result => result.results).flat();
	                
	                displayPeople(resultsM);
	                displayMovies(resultsM);
	            })
	            .catch(error => {
	                console.error('오류 발생:', error);
	            });
	    }
	
	    // 영화인 정보 출력
	    const displayPeople = (resultsM) => {
		    const moviePeople = $('#moviePeople');
		    moviePeople.empty();
		
		    if (resultsM.length === 0) {
		        moviePeople.html('<p class="text-center">인물 검색 결과가 없습니다.</p>');
		        return;
		    }
		
		    const peopleListHtml = resultsM
		        .filter(people => people && people.media_type === 'person' && !people.adult)
		        .map(people => {
		            const knownFor = people.known_for.slice(0, 3);
		
		            const knownForHtml = knownFor
		                .filter(item => item.media_type === "movie" && !item.genre_ids.includes(10749))
		                .map(item => `
		                    <div class="col-md-4">
		                        <div class="card mb-4 shadow-sm">
		                            <img src="https://image.tmdb.org/t/p/w500\${item.poster_path}" class="card-img-top" alt="영화 포스터">
		                            <div class="card-body">
		                                <p class="card-text"><small class="text-body-secondary">\${item.title}</small></p>
		                            </div>
		                        </div>
		                    </div>
		                `).join('');
		
		            return `
		                <div class="card mb-3" style="max-width: 700px;">
		                    <div class="row g-0">
		                        <div class="col-md-4">
		                            <img src="https://image.tmdb.org/t/p/w500\${people.profile_path}" class="img-fluid rounded-start" alt="moviePeople">
		                        </div>
		                        <div class="col-md-8">
		                            <div class="card-body">
		                                <h5 class="card-title">\${people.name}</h5>
		                                <p class="card-text">\${people.known_for_department}</p>
		                                <div class="row">
		                                    \${knownForHtml}
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            `;
		        }).join('');
		
		    moviePeople.html(peopleListHtml || '<p class="text-center">인물 검색 결과가 없습니다.</p>');
		}
	
	    // 검색결과 중 상영중인 영화정보 출력
	    function displayMovies(resultsM) {
		    const moviePlaying = $('#moviePlaying');
		    moviePlaying.empty();
		    
		    if (resultsM.length === 0) {
		        moviePlaying.html('<p class="text-center">상영중인 영화 결과가 없습니다.</p>');
		        return;
		    }
		    
		    let movieListHtml = '';
		    
		    resultsM.forEach(movie => {
		        if (movie && movieIdList.includes(movie.id)) {
		            const rating = movieRatings[movie.id] || 'N/A';
		            movieListHtml += `
		                <div class="col-md-4">
		                    <div class="card mb-4 box-shadow">
		                        <img class="card-img-top" src="https://image.tmdb.org/t/p/w500\${movie.poster_path}" alt="Card image cap">
		                        <div class="card-body">
		                            <h5 class="card-title">\${movie.title} <span class="badge text-bg-dark">\${rating}</span></h5>
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
		        }
		    });
		    
		    moviePlaying.html(movieListHtml || '<p class="text-center">상영중인 영화 결과가 없습니다.</p>');
		}
	
	    // 페이지가 로드되면 검색을 수행
	    search();
	});
	</script>
</body>
</html>