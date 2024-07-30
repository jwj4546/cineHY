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
    	
    	const info = JSON.parse(window.sessionStorage.getItem('seatInfo'));	
    
    	window.onload = () => {
    		
    		let text = '';
    		const formatter = new Intl.NumberFormat('ko-KR');
    		
    		text += `
    			<tr class="ticketItem">
            		<td id="poster" style="text-align:center; width:200px;"></td>
            		<td id="movieName">
                		${info.movieName}
                		<input type="hidden" id="movieCode" value="${info.movieCode}" />
            		</td>
            		<td>
                		${info.theaterName}
            		</td>
            		<td>${info.startTime}</td>
            		<td>${info.seat}</td>
            		<td>
            			<input type="hidden" value="${info.price}" id="totalPrice" />
            			${formatter.format(info.price)}원
            		</td>
        		</tr>
        	`;
					 
			 document.getElementById("reLoad").innerHTML = text;
    		
    		$.ajax({
    			url : 'movieList/details',
    			type : 'get',
    			dataType : 'json',
    			data : {movie_id : parseInt(info.movieCode)},
    			success : (data) => {
    				console.log(data);
    				$('#poster').html(`<img src="https://image.tmdb.org/t/p/w500${data.poster_path}" style="height:200px; width=auto;"/>`);
    			},
    			error : (xhr, status, error) => {
    		        console.error("AJAX Error: ", status, error);
    			}
    		});
    	};
    	
    	
    	// 결제 버튼 클릭시
    	$("#orderBtn").on("click", () => {
    		
   	    	const merchant_uid = "O" + new Date().getTime();
   	    	const userId = $("#userId").val();
   	    	const userName = $("#userName").val();
   	    	const phoneNo = $("#phoneNo").val();
   	    		
   	    	$.ajax({
   	    		url : "payment/prepare",
   	    		method : "POST",
   	    		contentType : "application/json",
   	    		data : JSON.stringify({
   	    			merchantUid : merchant_uid,
   	    			amount : info.price
   	    		})
   	    	});
   	    	
   	    	

            const IMP = window.IMP;
            IMP.init("imp33642125"); 
            

	            IMP.request_pay({
	                pg: "html5_inicis",          
	                pay_method: "card",           
	                merchant_uid: merchant_uid,  
	                name: info.movieName,
	                amount: info.price,           
	                buyer_name: userName,         
	                buyer_tel: phoneNo    

	            }, (rsp) => {
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
						}).done((data) => {
							let msg = '결제가 완료되었습니다.';
							const payInfo = {
									"merchantUid" : rsp.merchant_uid,
									"userId" : userId,
									"userName" : rsp.buyer_name,
									"payMethod" : rsp.pay_method,
									"productName" : rsp.name,
									"amount" : rsp.paid_amount,
									"phoneNo" : rsp.buyer_tel,
									"receipt" : rsp.receipt_url
							};
							$.ajax({
								type : "POST",
								url : "savePay",
								contentType : "application/json",
								data : JSON.stringify(payInfo),
								success : (response) => {
							
						
							const ticketInfo = {
								"merchantUid" : rsp.merchant_uid,
								"userId" : userId,
								"userName" : rsp.buyer_name,
								"receipt" : rsp.receipt_url,
								"payMethod" : rsp.pay_method,
								"movieCode" : item.productId,		
								"movieTitle" : item.productName,
								"summary" : item.productComment,
								"price" : item.oneTotal,						
								"phoneNo" : rsp.buyer_tel,
								"amount" : item.cartAmount,
								"cartNo" : item.cartNo
							
							};
							
							return $.ajax({
                                type: "post",
                                url: "saveTicket",
                                contentType: "application/json",
                                data: JSON.stringify(orderInfo)
							}).done(() => {
									if(confirm("결제 완료")) {
                                   		window.location.href = "orderResult?merchantUid=" + rsp.merchant_uid;	
                                    } 
                                    else {
                                    	alert("결제에 실패하였습니다.")
                                    	window.location.href = 'productlist';
                                    }
	                            });
	                        }
	                    });
		            });
		        } else {
		            let msg = '결제를 실패하였습니다.';
		            alert(msg);
		        }
		    });
		});
    </script>

<jsp:include page="../common/footer.jsp"></jsp:include>


</body>
</html>
