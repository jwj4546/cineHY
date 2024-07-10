<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        .store-header {
          margin-top: 20px;
          margin-bottom: 20px;
        }
        .product-detail {
          margin-top: 20px;
        }
        .product-detail img {
          width: 100%;
          height: auto;
        }
        .product-info {
          padding: 20px;
        }
        .quantity-selector {
          display: flex;
          align-items: center;
          margin-top: 20px;
          margin-bottom: 20px;
        }
        .quantity-selector button {
          margin: 0 5px;
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

    <!-- Store Header -->
  <div class="container store-header">
    <div class="row">
      <div class="col-12">
        <h2>스토어</h2><br><br>
        <div class="btn-group" role="group" aria-label="Store Categories">
          <button type="button" class="btn btn-secondary">영화관람권</button>
          <button type="button" class="btn btn-secondary">팝콘</button>
          <button type="button" class="btn btn-secondary">음료</button>
          <button type="button" class="btn btn-secondary">스낵</button>
        </div>
        <div class="float-right">
        	<form action="updateForm" method="post" id="postForm">
			  	<input type="hidden" name="productId" value="${ product.productId }" />
			  	<input type="hidden" name="filePath" value="${ product.changeImage }">
		  	</form>
		  	<button type="submit" class="btn btn-primary" onclick="postSubmit()">수정하기</button>
		  	<button type="button" data-toggle="modal" class="btn btn-danger" data-target="#deleteForm">삭제하기</button>
			  	<button type="button" class="btn btn-secondary">
            		장바구니<span class="badge badge-light">5</span>
          		</button>
        </div>
      </div>
    </div>
    <div class="modal" tabindex="-1" role="dialog" id="deleteForm">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">삭제</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <form action="delete" method="post" id="deleteForm">
			  	<input type="hidden" name="productId" value="${ product.productId }" />
			  	<input type="hidden" name="filePath" value="${ product.changeImage }">

		      <div class="modal-body">
		        <p>상품을 삭제 하시겠습니까</p>
		      </div>
		      
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-danger">삭제</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
  </div><br>

  <!-- Product Detail -->
  <div class="container product-detail">
    <div class="row">
      <div class="col-md-6" style="height:400px; overflow:hidden;">
        <img src="${ product.changeImage }" alt="영화관람권" style="height:100%; width:auto;">
      </div>
      <div class="col-md-6 product-info">
        <h3>${ product.productName }</h3><br>
        <span id="won">${ product.productPrice }</span><span>원</span><br><br>
        <input type="hidden" value="${ product.productPrice }" id="price" />
        <table class="table">
          <tr>
            <th>상품 정보</th>
            <td>${ product.productComment }</td>
          </tr>
          <tr>
            <th>유효기간</th>
            <td>${ product.productName } : 구매일로부터 12개월 이내</td>
          </tr>
        </table>
        <div class="quantity-selector">
          <button class="btn btn-secondary" onclick="minus()">-</button>
          <input type="text" value="1" id="amount" class="form-control" style="width: 50px; text-align: center;">
          <button class="btn btn-secondary" onclick="plus()">+</button>
        </div>
        <p>총 구매금액</p>
        <span id="total">${ product.productPrice }</span><span>원</span><br><br>
        <button class="btn btn-secondary">장바구니 추가</button>
        <button class="btn btn-info">구매하기</button>
      </div>
    </div>
  </div>
  

  
  <script>
  
  	function postSubmit() {
  			$('#postForm').attr('action', 'updateForm').submit();
  		}
    
    $(document).ready(function () {
        com();
        comm();
    });

    // 총 합계금액을 정규표현식 사용해서 3자리 마다 ,를 삽입
    function com() {
        var total = $('#total').text();
        var totall = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $('#total').text(totall);
    }

    function comm() {
        var won = $('#won').text();
        var wonn = won.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $('#won').text(wonn);
    }


    function minus() {
        am = document.getElementById("amount");
        price = document.getElementById("price");
        if(am.value > 1) {
          amount = am.value--;
        }
        var total = am.value * price.value;
        document.getElementById("total").innerHTML = total;
        com();
    }

    function plus() {
        am = document.getElementById("amount");
        price = document.getElementById("price");
        if(am.value <100) {
        amount = am.value++;
        }
        var total = parseInt(am.value) * parseInt(price.value);
        document.getElementById("total").innerHTML = total;
        com();
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