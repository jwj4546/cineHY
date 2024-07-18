<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cine HY - 결제</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
        .btn-secondary {
            margin: 10px;
        }
        .payment-options {
            width: 1200px;
            margin: 20px auto;
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
        }
        .total-amount {
            width: 1200px;
            margin: 20px auto;
            background-color: #f8f9fa;
            padding: 20px;
            text-align: right;
        }
        .movie-info {
            width: 1200px;
            margin: 20px auto;
            background-color: #f8f9fa;
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }
        .footer {
            width: 100%;
            margin: 20px auto;
            background-color: #f8f9fa;
            padding: 20px;
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

    <!-- 우측 상단 버튼(상영시간표, 예매 다시하기) -->
    <div style="width: 1200px; margin: 0 auto;">
        <button type="button" class="btn btn-secondary" style="float: right;">예매 다시하기</button>
        <button type="button" class="btn btn-secondary" style="float: right; margin-right: 20px;">상영시간표</button>
    </div>
    <br><br><br>

    <!-- 결제 수단 -->
    <div class="payment-options">
        <h2>결제 수단</h2>
        <br><br><br>
        <div class="custom-control custom-radio custom-control-inline">
            <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input" onclick="creditCard()">
            <label class="custom-control-label" for="customRadioInline1">신용카드</label>
          </div>
          <div class="custom-control custom-radio custom-control-inline">
            <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
            <label class="custom-control-label" for="customRadioInline2">휴대폰 결제</label>
          </div>
          <div class="custom-control custom-radio custom-control-inline">
            <input type="radio" id="customRadioInline3" name="customRadioInline1" class="custom-control-input">
            <label class="custom-control-label" for="customRadioInline3">간편 결제</label>
          </div>
          <div class="custom-control custom-radio custom-control-inline">
            <input type="radio" id="customRadioInline4" name="customRadioInline1" class="custom-control-input">
            <label class="custom-control-label" for="customRadioInline4">토스</label>
          </div>
        <br><br>
        <select class="custom-select" style="width: 300px; margin: 0 auto; display: none;" id="selectCard">
            <option selected>카드를 선택하세요</option>
            <option value="1">신한</option>
            <option value="2">우리</option>
        </select>
    </div>

    <!-- 결제 금액 -->
    <div class="total-amount">
        <h2>결제 금액</h2>
        <p id="totalPrice">100</p>
    </div>

    <!-- 영화 정보 및 좌석 정보 -->
    <div class="movie-info">
        <div>
            <img src="..." alt="영화 포스터" class="img-fluid">
            <p>영화 제목</p>
        </div>
        <div>
            <p>극장: xxx</p>
            <p>일시: xxx</p>
            <p>상영관: xxx</p>
            <p>인원: xxx</p>
        </div>
        <div>
            <p>좌석명: 일반석</p>
            <p>좌석번호: I1, I2</p>
        </div>
        <div>
            <button type="button" class="btn btn-dark" id="orderBtn">
                결제하기
            </button>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>Cine HY</p>
        <p>(04377) 서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층 (한강로동)</p>
        <p>대표이사: 이상덕 | 사업자등록번호: 111-81-45696 | 이메일: master@cgv.co.kr</p>
        <p>© CJ CGV. All Rights Reserved</p>
    </div>

    

    <script>
    
    // 사전 검증
	    $(document).ready(function() {
	    	var merchant_uid = "O" + new Date().getTime();
	    	var totalPrice = $("#totalPrice").text();
	    	
	    	$.ajax({
	    		url : "payment/prepare",
	    		method : "post",
	    		contentType : "application/json",
	    		data : JSON.stringify({
	    			merchantUid : merchant_uid,
	    			amount : totalPrice
	    		})
	    	});
	    })
    
	   
	    
       
	    // 결제 버튼 클릭시 진행되는 결제 API process
        $("#orderBtn").on("click", function () {
            // var userId = $("#userid").val();
            // var userName = $("#username").val();
   
            var merchant_uid = "O" + new Date().getTime(); // 고유한 주문번호 생성 

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
                if (rsp.success) {
					$.ajax({
						url : "payment/validate",
						method : "post",
						contentType : "application/json",
						data : JSON.stringify({
							impUid : rsp.imp_uid,
							merchantUid : rsp.merchant_uid,
						}),
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
</body>
</html>