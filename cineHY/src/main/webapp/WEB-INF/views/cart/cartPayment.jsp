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
	
	<style>
	.imageArea {"text-align:center; width:200px;"}
	
	.productImage {"height:100px; width:auto;"}
	
	
	</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"></jsp:include>
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
        <input type="hidden" id="userId" value="${ sessionScope.loginUser.userId }" />
        <input type="hidden" id="userName" value="${ sessionScope.loginUser.userName }" />
        <input type="hidden" id="phoneNo" value="${ sessionScope.loginUser.phoneNo }" />
    </div>

        <div class="text-center mt-4">
            <button type="button" class="btn btn-primary" id="orderBtn">구매하기</button>
        </div>
    </div><br><br>

    
    
    <script>
    	window.onload = () => {
    		const lists = JSON.parse(window.sessionStorage.getItem('list'));
    		
    		let text = '';
    		const formatter = new Intl.NumberFormat('ko-KR');
    		
			lists.forEach(list => {    			
    			
    			text = `
    				<tr class="cartItem">
		                <td class="imageArea"><img src="\${list.changeImage}" class="productImage" /></td>
		                <td>
		                    \${list.productName}
		                    <input type="hidden" class="productId" value="\${list.productId}" />
		                    <input type="hidden" class="cartNo" value="\${list.cartNo}" />
		                    <input type="hidden" class="productPrice" value="\${list.productPrice}" />
		                    <input type="hidden" class="productName" value="\${list.productName}" />
		                    <input type="hidden" class="changeImage" value="\${list.changeImage}" />
		                    <input type="hidden" class="cartAmount" value="\${list.cartAmount}" />
		                    <input type="hidden" class="productComment" value="\${list.productComment}" />
		                    <input type="hidden" class="oneTotal" value="\${list.productPrice * list.cartAmount}" />
                		</td>
                		<td>\${formatter.format(list.productPrice)}원</td>
                		<td>\${list.cartAmount}</td>
                		<td>\${formatter.format(list.productPrice * list.cartAmount)}원</td>
            		</tr>`;
			});
    		document.getElementById("reLoad").innerHTML = text;
    	}
    	
    	window.addEventListener('load', () => {
    		const lists = JSON.parse(window.sessionStorage.getItem('list'));
    		// 금액 계산
			const total = lists.reduce((sum, list) => sum + (list.productPrice * list.cartAmount), 0);
    		
    		document.getElementById("total").innerHTML = total.toLocaleString();
    	 	
    	 	const totalPrice = document.createElement("input");
			totalPrice.type = "hidden";
			totalPrice.name = "total";
			totalPrice.value = total;
			totalPrice.id = "totalPrice";
    	 	
    	 	document.querySelector("#total").append(totalPrice);
    	});
    	
    	</script>
    	
    	<script>
    	
    	// 결제 버튼 클릭시
    	$("#orderBtn").on("click", () => {
    		
   	    	const merchant_uid = "O" + new Date().getTime();
   	    	const userId = $("#userId").val();
   	    	const userName = $("#userName").val();
   	    	const phoneNo = $("#phoneNo").val();
   	    	const totalPrice = $("#totalPrice").val();
   	    	
   	    	const cartItems = [];
   	    	$("tr.cartItem").each(function() {
   	    		const item = {
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
    		
   	    	$.ajax({
   	    		url : "payment/prepare",
   	    		method : "POST",
   	    		contentType : "application/json",
   	    		data : JSON.stringify({
   	    			merchantUid : merchant_uid,
   	    			amount : totalPrice
   	    		})
   	    	});
   	    	
   	    	

            const IMP = window.IMP;
            IMP.init("imp33642125"); 
            

	            IMP.request_pay({
	                pg: "html5_inicis",          
	                pay_method: "card",           
	                merchant_uid: merchant_uid,  
	                name: cartItems[0].productName != null ? cartItems[0].productName : cartItems[0].productName +" 외 " + (cartItems.length-1),                 
	                amount: totalPrice,           
	                buyer_name: userName,         
	                buyer_tel: phoneNo,             
	                img : cartItems[0].changeImage,
	                product_id : cartItems[0].productId,
	           

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
							console.log(data);
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
						
						
						const orderPromises = cartItems.map((item) => {
							const orderInfo = {
								"merchantUid" : rsp.merchant_uid,
								"userId" : userId,
								"userName" : rsp.buyer_name,
								"receipt" : rsp.receipt_url,
								"payMethod" : rsp.pay_method,
								"productId" : item.productId,		
								"productName" : item.productName,
								"productComment" : item.productComment,
								"changeImage" : item.changeImage,
								"price" : item.oneTotal,						
								"phoneNo" : rsp.buyer_tel,
								"amount" : item.cartAmount,
								"cartNo" : item.cartNo
							
							};
							
							return $.ajax({
                                type: "post",
                                url: "saveOrder",
                                contentType: "application/json",
                                data: JSON.stringify(orderInfo)
							});
						});
                                    
							$.when.apply($, orderPromises).then(() => {
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
