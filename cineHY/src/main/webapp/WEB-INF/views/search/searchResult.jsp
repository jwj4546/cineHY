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
			    <div class="card mb-3" style="max-width: 700px;">
				  <div class="row g-0">
				    <div class="col-md-4">
				      <img src="..." class="img-fluid rounded-start" alt="...">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">Card title</h5>
				        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				        <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
				      </div>
				    </div>
				  </div>
				</div>
				
				<h3>영화인 검색결과</h3>
			    <div class="card mb-3" style="max-width: 700px;">
				  <div class="row g-0">
				    <div class="col-md-4">
				      <img src="..." class="img-fluid rounded-start" alt="...">
				    </div>
				    <div class="col-md-8">
				      <div class="card-body">
				        <h5 class="card-title">Card title</h5>
				        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				        <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
				      </div>
				    </div>
				  </div>
				</div>
				
				<div class="row">
			      <div class="col-md-4">
			        <div class="card mb-4 shadow-sm">
			          <img src="movie_poster1.jpg" class="card-img-top" alt="영화 포스터">
			          <div class="card-body">
			            <h5 class="card-title">영화 제목 1</h5>
			            <p class="card-text">영화 설명이 여기에 들어갑니다.</p>
			            <div class="d-flex justify-content-between align-items-center">
			              <div class="btn-group">
			                <button type="button" class="btn btn-sm btn-outline-secondary">예매하기</button>
			                <button type="button" class="btn btn-sm btn-outline-secondary">상세 정보</button>
			              </div>
			              <small class="text-muted">상영 시간: 120분</small>
			            </div>
			          </div>
			        </div>
			      </div>
			      <div class="col-md-4">
			        <div class="card mb-4 shadow-sm">
			          <img src="movie_poster2.jpg" class="card-img-top" alt="영화 포스터">
			          <div class="card-body">
			            <h5 class="card-title">영화 제목 2</h5>
			            <p class="card-text">영화 설명이 여기에 들어갑니다.</p>
			            <div class="d-flex justify-content-between align-items-center">
			              <div class="btn-group">
			                <button type="button" class="btn btn-sm btn-outline-secondary">예매하기</button>
			                <button type="button" class="btn btn-sm btn-outline-secondary">상세 정보</button>
			              </div>
			              <small class="text-muted">상영 시간: 130분</small>
			            </div>
			          </div>
			        </div>
			      </div>
			      <div class="col-md-4">
			        <div class="card mb-4 shadow-sm">
			          <img src="movie_poster3.jpg" class="card-img-top" alt="영화 포스터">
			          <div class="card-body">
			            <h5 class="card-title">영화 제목 3</h5>
			            <p class="card-text">영화 설명이 여기에 들어갑니다.</p>
			            <div class="d-flex justify-content-between align-items-center">
			              <div class="btn-group">
			                <button type="button" class="btn btn-sm btn-outline-secondary">예매하기</button>
			                <button type="button" class="btn btn-sm btn-outline-secondary">상세 정보</button>
			              </div>
			              <small class="text-muted">상영 시간: 110분</small>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
				
			</div>
    	
    	</div>
    	
    	
    </main>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>



	<script>
    $(document).ready(function(){
        var keyword = '<%= request.getAttribute("keyword") %>';
        console.log('검색어:', keyword);

        function search() {
            $.ajax({
                url: 'movieList/search',
                method: 'GET',
                data: { keyword: keyword },
                dataType: 'json',
                success: function(data) {
                    // displayMovies(data); 
                    console.log(data);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('영화 데이터를 불러오는 중 오류 발생:', textStatus, errorThrown);
                }
            });
        }

        // 페이지가 로드되면 검색을 수행
        search();
    });
    </script>
</body>
</html>