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

    <jsp:include page="../common/menubar.jsp"></jsp:include>
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

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>