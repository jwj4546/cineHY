<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품리스트</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
    .store-header {
      margin-top: 20px;
      margin-bottom: 20px;
    }
    .product-card {
      border: 1px solid #ddd;
      padding: 15px;
      text-align: center;
      margin-bottom: 20px;
    }
    .product-card img {
      width: 100%;
      height: auto;
    }
    .product-price {
      margin-top: 10px;
      font-weight: bold;
    }
    .footer {
      margin-top: 40px;
      padding: 20px 0;
      background-color: #f8f9fa;
      text-align: center;
    }
    </style>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
          
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <a href="#" class="navbar-brand d-flex align-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" 
                stroke-linecap="round" stroke-linejoin="round" class="mr-2">
                <rect x="2" y="7" width="20" height="15" rx="2" ry="2"></rect>
                <path d="M16 3l-4 4H3L7 3z"></path>
                <path d="M22 3l-4 4h-9L17 3z"></path>
            </svg>
              <strong>Cine HY</strong>
            </a>
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
              </li>
            </ul>
            <form class="form-inline mt-2 mt-md-0">
              <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <ul class="navbar-nav" style="justify-content: flex-end;">
                <li class="nav-item active" style="float: right;">
                  <a class="nav-link" href="#">로그인 </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">회원가입</a>
                </li>
            </ul>
          </div>
        </nav>
      </header>
      <br><br><br><br>
      
      
      <div class="container store-header">
        <div class="row">
          <div class="col-12">
            <h2>스토어</h2><br><br>
            <div class="btn-group" role="group" aria-label="Store Categories">
                <button type="button" class="btn btn-secondary">전체상품</button>
                <button type="button" class="btn btn-secondary">영화관람권</button>
                <button type="button" class="btn btn-secondary">팝콘</button>
                <button type="button" class="btn btn-secondary">음료</button>
                <button type="button" class="btn btn-secondary">스낵</button>
            </div><br><br>
            <div class="float-right">
            
              <form action="cartlist" method="post" id="cartList">
              	<input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }" />
              	<a href="productForm"><button type="button" class="btn btn-warning">상품 등록</button></a>
              	<button type="submit" class="btn btn-info">
               	 장바구니<span class="badge badge-light">5</span>
              	</button>
              </form>
            </div>
          </div>
        </div>
      </div><br><br><br><br>
      <!-- Product Grid -->
	      <div class="container">
	        <div class="row">
	        	<c:forEach items="${ list }" var="product">
		          <div class="col-md-4" id="productId-${ product.productId }">
		            <div class="product-card">
		              <div style="height:300px; overflow:hidden;"><img src="${ product.changeImage }" alt="영화관람권" style="height:100%; width:auto;"></div>
		              <div class="product-name">${ product.productName }</div>
		              <div class="product-price">${ product.productPrice }원</div>
		            </div>
		          </div>
	          	</c:forEach>
	        </div>
	      </div>
      
      <script>
      	$(() => {
      		$('.col-md-4').click(e => {
      			location.href = 'product-detail?productId=' + e.currentTarget.id.split('-')[1];
      		});
      	});
      	
      	function category() {
      		
      	}
      </script>
    

    <!-- Footer -->
    <div class="footer">
        <p>Cine HY</p>
        <p>(04377) 서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층 (한강로동)</p>
        <p>대표이사: 이상덕 | 사업자등록번호: 111-81-45696 | 이메일: master@cgv.co.kr</p>
        <p>© CJ CGV. All Rights Reserved</p>
    </div>

    

    
</body>
</html>