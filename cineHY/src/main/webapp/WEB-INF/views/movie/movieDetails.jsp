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
	
	<%
    // 영화 코드를 서버에서 가져와서 변수에 저장
    String movieId = request.getParameter("movieId");
	%>
	
    <main>
    	<div id="page1"></div>
    	<div class="container">
   	 	<div class="row" id="movieDetails">
   	 		<div class="col-md-4 mt-5" id="poster" >
   	 			<img src=""class="img-fluid" alt="Movie Poster" style="width:300px;">
   	 		</div>
   	 		<div class="col-md-6 mt-5" >
   	 			<div id="title"><h4 class="mb-4">title</h4></div>
	            <div id="overview"><p>overview</p></div>
	            <div id="releaseDate"><p><strong>개봉일 : </strong>release_date</p></div>
	            <div id="genre"><p><strong>장르 : </strong>genres</p></div>
	            <div id="rating"><p><strong>관람 등급 : </strong>rating</p></div>
	            <div id="runtime"><p><strong>상영 시간 : </strong>runtime 분</p></div>
	            <div id="rateAvg"><p><strong>평균 별점 : </strong>avgstar</p></div>
	            <div id="director"><p><strong>감독 : </strong>director</p></div>
	            <div id="actor"><p><strong>배우 : </strong>actor</p></div>
	            <div class="mt-4">
                  <form action="reservationById" method="get">
                  <input type="hidden" value="<%= movieId %>" name="movieId">
                  <button type="submit" class="btn btn-primary mr-3">예매하기</button>
                  </form>
                  <a href="movieList" class="btn btn-outline-secondary">영화 목록으로 돌아가기</a>
                </div>
             </div>
		</div>
        <hr>
        <div class="row mt-5">
                <div class="col-md-12">
                    <h3>트레일러</h3>
                </div>
                <div id="trailers" class="row">
                    <!-- 트레일러 -->
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-md-12">
                    <h3>스틸컷</h3>
                </div>
                <div id="stills" class="row">
                    <!-- 스틸컷 -->
                </div>
            </div>
        </div>
        
        <div id="review-section">
		    <jsp:include page="../review/review.jsp">
		        <jsp:param name="movieId" value="<%= movieId %>" />
		    </jsp:include>
		</div>
        
    </main>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <script>
    
   
    $(document).ready(function() {
    	
   	 <%-- const movieId = "<%= movieId %>"; --%> //리뷰에서 호출한 movieID 있음
   	 getDetails(movieId);  // getDetails 호출
       
       
     getDetails = (movieId) => {
         $.ajax({
             url: 'movieList/details',
             method: 'GET',
             dataType: 'json',
             data: { movie_id: movieId },
             success: function(data) {
             	//console.log(data);
             	$('#poster').html('<img src="https://image.tmdb.org/t/p/w500' + data.poster_path + '" class="img-fluid" alt="Movie Poster" style="width:300px;">')
                 $('#title').html ('<h4 class="mb-4">' + data.title + '</h4>');
                 $('#overview').html ('<p>' + data.overview + '</p>');
               $('#releaseDate').html ('<p><strong>개봉일 : </strong>' + data.release_date + '</p>');
   			$('#runtime').html ('<p><strong>상영 시간 : </strong>'+ data.runtime +'분</p>');

   			let genres = data.genres.map( (genre) => {
                 	return genre.name;
                 }).join(',');
                 
                 $('#genre').html ('<p><strong>장르 : </strong>'+ genres +'</p>');
                 
                   if (data.videos && data.videos.results.length > 0) {
                       const trailersHtml = data.videos.results.slice(0, 3).map(video => {
                           return `<div class="col-md-4 mt-3">
                               <div class="video-container">
                                   <iframe src="https://www.youtube.com/embed/${video.key}" frameborder="0" allowfullscreen></iframe>
                               </div>
                           </div>`;
                       }).join('');
                       $('#trailers').html(trailersHtml);
                   } else {
                       $('#trailers').html('<p>No trailers available.</p>');
                   }

                // 스틸컷 추가
               getMovieImages(movieId);
               getRating(movieId);  
               getStarAvg(movieId); 
               getCredit(movieId);
             },
             error: (jqXHR, textStatus, errorThrown) => {
                   console.error('Error fetching movie data:', textStatus, errorThrown);
             }
         });
   	 }
   	            
     const getRating = (movieId) => {         
               //등급 정보 가져오기
         $.ajax({
             url: 'movieList/rating',
             method: 'get',
             dataType: 'json',
             data: { movie_id: movieId },
             success: releaseData => {
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
                 
                 $('#rating').html ('<p><strong>관람 등급 : </strong>'+ rating +'</p>');
             },
         });
      }
                             
     const getStarAvg = (movieId) => {                   
    
      	 $.ajax({
   	        url: 'starAvg',
   	        data: {
   	        	movieCode: movieId
   	        },
   	        type: 'GET',
   	        success: response => {
   	        	$('#rateAvg').html('<div id="rateAvg"><p><strong>평균 별점 : </strong>'+ response +'</p></div>');  

    	    },
           error: (err) => {
               console.error('Error get review:', err);
             	$('#rateAvg').html('<div id="rateAvg"><p><strong>평균 별점 : </strong> 0 </p></div>');
           }
        });
     }
      	        
     const getCredit = (movieId) => {       
        $.ajax({
            url: 'movieList/credits',
            method: 'get',
            dataType: 'json',
            data: { movie_id: movieId },
            success: creditData => {
           	 console.log(creditData);
                let director = creditData.crew.find(member => member.job === 'Director');
                let actors = creditData.cast.slice(0, 5).map(actor => actor.name).join(', ');

                $('#director').html('<p><strong>감독 : </strong>' + (director ? director.name : 'N/A') + '</p>');
                $('#actor').html('<p><strong>배우 : </strong>' + (actors ? actors : 'N/A') + '</p>');

               },
               error: (jqXHR, textStatus, errorThrown) => {
                   console.error('Error fetching movie credit data:', textStatus, errorThrown);
               }
               
           });
   	  }
            		 

      const getMovieImages = (movieId) => {
           $.ajax({
               url: 'movieList/images',
               method: 'GET',
               dataType: 'json',
               data: { movie_id: movieId },
               success: imageData => {
                   if (imageData.backdrops && imageData.backdrops.length > 0) {
                       for (let i = 0; i < Math.min(4, imageData.backdrops.length); i++) {
                           const image = imageData.backdrops[i];
                           const imageUrl = 'https://image.tmdb.org/t/p/w500'+ image.file_path;
                           let imageHtml =''
                           imageHtml += '<div class="col-md-3 mt-3">'
                                      + '<div class="gallery-item">'
                                      + '<a href="#">'        
                                      + '<img src="'+ imageUrl +'" class="img-fluid" alt="Still Image">'
                                      + '</a>'
                                      + '</div>'
                                      + '</div>';
                           $('#stills').append(imageHtml);
                       }
                   } else {
                       $('#stills').html('<p>No stills available.</p>');
                   }
               },
               error: (jqXHR, textStatus, errorThrown) => {
                   console.error('Error fetching movie images:', textStatus, errorThrown);
                   $('#stills').html('<p>Error fetching stills.</p>');
               }
           });
       }
     });
    
    
    </script>
    
</body>
</html>