<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    <jsp:include page="../common/menubar.jsp"></jsp:include>
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
            
              	<!-- userId별 장바구니 품목 개수 설정  -->
	            	<input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }" />
					<!-- 상품 등록 페이지로 이동 -->	            	
	            	<c:if test="${ sessionScope.loginUser.userId eq 'admin' }">
	            		<a href="productForm"><button type="button" class="btn btn-warning">상품 등록</button></a>
	            	</c:if>
	            	<!-- 장바구니 개수 출력 및 장바구니로 이동 -->
	            	<c:set var="count" value="${ count }" />
	            	<c:choose>
	            	<c:when test="${ not empty sessionScope.loginUser }">
	              		<a href="cartlist">
		              		<button type="button" class="btn btn-info">
		               		 장바구니<span class="badge badge-light">${ count }</span>
		              		</button>
	              		</a>
	              	</c:when>
	              	<c:otherwise>
	              		<button type="button" class="btn btn-info">
		               		 장바구니<span class="badge badge-light">0</span>
		              		</button>
	              	</c:otherwise>
	              	</c:choose>
            </div>
          </div>
        </div>
      </div><br><br><br><br>
      
      <!-- Product 데이터를 반복 출력 -->
	      <div class="container">
	        <div class="row">
	        	<c:forEach items="${ list }" var="product">
		          <div class="col-md-4" id="productId-${ product.productId }">
		            <div class="product-card">
		              <div style="height:300px; overflow:hidden;"><img src="${ product.changeImage }" alt="영화관람권" style="height:100%; width:auto;"></div>
		              <div class="product-name">${ product.productName }</div>
		              <div class="product-price"><fmt:formatNumber value="${ product.productPrice }" pattern="#,###" />원</div>
		            </div>
		          </div>
	          	</c:forEach>
	        </div>
	      </div>
      
      <script>
      <%-- 상품 상세보기로 이동하는 스크립트 --%>
      	$(() => {
      		$('.col-md-4').click(e => {
      			location.href = 'product-detail?productId=' + e.currentTarget.id.split('-')[1];
      		});
      	});
      	
      	<%-- 카테고리 별로 이동하는 함수 --%>
      	function category() {
      		
      	}
      </script>
    

    <!-- Footer -->
    <jsp:include page="../common/footer.jsp"></jsp:include>

    

    
</body>
</html>