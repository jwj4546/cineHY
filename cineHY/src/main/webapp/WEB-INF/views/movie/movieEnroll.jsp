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
    
    #selectedMovie {
    	display: flex;
    	margin-top: 50px;
    }
    
    #movieDetails { 
    	width: 800px;
    }
    
    .list-group-item:hover {
    background-color: #f0f0f0; /* 호버 시 배경색 변경 */
    cursor: pointer; /* 커서 모양 변경 */
	}

	.list-group-item.active {
	    background-color: #007bff; /* active 시 배경색 변경 */
	    color: white; /* active 시 글자색 변경 */
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
		    <div class="container" id="selectedMovie">
			    <div>
				    <h2 class="mb-4">선택한 영화</h2>
				    <br><br><br>
			        <div class="row" id="movieDetails">
		            <!-- view 버튼 누르면 나오는 부분 -->
		            </div>
		        </div>
		        
		        <div class="card mb-4" id="Movie-enroll-list-card" style="width: 35rem; min-width: 200px;">
		            <ul class="list-group list-group-flush" id="movieEnrollList">
		            	
		                <!-- 등록된 영화 리스트 출력 -->
		            </ul>
		            <div id="listbutton" class="mt-3">
		        	</div>
		        </div>
	        </div>
        </div>
    </main>



    <script>
	    
	   	const movieIdList = [];
	   	const movieNow = [];
	   	const movieUp = [];
	   	
	   	$(() => {
	   	    findAll();
	   	    fetchMovies(currentPage);
	   	    
	   	    
	   	});
	        
	   	const findAll = () => {
	   	    $.ajax({
	   	        url: 'movieList/movieEnrollList',
	   	        method: 'GET',
	   	        dataType: 'json',
	   	        success: (data) => {
	   	            const movieEList = data.data;
	   	            console.log(movieEList);
	   	            
	   	            // Populate movieIdList with movie codes
	   	            for (const movieDB of movieEList) {
	   	                movieIdList.push(movieDB.movieCode);
	   	            }
	   	            if (!Array.isArray(movieEList)) {
	   	                movieEList = [movieEList]; // Convert to array if not already
	   	            }
	   	            
	   	            // Fetch movies for now playing and upcoming
	   	             fetchMoviesForD(() => {
		                fetchUpMoviesForD(() => {
		                    // Filter movieNow and movieUp to include only IDs in movieIdList
		                    const commonMovieNow = movieNow.filter(id => movieIdList.includes(id));
		                    const commonMovieUp = movieUp.filter(id => movieIdList.includes(id));
		                    
		                    //console.log("Common movieNow (in movieIdList): ", commonMovieNow);
		                    //console.log("Common movieUp (in movieIdList): ", commonMovieUp);
		
		                    // Display common movies
		                    //displayMovies(commonMovieNow, '#nowPlayingList');
		                    //displayMovies(commonMovieUp, '#upComingList');
		                });
		            });

	   	            let ListHtml = '';
	   	            console.log("movieIdList : ", movieIdList);
	   	            ListHtml += '<li class="list-group-item" style="font-size:25px; color:white; background-color:#29b9a5;"><p>등록한 영화</p></li>';
	   	            for (let i in movieEList) {
	   	                ListHtml += '<li class="list-group-item" data-code="' + movieEList[i].movieCode + '">'
	   	                          + movieEList[i].movieTitle 
	   	                          + '<button class="btn btn-secondary btn-sm float-right delete-btn" onclick="viewDetailFromList(' + movieEList[i].movieCode + ')">view</button>'
	   	                          + '</li>';
	   	            }
	   	            
	   	            $('#movieEnrollList').html(ListHtml);
	   	            
	   	            $('#movieEnrollList .list-group-item').hover(
	   	                function() {
	   	                    $(this).addClass('hover');
	   	                }, 
	   	                function() {
	   	                    $(this).removeClass('hover');
	   	                });
	   	        },
	   	        error: function(jqXHR, textStatus, errorThrown) {
	   	            console.error('Error fetching movie data:', textStatus, errorThrown);
	   	        }
	   	    });
	   	}

	   	const fetchMoviesForD = (callback) => {
	   	    $.ajax({
	   	        url: 'movieList/nowPlaying',
	   	        method: 'GET',
	   	        dataType: 'json',
	   	        success: data => {
	   	            data.forEach((entry) => {
	   	                if (entry.results && entry.results.length > 0) {
	   	                    entry.results.forEach((movie) => {
	   	                        movieNow.push(movie.id);
	   	                    });
	   	                }
	   	            });
	   	            if (callback) callback();
	   	        },
	   	        error: function(jqXHR, textStatus, errorThrown) {
	   	            console.error('영화 데이터를 불러오는 중 오류 발생:', textStatus, errorThrown);
	   	        }
	   	    });
	   	}

	   	const fetchUpMoviesForD = (callback) => {
	   	    $.ajax({
	   	        url: 'movieList/upComming',
	   	        method: 'GET',
	   	        dataType: 'json',
	   	        success: data => {
	   	            data.forEach((entry) => {
	   	                if (entry.results && entry.results.length > 0) {
	   	                    entry.results.forEach((movie) => {
	   	                        movieUp.push(movie.id);
	   	                    });
	   	                }
	   	            });
	   	            if (callback) callback();
	   	        },
	   	        error: function(jqXHR, textStatus, errorThrown) {
	   	            console.error('영화 데이터를 불러오는 중 오류 발생:', textStatus, errorThrown);
	   	        }
	   	    });
	   	}
		    
		    
		    
	   	const movieCheckForInsert = () => {
	   	    return $.ajax({
	   	        url: 'movieList/movieEnrollList',
	   	        method: 'GET',
	   	        dataType: 'json'
	   	    }).then(data => {
	   	        const movieEList = data.data;

	   	        if (Array.isArray(movieEList)) {
	   	            movieEList.forEach(movieDB => movieIdList.push(movieDB.movieCode));
	   	        } else {
	   	            console.warn("Unexpected data format:", movieEList);
	   	        }
	   	    }).catch(xhr => {
	   	        console.error("Error occurred while getting the list:", xhr);
	   	        return $.Deferred().reject(); // Ensure the insert process doesn't proceed
	   	    });
	   	};

	   	const insert = () => {
	   	    const requestData = {
	   	        movieCode: $('#movieCode').val(),
	   	        movieTitle: $('#movieTitle').val(),
	   	        genre: $('#genre').val(),
	   	        summary: $('#summary').val(),
	   	        runningTime: $('#runningTime').val(),
	   	        rating: $('#rating').val(),
	   	        openedDate: $('#openedDate').val(),
	   	        status: $('#status').val()
	   	    };

	   	    movieCheckForInsert().then(() => {
	   	        console.log("Updated movieIdList:", movieIdList); // Log the movieIdList after it's been updated
	   	        
	   	        const movieCode = requestData.movieCode;
	   	        if (movieIdList.includes(movieCode)) {
	   	            alert("이미 등록된 영화입니다.");
	   	        } else {
	   	            $.ajax({
	   	                url: "movieList/movieInsert",
	   	                type: "post",
	   	                contentType: "application/json",
	   	                data: JSON.stringify(requestData),
	   	                dataType: "json",
	   	                success: function(response) {
	   	                    if (response.message === '서비스요청성공') {
	   	                        findAll();
	   	                        alert("영화가 상영리스트에 등록되었습니다.");
	   	                    } else {
	   	                        alert("영화 등록에 실패했습니다.");
	   	                    }
	   	                },
	   	                error: function(xhr, status, error) {
	   	                    console.error("Error occurred while inserting movie:", error);
	   	                    alert("해당 영화를 추가할 수 없습니다.");
	   	                }
	   	            });
	   	        }
	   	    });
	   	};
	    
	    const deleteMovie = () => {
	    	
	    	confirm("삭제하시겠습니까?");
	    	
	    	const requestData = {
		            movieCode: $('#movieCode').val(),
		            movieTitle: $('#movieTitle').val(),
		            genre: $('#genre').val(),
		            summary: $('#summary').val(),
		            runningTime: $('#runningTime').val(),
		            rating: $('#rating').val(),
		            openedDate: $('#openedDate').val(),
		            status: $('#status').val()
		        };
			
			$.ajax ({
				url : "movieList/delete",
				type : 'put',
				data : JSON.stringify(requestData),
				contentType : 'application/json',
				success : data => {
					alert("영화가 리스트에서 삭제되었습니다.")
					findAll();
					$('#movieDetails').empty();
				},
				error: function(xhr, status, error) {
	                console.error("Error occurred while deleting movie:", error);
	            }
			});
			
		}
	    	
    	
    	
        let currentPage = 1;
        const fetchMovies = (pageNo) => {
            $.ajax({
                url: 'movieList/nowPlaying/Admin',
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
	        
	
        const changePage = (pageNo) => {
            currentPage = pageNo;
            fetchMovies(pageNo);
        }

        window.changePage = changePage;
        window.nextPage = () => {
            changePage(currentPage + 1);
        }
        window.previousPage = () => {
        	changePage(currentPage - 1);				
		}

        fetchMovies(currentPage);
        
        
        const displayMovies = (data) => {
	        const movieList = $('#movieList');
	        movieList.empty();

	        if (data.results && data.results.length > 0) {
	            const movies = data.results;
	            let movieHtml = '';
	            movies.forEach(movie => {
	                const movieId = movie.id;
	                movieHtml += `
	                    <div class="card" style="width: 12rem;">
	                        <img src="https://image.tmdb.org/t/p/w500\${movie.poster_path}" class="card-img-top">
	                        <div class="card-body">
	                            <h5 class="card-title">\${movie.title}</h5>
	                            <p class="card-text">\${movie.title}</p>
	                        </div>
	                        <ul class="list-group list-group-flush">
	                            <li class="list-group-item">\${movie.release_date} 개봉</li>
	                        </ul>
	                        <div class="card-body">
	                            <button type="button" class="btn btn-outline-secondary" onclick="viewDetail(\${movieId})">View</button>
	                        </div>
	                    </div>`;
	            });
	            movieList.html(movieHtml);
	        } else {
	            movieList.append('<li>No movies currently playing.</li>');
	        }
	    };
	        
	        
        const fetchMovieDetails = (movieId) => {
            scrollDownView();
            
            $.ajax({
                url: 'movieList/details',
                method: 'GET',
                dataType: 'json',
                data: { movie_id: movieId },
                success: (data) => {
                    const movieDetails = $('#movieDetails');
                    let InfoHtml = `
                        <div class="col-md-4 mt-5">
                            <img src="https://image.tmdb.org/t/p/w500\${data.poster_path}" class="img-fluid" alt="Movie Poster" style="width:300px;">
                        </div>
                        <div class="col-md-6 mt-5">
                            <h4 class="mb-4">\${data.title}</h4>
                            <p>\${data.overview}</p>
                            <p><strong>개봉일:</strong> \${data.release_date}</p>`;

                    // 장르 문자열 변환
                    const genres = data.genres.map(genre => genre.name).join(',');
                    InfoHtml += `<p><strong>장르:</strong> \${genres}</p>`;

                    // 등급 정보 가져오기
                    $.ajax({
                        url: 'movieList/rating',
                        method: 'GET',
                        dataType: 'json',
                        data: { movie_id: movieId },
                        success: (releaseData) => {
                            let rating = 'N/A';
                            const countries = releaseData.results;
                            for (const country of countries) {
                                if (country.iso_3166_1 === 'KR') {
                                    for (const release of country.release_dates) {
                                        if (release.certification) {
                                            rating = release.certification;
                                            break;
                                        }
                                    }
                                    break;
                                }
                            }

                            InfoHtml += `
                                <p><strong>관람 등급:</strong> \${rating}</p>
                                <p><strong>상영 시간:</strong> \${data.runtime}분</p>
                                <p><strong>평점:</strong> \${data.vote_average}</p>
                                <div class="mt-4">
                                    <input type="hidden" id="movieCode" name="movieCode" value="\${movieId}"/>
                                    <input type="hidden" id="movieTitle" name="movieTitle" value="\${data.title}"/>
                                    <input type="hidden" id="genre" name="genre" value="\${genres}"/>
                                    <input type="hidden" id="summary" name="summary" value="\${data.overview}"/>
                                    <input type="hidden" id="runningTime" name="runningTime" value="\${data.runtime}"/>
                                    <input type="hidden" id="rating" name="rating" value="\${rating}"/>
                                    <input type="hidden" id="openedDate" name="openedDate" value="\${data.release_date}"/>
                                    <input type="hidden" id="status" name="status" value="Y"/>
                                    <button class="btn btn-primary mr-3" onclick="insert()" style="background-color:#29b9a5; border:1px #29b9a5;">등록하기</button>
                                </div>`;
                            movieDetails.html(InfoHtml);
                        },
                        error: (jqXHR, textStatus, errorThrown) => {
                            console.error('Error fetching movie rating data:', textStatus, errorThrown);
                            InfoHtml += `
                                <p><strong>관람 등급:</strong> N/A</p>
                                <p><strong>상영 시간:</strong> \${data.runtime}분</p>
                                <p><strong>평점:</strong> \${data.vote_average}</p>
                                <div class="mt-4">
                                    <a href="#" class="btn btn-primary mr-3">등록하기</a>
                                </div>`;
                            movieDetails.html(InfoHtml);
                        }
                    });
                },
                error: (jqXHR, textStatus, errorThrown) => {
                    console.error('Error fetching movie data:', textStatus, errorThrown);
                }
            });
        };
        
		    
	    
        const fetchMovieDetailsFromList = (movieId) => {
            scrollDownView();
            
            $.ajax({
                url: 'movieList/details',
                method: 'GET',
                dataType: 'json',
                data: { movie_id: movieId },
                success: (data) => {
                    const movieDetails = $('#movieDetails');
                    let InfoHtml = `
                        <div class="col-md-4 mt-5">
                            <img src="https://image.tmdb.org/t/p/w500\${data.poster_path}" class="img-fluid" alt="Movie Poster" style="width:300px;">
                        </div>
                        <div class="col-md-6 mt-5">
                            <h4 class="mb-4">\${data.title}</h4>
                            <p>\${data.overview}</p>
                            <p><strong>개봉일:</strong> \${data.release_date}</p>`;

                    // 장르 문자열 변환
                    const genres = data.genres.map(genre => genre.name).join(',');
                    InfoHtml += `<p><strong>장르:</strong> ${genres}</p>`;

                    // 등급 정보 가져오기
                    $.ajax({
                        url: 'movieList/rating',
                        method: 'GET',
                        dataType: 'json',
                        data: { movie_id: movieId },
                        success: (releaseData) => {
                            let rating = 'N/A';
                            const countries = releaseData.results;
                            for (const country of countries) {
                                if (country.iso_3166_1 === 'KR') {
                                    for (const release of country.release_dates) {
                                        if (release.certification) {
                                            rating = release.certification;
                                            break;
                                        }
                                    }
                                    break;
                                }
                            }

                            InfoHtml += `
                                <p><strong>관람 등급:</strong> \${rating}</p>
                                <p><strong>상영 시간:</strong> \${data.runtime}분</p>
                                <p><strong>평점:</strong> \${data.vote_average}</p>
                                <div class="mt-4">
                                    <input type="hidden" id="movieCode" name="movieCode" value="\${movieId}"/>
                                    <input type="hidden" id="movieTitle" name="movieTitle" value="\${data.title}"/>
                                    <input type="hidden" id="genre" name="genre" value="\${genres}"/>
                                    <input type="hidden" id="summary" name="summary" value="\${data.overview}"/>
                                    <input type="hidden" id="runningTime" name="runningTime" value="\${data.runtime}"/>
                                    <input type="hidden" id="rating" name="rating" value="\${rating}"/>
                                    <input type="hidden" id="openedDate" name="openedDate" value="\${data.release_date}"/>
                                    <input type="hidden" id="status" name="status" value="N"/>
                                    <button class="btn btn-danger mr-3" onclick="deleteMovie()">삭제하기</button>
                                </div>`;
                            movieDetails.html(InfoHtml);
                        },
                        error: (jqXHR, textStatus, errorThrown) => {
                            console.error('Error fetching movie rating data:', textStatus, errorThrown);
                            InfoHtml += `
                                <p><strong>관람 등급:</strong> N/A</p>
                                <p><strong>상영 시간:</strong> \${data.runtime}분</p>
                                <p><strong>평점:</strong> \${data.vote_average}</p>
                                <div class="mt-4">
                                    <a href="#" class="btn btn-primary mr-3">등록하기</a>
                                </div>`;
                            movieDetails.html(InfoHtml);
                        }
                    });
                },
                error: (jqXHR, textStatus, errorThrown) => {
                    console.error('Error fetching movie data:', textStatus, errorThrown);
                }
            });
        };

        // Assign the functions to the global window object
        window.viewDetail = fetchMovieDetails;
        window.viewDetailFromList = fetchMovieDetailsFromList;
        
    
    
	    //view 클릭 시 해당 화면으로 스크롤
	    const scrollDownView = () => {
	        let location = document.querySelector('#movieDetails').offsetTop;
	        window.scrollTo({ top: location - 80, behavior: 'smooth' });
	    }
	    
        	
	    const fetchUpMovies = (pageUpNo) => {
	        $.ajax({
	            url: 'movieList/upComming/Admin',
	            method: 'GET',
	            dataType: 'json',
	            data: { pageNo: pageUpNo },
	            success: (data) => {
	                displayUpMovies(data);
	            },
	            error: (jqXHR, textStatus, errorThrown) => {
	                console.error('Error fetching movie data:', textStatus, errorThrown);
	            }
	        });
	    };

	    const displayUpMovies = (data) => {
	        const movieList = $('#movieUpList');
	        movieList.empty();

	        if (data.results && data.results.length > 0) {
	            const movies = data.results;
	            let movieHtml = '';
	            movies.forEach(movie => {
	                const movieId = movie.id;
	                movieHtml += `
	                    <div class="card" style="width: 12rem;">
	                        <img src="https://image.tmdb.org/t/p/w500\${movie.poster_path}" class="card-img-top">
	                        <div class="card-body">
	                            <h5 class="card-title">\${movie.title}</h5>
	                            <p class="card-text">\${movie.title}</p>
	                        </div>
	                        <ul class="list-group list-group-flush">
	                            <li class="list-group-item">\${movie.release_date} 개봉</li>
	                        </ul>
	                        <div class="card-body">
	                            <div class="btn-group">
	                                <button type="button" class="btn btn-sm btn-outline-secondary" onclick="viewDetail(\${movieId})">View</button>
	                            </div>
	                        </div>
	                    </div>`;
	            });
	            movieList.html(movieHtml);
	        } else {
	            movieList.append('<li>No movies currently playing.</li>');
	        }
	    };

	    const changeUpPage = (pageUpNo) => {
	        currentPage = pageUpNo;
	        fetchUpMovies(pageUpNo);
	    };

	    window.changeUpPage = changeUpPage;
	    window.nextUpPage = () => changeUpPage(currentPage + 1);
	    window.previousUpPage = () => changeUpPage(currentPage - 1);

	    fetchUpMovies(currentPage);

	    
	    $(document).ready(() => {
	        findAll();
	        fetchMovies(currentPage);
	        fetchMoviesForD();
	        fetchUpMoviesForD();
	    });
	    
	    
        
	</script>
    	
   
    		
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>