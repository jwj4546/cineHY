<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Cine HY</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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

<div class="container mt-5">
    <div class="row">
        <div class="col">
            <h4>장바구니</h4>
        </div>
    </div><br><br>

    <div class="row mt-4">
        <div class="col">
            <div class="progress" style="height: auto;">
                <div class="progress-bar bg-success" role="progressbar" style="width: 33%;" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">STEP 01 <br> 장바구니</div>
            </div>
        </div>
        <div class="col">
            <div class="progress" style="height: auto;">
                <div class="progress-bar bg-secondary" role="progressbar" style="width: 66%;" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100">STEP 02 <br> 결제하기</div>
            </div>
        </div>
        <div class="col">
            <div class="progress" style="height: auto;">
                <div class="progress-bar bg-secondary" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">STEP 03 <br> 결제완료</div>
            </div>
        </div>
    </div><br><br>
	
    <table class="table table-bordered mt-4">
        <thead>
            <tr>
                <th scope="col">선택</th>
                <th scope="col">이미지</th>
                <th scope="col">상품명</th>
                <th scope="col">판매금액</th>
                <th scope="col">수량</th>
                <th scope="col">구매금액</th>
                <th scope="col">삭제</th>
            </tr>
        </thead>
        
	        <tbody>
	        	<c:forEach items="${ list }" var="cart">
		            <tr>
		                <td><input type="checkbox" class="checkbox" onchange="changeCheck" checked></td>
		                <td><img src="${ cart.changeImage }" alt="" style="width: auto; height: 100px;"></td>
		                <td>
		                    <div>${ cart.productName }</div>
		                </td>
		                <td>
		                	${ cart.productPrice }
		                	<input type="hidden" class="productPrice" value="${ cart.productPrice }" />
		                </td>
		                <td>
		                    <input type="number" class="productAmount"  value="${ cart.cartAmount }" min="1" style="width: auto;" onchange="amountChange()" />
		                </td>
		                <td class="oneTotal"><input type="hidden" class="oneTotal" value="" /></td>
		                <td><button class="btn btn-danger btn-sm">삭제</button></td>
		            </tr>
	        	</c:forEach>
	        </tbody>
    </table>

    <div class="text-right mt-3">
        <h4 >결제 예정 금액: <span id="total"></span>원</h4>
    </div>

    <div class="text-center mt-4">
        <button class="btn btn-primary">구매하기</button>
    </div>
</div>

<script>
// 문서가 실행되면 각 항목의 금액과 전체 금액이 계산되는 함수
	window.onload = function() {
		
		var count = document.getElementsByClassName("checkbox").length;
		
		for(let i=0; i<count; i++) {
			var price = document.getElementsByClassName("productPrice")[i].value;
			var amount = document.getElementsByClassName("productAmount")[i].value;
			var oneTotal = price * amount;
			
			document.getElementsByClassName("oneTotal")[i].innerHTML = oneTotal;
			document.getElementsByClassName("oneTotal")[i].value = oneTotal;
		}
			
			var total = 0;	
			for(let k=0; k<count; k++) {
				
				total += document.getElementsByClassName("oneTotal")[k].value;
				
			}
			document.getElementById("total").innerHTML = total;
			console.log(total);
	}
		
	// 각 항목에 체크를 해제하고 선택할 때 마다 전체 가격이 변하는 함수
	function changeCheck() {
		let checkboxes = document.querySelectorAll(".checkbox");
		
		for(let i=0;i<checkboxes.length;i++) {
			if(checkboxes[i].checked) {
				console.log("체크");
			} else {
				console.log("노체크");
			}
			
		}
	}


	// 각 항목의 수량을 변경할 때 그에 따라 항목의 가격과 전체 가격이 변경되는 함수
	function amountChange() {
		
	var count = document.getElementsByClassName("checkbox").length;
		
		for(let i=0; i<count; i++) {
			var price = document.getElementsByClassName("productPrice")[i].value;
			var amount = document.getElementsByClassName("productAmount")[i].value;
			var oneTotal = price * amount;
			
			document.getElementsByClassName("oneTotal")[i].innerHTML = oneTotal;
			document.getElementsByClassName("oneTotal")[i].value = oneTotal;
		}
			
			var total = 0;	
			for(let k=0; k<count; k++) {
				
				total += document.getElementsByClassName("oneTotal")[k].value;
				
			}
			document.getElementById("total").innerHTML = total;
			console.log(total);
	}
</script>

<footer class="bg-light py-3 mt-5">
    <div class="container text-center">
        <p class="mb-0">Cine HY</p>
        <p class="mb-0">(04377) 서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층 (한강로동)</p>
        <p class="mb-0">대표이사:허민회 사업자등록번호:104-81-45690 통신판매업신고번호:2017-서울용산-0662</p>
        <p class="mb-0">© CJ CGV. All Rights Reserved.</p>
    </div>
</footer>

</body>
</html>
