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

    <jsp:include page="../common/menubar.jsp"></jsp:include>
      <br><br><br><br>

<div class="container mt-5">
    <div class="row">
        <div class="col">
            <h4>결제</h4>
        </div>
    </div><br><br>

    
    <table class="table table-bordered mt-4">
        <thead>
            <tr>
                <th scope="col">이미지</th>
                <th scope="col">영화명</th>
                <th scope="col">영화관</th>
                <th scope="col">시작 시간 / 상영관</th>
                <th scope="col">좌석</th>
                <th scope="col">구매금액</th>
            </tr>
        </thead>
        
	        <tbody id="reLoad">
	        
	        </tbody>
    </table><br><br>

	<div class="text-right mt-3">
        <input type="hidden" id="userId" value="${ sessionScope.loginUser.userId }" />
        <input type="hidden" id="userName" value="${ sessionScope.loginUser.userName }" />
        <input type="hidden" id="phoneNo" value="${ sessionScope.loginUser.phoneNo }" />
    </div>

        <div class="text-center mt-4">
            <button type="button" class="btn btn-primary" id="orderBtn">결제하기</button>
        </div>
    </div><br><br>

    
    
    <script>
    	window.onload = function() {
    		const info = JSON.parse(window.sessionStorage.getItem('seatInfo'));
    		
    		let text = '';
    		const formatter = new Intl.NumberFormat('ko-KR');
    		
    			
    			
    			text += '<tr class="ticketItem">'
    					 + '<td style="text-align:center; width:200px;"><img src="" style="height:100px; width=auto;"/></td>'
    					 + '<td>' 
    					 + info.movieName
    					 + '<input type="hidden" class="movieCode" value="' + info.movieCode + '" />'
    					 + '</td>'
    					 + '<td>' 
    					 + info.theaterName
    					 + '</td>'
    					 + '<td>' + info.startTime + '</td>'
    					 + '<td>' + info.seat + '</td>'
    					 + '<td>24000원</td>'
    					 + '</tr>'
    					 
    		document.getElementById("reLoad").innerHTML = text;

    		$.ajax({
    			url : "images",
    			type : "get",
    			dataType : "json",
    			data : {movie_id : parseInt(info.movieCode)},
    			success : function() {
    				console.log(data);
    			},
    			error: function(xhr, status, error) {
    		        console.error("AJAX Error: ", status, error);
    			}
    		});
    		
    	}
    	
    	
    	<%-- 
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
    	 	totalPrice.setAttribute("value", total);
    	 	totalPrice.setAttribute('id', 'totalPrice');
    	 	
    	 	document.querySelector("#total").append(totalPrice);
    	});
    	
    	</script>
    	
    	<script>
    	
    	// 결제 버튼 클릭시
    	$("#orderBtn").on("click", function() {
			
    		
    		
    		// 사전검증
   	    	var merchant_uid = "O" + new Date().getTime();
   	    	var userId = $("#userId").val();
   	    	var userName = $("#userName").val();
   	    	var phoneNo = $("#phoneNo").val();
   	    	var totalPrice = $("#totalPrice").val();
   	    	
   	    	var cartItems = [];
   	    	$("tr.cartItem").each(function() {
   	    		var item = {
   	    			oneTotal : $(this).find(".oneTotal").val(),
	   	   	    	productName : $(this).find(".productName").val(),
	   	   	    	day : new Date(),
	   	   	    	productId : $(this).find(".productId").val(),
	   	   	    	productComment : $(this).find(".productComment").val(),
	   	   	    	changeImage : $(this).find(".changeImage").val(),
	   	   	    	cartAmount : $(this).find(".cartAmount").val(),
	   	   	    	cartNo : $(this).find(".cartNo").val()
   	    		};
   	    		cartItems.push(item);
   	    	});
    		
			console.log(cartItems);   	    	
   	    	
   	    	
   	    	$.ajax({
   	    		url : "payment/prepare",
   	    		method : "POST",
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
	                name: cartItems[0].productName+" 외 " + (cartItems.length-1),                  // 상품명
	                amount: totalPrice,           // 금액
	                buyer_name: userName,         // 주문자
	                buyer_tel: phoneNo,             // 전화번호 (필수입력)
	                buyer_addr: "",    		  // 주소
	                buyer_postcode: "",          // 우편번호
	                img : cartItems[0].changeImage,
	                day : "2024-07-09",
	                product_id : cartItems[0].productId,
	                movie_code : "영화",
	                movie_title : "인사이드 아웃2"
	           
	            // 사후 검증
	            }, function (rsp) {
	            	console.log(rsp);
	                if (rsp.success) {
						$.ajax({
							url : "payment/validate",
							method : "POST",
							contentType : "application/json",
							data : JSON.stringify({
								impUid : rsp.imp_uid,
								merchantUid : rsp.merchant_uid
							})
						}).done(function (data) {
							console.log(data);
							// 결제 정보 DB 저장
							//주문 상품 정보 DB 저장
							var msg = '결제가 완료되었습니다.';
							var payInfo = {
									"merchantUid" : rsp.merchant_uid,
									"userId" : userId,
									"userName" : rsp.buyer_name,
									"payMethod" : rsp.pay_method,
									"productName" : rsp.name,
									"amount" : rsp.paid_amount,
									"phoneNo" : rsp.buyer_tel,
									"receipt" : rsp.receipt_url
							};
							console.log(payInfo);
							$.ajax({
								type : "POST",
								url : "savePay",
								contentType : "application/json",
								data : JSON.stringify(payInfo),
								success : function(response) {
									console.log("결제정보 저장 완료");
						
						
						var orderPromises = cartItems.map(function(item) {
							var orderInfo = {
								"merchantUid" : rsp.merchant_uid,
								"userId" : userId,
								"userName" : rsp.buyer_name,
								"receipt" : rsp.receipt_url,
								"payMethod" : rsp.pay_method,
								"productId" : item.productId,		//
								"productName" : item.productName,
								"productComment" : item.productComment,
								"changeImage" : item.changeImage,
								"price" : item.oneTotal,						//
								"phoneNo" : rsp.buyer_tel,
								"amount" : item.cartAmount,
								"cartNo" : item.cartNo
							
							};
							
							console.log(orderInfo);
							return $.ajax({
                                type: "post",
                                url: "saveOrder",
                                contentType: "application/json",
                                data: JSON.stringify(orderInfo)
							});
						});
                                    
							$.when.apply($, orderPromises).then(function() {
								if(confirm("결제 완료")) {
                                    window.location.href = "orderResult?merchantUid=" + rsp.merchant_uid;	
                                    } 
                                    else {
                                    window.location.href = 'productlist';
                                    }
                            });
                        }
                    });
                
            });
        } else {
            var msg = '결제를 실패하였습니다.';
            alert(msg);
        }
    });
});--%>
    </script>

<jsp:include page="../common/footer.jsp"></jsp:include>


</body>
</html>
