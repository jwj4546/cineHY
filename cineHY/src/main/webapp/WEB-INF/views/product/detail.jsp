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
    
    <jsp:include page="../common/menubar.jsp"></jsp:include>
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
			  	<input type="hidden" id="productId" name="productId" value="${ product.productId }" />
			  	<input type="hidden" id="changeImage" name="filePath" value="${ product.changeImage }">
		  	</form>
		  	<c:if test="${ sessionScope.loginUser.userId eq 'admin' }">
			  	<button type="submit" class="btn btn-primary" onclick="postSubmit()">수정하기</button>
			  	<button type="button" data-toggle="modal" class="btn btn-danger" data-target="#deleteForm">삭제하기</button>
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
        
        
        <input type="hidden" id="userId" value="${ sessionScope.loginUser.userId }"/>
       	<button class="btn btn-secondary" id="cartInsert">장바구니 추가</button>
      </div>
    </div>
  </div>
  

  
  <script>
  
  	// '수정' 버튼 클릭시 상품 수정 페이지로 post 요청을 보내는 함수
  	function postSubmit() {
  			$('#postForm').attr('action', 'updateForm').submit();
  		}
  	 
  	// 페이지가 실행되면 총 합계금액을 정규표현식 사용해서 3자리 마다 ,를 삽입
    $(document).ready(function () {
    	com();
        comm();
    });

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

 	// '-' 버튼 클릭시 수량이 1씩 감소하고, 변경된 금액이 계산되는 함수
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
	
    // '+' 버튼 클릭시 수량이 1씩 증가되고, 변경된 금액이 계산되는 함수
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
    
    //장바구니 추가
    document.getElementById("cartInsert").onclick = () => {
    	
    	const productId = document.getElementById("productId").value;
    	const amount = document.getElementById("amount").value;
    	const userId = document.getElementById("userId").value;
		
    	$.ajax({
    		url : 'cart',
    		type : 'get',
    		data : {
    			productId : productId
    		},
    		success : request => {
    			if(request === 'YY') {			// user의 장바구니를 조회하여 이미 해당 품목이 장바구니에 있으면 해당 조건문 진행
    				const check = confirm("해당 상품이 장바구니에 이미 존재합니다.\n 장바구니로 이동하시겠습니까?");
    				if(check) {
    					location.href = "cartlist";
    				} else {
    					
    				}
    			} else {		// user의 장바구니에 해당 품목이 없다면 추가 진행
    				$.ajax({
    		    		url : 'insert',
    		    		type : 'post',
    		    		data : {
    		    			productId : productId,
    		    			cartAmount : amount,
    		    			userId : userId
    		    		},
    		    		success : response => {
    		    			if(response === 'Y') {		// 장바구니 추가에 성공하면 진행되는 process
    		    				const result = confirm("장바구니 추가에 성공~ \n장바구니로 이동하실래여?");			// 장바구니로 이동할지 묻는 confirm창
    		    				if(result) {
    		    					location.href = "cartlist";
    		    				} else {
    		    					
    		    				}
    		    			} else {
    		    				alert("장바구니 추가 실패ㅠ");
    		    			}
    		    		},
    		    		error : () => {
    		    			console.log("AJAX 전송 실패ㅠ");
    		    		}
    		    	});
    		    }
    		},
    		// 회원이 아니거나 로그인을 안 하고 장바구니를 이용하려고 할 때 로그인 페이지로 이동
    		error : () => {
				const error = confirm("회원만 이용이 가능합니다.\n 로그인 하시겠습니까?");
				if(error) {
					location.href = "login";
				} else {
					
				}
			}
   			});
   		}
    
  </script>

  <!-- Footer -->
 <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>