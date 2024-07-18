<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Cine HY - 결제하기</title>
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
            <h4>결제</h4>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col">
            <div class="progress" style="height: auto;">
                <div class="progress-bar bg-secondary" role="progressbar" style="width: 33%" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">STEP 01 <br> 장바구니</div>
            </div>
        </div>
        <div class="col">
            <div class="progress" style="height: auto;">
                <div class="progress-bar bg-success" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100">STEP 02 <br> 결제하기</div>
            </div>
        </div>
        <div class="col">
            <div class="progress" style="height: auto;">
                <div class="progress-bar bg-secondary" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">STEP 03 <br> 결제완료</div>
            </div>
        </div>
    </div><br><br>
    
    <table class="table table-bordered mt-4">
        <thead>
            <tr>
                <th scope="col">이미지</th>
                <th scope="col">상품명</th>
                <th scope="col">판매금액</th>
                <th scope="col">수량</th>
                <th scope="col">구매금액</th>
            </tr>
        </thead>
        
	        <tbody id="reLoad">
	        
	        </tbody>
    </table>

	<div class="text-right mt-3">
        <h5>결제 금액: <span id="total"></span>원</h5>
    </div>

        <div class="text-center mt-4">
            <button type="button" class="btn btn-primary" id="orderBtn">구매하기</button>
        </div>
    </div>

    
    
    <script>
    	window.onload = function() {
    		const lists = JSON.parse(window.sessionStorage.getItem('list'));
    		
    		let text = '';
    		const formatter = new Intl.NumberFormat('ko-KR');
    		
    		for(let i in lists) {
    			
    			const list = lists[i];
    			
    			text += '<tr>'
    					 + '<td style="text-align:center; width:200px;"><img src="' + list.changeImage + '" style="height:100px; width=auto;"/></td>'
    					 + '<td>' 
    					 + list.productName
    					 + '<input type="hidden" name="productPrice" class="productPrice" value="' + list.productPrice + '" />'
    					 + '<input type="hidden" name="cartAmount" class="cartAmount" value="' + list.cartAmount + '" />'
    					 + '<input type="hidden" name="oneTotal" class="oneTotal" value="' + (list.productPrice * list.cartAmount) + '" />'
    					 + '</td>'
    					 + '<td>' 
    					 + formatter.format(list.productPrice) 
    					 + '원</td>'
    					 + '<td>' + list.cartAmount + '</td>'
    					 + '<td>' + formatter.format((list.productPrice * list.cartAmount)) + '원</td>'
    					 + '</tr>'
    					 
    		};
    		document.getElementById("reLoad").innerHTML = text;
    	}
    	
    	window.addEventListener('load', function () {
    		const lists = JSON.parse(window.sessionStorage.getItem('list'));
    		// 금액 계산
    		const count = lists.length;
    		
    		var total = 0;
    	 	for(let i=0;i<count;i++) {
    			var oneTotal = Number(document.getElementsByClassName("oneTotal")[i].value);
    			total += oneTotal;
    		}
    	 	document.getElementById("total").innerHTML = total.toLocaleString();
    	 	
    	 	var totalPrice = document.createElement("input");
    	 	totalPrice.setAttribute("type", "hidden");
    	 	totalPrice.setAttribute("name", "total");
    	 	totalPrice.setAttribute("value", oneTotal);
    	 	totalPrice.setAttribute('id', 'totalPrice');
    	 	
    	 	document.querySelector("#total").append(totalPrice);
    	});
    	
    	</script>
    	
    	<script>
    	
    	// 결제 버튼 클릭시
    	$("#orderBtn").on("click", function() {
			// 사전검증
   	    	var merchant_uid = "O" + new Date().getTime();
   	    	var totalPrice = $("#totalPrice").val();
   	    	console.log(totalPrice);
   	    	console.log(merchant_uid);
   	    	$.ajax({
   	    		url : "payment/prepare",
   	    		method : "post",
   	    		contentType : "application/json",
   	    		data : JSON.stringify({
   	    			merchantUid : merchant_uid,
   	    			amount : totalPrice
   	    		})
   	    	});
   	    	
   	    	

            var IMP = window.IMP;
            IMP.init("imp33642125"); // 가맹점 식별코드 입력 

            IMP.request_pay({
                pg: "html5_inicis",           // 등록된 pg사 (적용된 pg사는 KG이니시스)
                pay_method: "card",           // 결제방식: card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(소액결제)
                merchant_uid: merchant_uid,   // 주문번호
                name: "영화티켓",                  // 상품명
                amount: totalPrice,           // 금액
                buyer_name: "조우진",         // 주문자
                buyer_tel: "01033479535",             // 전화번호 (필수입력)
                buyer_addr: "대현동",    		  // 주소
                buyer_postcode: "12703",          // 우편번호
                img : "aasdfasdf",
                day : "2024-07-09",
                product_id : "티켓",
                movie_code : "영화",
                movie_title : "인사이드 아웃2"
           
            // 사후 검증
            }, function (rsp) {
            	console.log(rsp);
            	console.log(rsp.imp_uid);
            	console.log(rsp.merchant_uid);
                if (rsp.success) {
					$.ajax({
						url : "payment/validate",
						method : "post",
						contentType : "application/json",
						data : JSON.stringify({
							impUid : rsp.imp_uid,
							merchantUid : rsp.merchant_uid
						})
					}).done(function (data) {
						// 결제 정보 DB 저장
						//주문 상품 정보 DB 저장
						var msg = '결제가 완료되었습니다.';
						var buyerInfo = {
								"merchantUid" : rsp.merchant_uid,
								"userId" : userId,
								"userName" : rsp.buyer_name,
								"pay_method" : rsp.pay_method,
								"productName" : rsp.name,
								"amount" : rsp.paid.amount,
								"phoneNo" : rsp.buyer_tel,
								"address" : rsp.buyer_addr,
								"receipt" : rsp.receipt_url
						}
						$.ajax({
							type : "post",
							url : "save_buy",
							contentType : "application/json",
							data : JSON.Stringify(buy),
							success : function(response) {
								console.log("결제정보 저장 완료");
							}
						});
						
						if(rsp.product_id == null) {
							var orderProduct = {
								"merchantUid" : rsp.merchant_uid,
								"userId" : userId,
								"userName" : rsp.buyer_name,
								"receipt" : rsp.receipt_url,
								"payMethod" : rsp.pay_method,
								"productId" : rsp.product_id,
								"productName" : rsp.name,
								"productAmount" : rsp.paid.amount,
								"productImg" :  rsp.img,
								"phoneNo" : rsp.buyer_tel,
								"orderDay" : rsp.day
							}
						}
						else {
							var orderMovie = {
									"merchantUid" : rsp.merchant_uid,
									"userId" : userId,
									"userName" : rsp.buyer_name,
									"receipt" : rsp.receipt_url,
									"payMethod" : rsp.pay_method,
									"movieCode" : rsp.movie_code,
									"movieTitle" : rsp.movie_title,
									"ticketPrice" : rsp.ticket_price,
									"ticketAmount" : rsp.paid.amount,
									"posterUrl" : rsp.img,
									"phoneNo" : rsp.buyer_tel,
									"orderDay" : rsp.day
							}
						}
					});
                } else {
                    var msg = '결제를 실패하였습니다.';
                    alert(msg);
                }
            });
   	    	
    		
    	});
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
