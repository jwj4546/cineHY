<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <jsp:include page="../common/menubar.jsp"></jsp:include>
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
    <jsp:include page="../common/footer.jsp"></jsp:include>

    

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
    
    
    <script>
    
    // 문서가 로딩되면 사전 검증을 위한 결제 데이터 insert
	    $(document).ready(function () {
	        var merchant_uid = "O" + new Date().getTime();
	        var totalPrice = $("#totalPrice").text();
	
	        $.ajax({
	            url: "payment/prepare",
	            method: "post",
	            contentType: "application/json",
	            data: JSON.stringify({
	                merchant_uid: merchant_uid, // 가맹점 주문번호
	                amount: totalPrice // 결제 예정금액
	            })
	        });
	    }
    	
	    
	    
	    
	    
	    // 결제 버튼 클릭시 결제 진행
	    
	    $("#orderBtn").on("click", function () {
                var userid = $("#userid").val();
                var username = $("#username").val();
       
                var merchant_uid = "O" + new Date().getTime(); // 고유한 주문번호 생성 
 
                var IMP = window.IMP;
                IMP.init('impXXXXX'); // 가맹점 식별코드 입력 

                IMP.request_pay({
                    pg: "html5_inicis",           // 등록된 pg사 (적용된 pg사는 KG이니시스)
                    pay_method: "card",           // 결제방식: card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(소액결제)
                    merchant_uid: merchant_uid,   // 주문번호
                    name: gname,                  // 상품명
                    amount: totalPrice,           // 금액
                    buyer_name: username,         // 주문자
                    buyer_tel: phone,             // 전화번호 (필수입력)
                    buyer_addr: addr,    		  // 주소
                    buyer_postcode: post          // 우편번호
                }, function (rsp) {
                    if (rsp.success) {
                    	$.ajax({
                            url: "payment/validate",
                            method: "POST",
                            contentType: "application/json",
                            data: JSON.stringify({
                                imp_uid: rsp.imp_uid,
                                merchant_uid: rsp.merchant_uid,
                            }),
                        }).done(function (data) {
                        	var mesg = '결제가 완료되었습니다.';
                        	 var buyerInfo = {
                                     "merchant_uid": rsp.merchant_uid,
                                     "userid": rsp.buyer_name,
                                     "pay_method": rsp.pay_method,
                                     "name": rsp.name,
                                     "amount": rsp.paid_amount,
                                     "phone": rsp.buyer_tel,
                                     "addr": rsp.buyer_addr,
                                     "post": rsp.buyer_postcode,
                                     "recipient": recipient
                                 };
                        	  $.ajax({
                                  type: "post",
                                  url: "save_buyerInfo",
                                  contentType: "application/json",
                                  data: JSON.stringify(buyerInfo),
                                  success: function (response) {
                                      console.log("결제정보 저장 완료");
                                  }
                              });
                        	 
                        	  var orderInfo = {
                                      "merchant_uid": rsp.merchant_uid,
                                      "userid": userid,
                                      "gcode": rsp.pay_method,
                                      "gname": rsp.name,
                                      "gprice": totalPrice,
                                      "gimage": $("#gimage").val(),
                                      "gcolor": $("#gcolor").val(),
                                      "gsize": $("#gsize").val(),
                                      "gamount": $("#gamount").val(),
                                      "recipient": recipient,
                                      "post": rsp.buyer_postcode,
                                      "addr": rsp.buyer_addr,
                                      "phone": rsp.buyer_tel,
                                      "cartid": $("#cartid").val()
                                  };

                                  $.ajax({
                                      type: "post",
                                      url: "save_orderInfo",
                                      contentType: "application/json",
                                      data: JSON.stringify(orderInfo),
                                      success: function (response) {
                                          console.log("주문완료");
                                          Swal.fire({
                                              text: mesg,
                                              icon: 'success',
                                              confirmButtonColor: '#3085d6',
                                              button: {
                                                  text: '확인',
                                                  closeModal: true
                                              }
                                          }).then(() => {
                                              window.location.href = 'orderDone?merchant_uid=' + response;
                                          });
                                      }
                                  });
                              });
                          } else {
                              var mesg = '결제를 실패하였습니다.';
                              alert(mesg);
                          }
                      });
                  });
    </script>
    
    
    
    
</body>
</html>