<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"></jsp:include>
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
        
	        <tbody id="reLoad">
	        	<c:forEach items="${ list }" var="cart">
		            <tr>
		                <td><input type="checkbox" class="checkbox" onclick="changePrice()" checked></td>
		                <td style="text-align:center;"><img src="${ cart.changeImage }" class="changeImage" alt="" style="width: auto; height: 100px;"></td>
		                <td>
		                    <div class="productName">${ cart.productName }</div>
		                </td>
		                <td>
		                	<fmt:formatNumber value="${ cart.productPrice }" pattern="#,###"/>원
		                	<input type="hidden" class="productPrice" value="${ cart.productPrice }" />
		                </td>
		                <td>
		                    <input type="number" class="productAmount"  value="${ cart.cartAmount }" min="1" style="width: auto;" onchange="changePrice()" />
		                </td>
		                <td class="oneTotal">
		                	<input type="hidden"  class="oneTotal" />
		                </td>
		                <td>
			                <input type="hidden" id="productId" class="productId" value="${ cart.productId }" />
		    				<input type="hidden" class="cartNo" value="${ cart.cartNo }" />
		                	<input type="hidden" class="productComment" value="${ cart.productComment }" />
		                	<button type="button" class="btn btn-danger btn-sm" onclick="del()" >삭제</button>
		             	</td>	
		            </tr>
	        	</c:forEach>
	        </tbody>
    </table>
    <div class="text-right mt-3">
        <h4 >결제 예정 금액: <span id="total"></span>원</h4>
    </div>
	
	    <div class="text-center mt-4">
	        <button type="button" class="btn btn-primary" onclick="pay()">구매하기</button>
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
			
			document.getElementsByClassName("oneTotal")[i].innerHTML = oneTotal.toLocaleString() + "원";
			document.getElementsByClassName("oneTotal")[i].value = oneTotal;
		}
			
			var total = 0;	
			for(let k=0; k<count; k++) {
				
				total += document.getElementsByClassName("oneTotal")[k].value;
				
			}
			document.getElementById("total").innerHTML = total.toLocaleString();
			console.log(total);
	}
		
	// 각 항목에 체크를 해제하고 선택할 때 마다 전체 가격이 변하는 함수 + 항목의 수량을 변경할 때 가격과 결제 예정금액이 변경되는 함수
	function changePrice() {
	
		// 반복되는 checkbox의 길이를 count에 저장
		var count = document.getElementsByClassName("checkbox").length;
		
		// count 수 만큼 반복하여 각 항목의 금액 계산
		for(let i=0; i<count; i++) {
			var price = document.getElementsByClassName("productPrice")[i].value;
			var amount = document.getElementsByClassName("productAmount")[i].value;
			var oneTotal = price * amount;
		
			// 체크 해제했을 때 해당 값을 전체 금액에 포함시키지 않는 조건문
			if(document.getElementsByClassName("checkbox")[i].checked == false) {
			
				document.getElementsByClassName("oneTotal")[i].innerHTML = oneTotal.toLocaleString()+"원";
				document.getElementsByClassName("oneTotal")[i].value = 0;
				
			 } else {
				document.getElementsByClassName("oneTotal")[i].innerHTML = oneTotal.toLocaleString()+"원";
				document.getElementsByClassName("oneTotal")[i].value = oneTotal;
			}
			
			// 장바구니 각 항목을 더하여 전체 금액을 계산하는 반복문
			var total = 0;	
			for(let k=0; k<count; k++) {
				total += document.getElementsByClassName("oneTotal")[k].value;
			}
			document.getElementById("total").innerHTML = total.toLocaleString();
		
		}
	}
	
		// 장바구니에서 품목 삭제
	 	function del() {
			
			const productId = document.getElementById("productId").value;
			const result = confirm("해당 품목을 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url : "deleteCart",
					type : "post",
					data : {
						productId : productId
					},
					success : response => {
						if(response === 'D') {
							alert("삭제 되었습니다.");
							document.location.href = document.location.href;
						} else {
							alert("삭제에 실패했습니다.");
						}
					},
					error : () => {
						console.log("삭제 실패ㅠ");
					}
					
				});
			} else {
				
			}
		}
		
		
	/* 	function pay() {
			document.getElementById("payForm").submit();
		} */
		
		function pay() {
			
			
			const count = document.getElementsByClassName("checkbox").length;
			
			const form = $("#payForm");

			const infoArray = new Array();
			for(let i=0; i<count; i++) {
				if(document.getElementsByClassName("checkbox")[i].checked == true) {
					
					const pay = {
						productId : document.getElementsByClassName("productId")[i].value,
						cartNo : document.getElementsByClassName("cartNo")[i].value,
						productComment : document.getElementsByClassName("productComment")[i].value,
						changeImage : document.getElementsByClassName("changeImage")[i].src,
						productName : document.getElementsByClassName("productName")[i].innerHTML,
						productPrice : document.getElementsByClassName("productPrice")[i].value,
						cartAmount : document.getElementsByClassName("productAmount")[i].value 
					
					};
					
					infoArray.push(pay);
				}
            }
			const arr = JSON.stringify(infoArray);
			window.sessionStorage.setItem('list', '');
			window.sessionStorage.setItem('list', arr);
			location.href = "payCart";
			
			
			
			
			/* $.ajax({
				url : "payCart",
				type : "post",
				data : JSON.stringify(infoArray),
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					alert(data);
				},
				error : function(e) {
					alert("error: "+e);
				}
			}); */
			

        } 
		
		
		
 	</script>


<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>
