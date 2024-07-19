<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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
                <h4>결제 완료</h4>
            </div>
        </div><br><br>
    
        <div class="row mt-4">
            <div class="col">
                <div class="progress" style="height: auto;">
                    <div class="progress-bar bg-secondary" role="progressbar" style="width: 33%;" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">STEP 01 <br> 장바구니</div>
                </div>
            </div>
            <div class="col">
                <div class="progress" style="height: auto;">
                    <div class="progress-bar bg-secondary" role="progressbar" style="width: 66%;" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100">STEP 02 <br> 결제하기</div>
                </div>
            </div>
            <div class="col">
                <div class="progress" style="height: auto;">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">STEP 03 <br> 결제완료</div>
                </div>
            </div>
        </div><br><br>

    <div class="mt-4">
        <h5>결제 완료</h5>
        <div class="row">
        	<c:forEach items="${ list }" var="order">
	            <div class="col-md-4">
	                <div class="border p-3">
	                    <img src="${ order.changeImage }" class="img-fluid" alt="Product Image">
	                </div>
	            </div>
	            <div class="col-md-8">
	                <table class="table table-borderless">
	
			                    <tr>
			                        <th>결제번호</th>
			                        <td>${ order.merchantUid }</td>
			                    </tr>
			                    <tr>
			                        <th>상품</th>
			                        <td>${ order.productName }</td>
			                    </tr>
			                    <tr>
			                        <th>상품 정보</th>
			                        <td>${order.productComment }</td>
			                    </tr>
			                    <tr>
			                        <th>유효기간</th>
			                        <td>구매일로부터 1년</td>
			                    </tr>
			                    <tr>
			                        <th>결제금액</th>
			                        <td>${ order.amount }</td>
			                    </tr>
			                    <tr>
			                        <th>결제수단</th>
			                        <td>${ order.payMethod }</td>
			                    </tr>
	                </table>
	                <div class="text-right">
	                    <a href="productlist"><button class="btn btn-secondary">결제확인</button></a>
	                    <button class="btn btn-danger">결제취소</button>
	                </div>
	            </div>
            </c:forEach>
        </div>
    </div>

    <div class="mt-4">
        <h6>상품 유의사항</h6>
        <p>어쩌고저쩌고~</p>
    </div>
</div>

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