<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>join</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
* {
    margin: 0;
    padding: 0;
    list-style: none;
    box-sizing: border-box;
    word-break: keep-all;
    outline: 0px solid silver;
    font-family: 'Noto Sans KR', sans-serif;
    color: black;
   
}

h1 {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 3rem;
    margin-bottom: 20px;

}

h4 {
    font-size: 0.8rem;
    margin-bottom: 40px;
}

img {
    width: 15px;
}

button {
    font-size: 0.75rem;
    text-align: center;
    border-radius: 5px;
    border: 1px solid #ddd;
    background: none;
    display: block;
    padding: 10px;
    width: 100%;
    margin: 10px auto;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    box-shadow: 2px 2px 4px #ddd;
}
 article {
    padding: 70px 8%;
    text-align: center;
    max-width: 800px;
    margin: 0 auto;
}

article>div {
    padding: 50px 25px;
    border-radius: 15px;
    border: 1px solid #ddd;
}

article input {
    text-align: left;
    width: 100%;
    padding: 10px 15px;
    margin: 5px auto;
    border-radius: 5px;
    border: 1px solid #ddd;
}
.join>div>:nth-child(2) button,
.join>div>:nth-child(8) button,
.join>div>:nth-child(9) button,
.terms div>:nth-child(4),
.sign div div>:first-child {
    background: #555;
    color: white;
}


.join>div>:nth-child(2) button:hover,
.join>div>:nth-child(8) button:hover,
.join>div>:nth-child(9) button:hover,
.terms div>:nth-child(4):hover,
.sign div div>:first-child:hover {
    box-shadow: 0px 0px;
    background: black;
}
.join div div {
    margin-bottom: 25px;
}

.join div div p {
    text-align: left;
    margin-bottom: 10px;
    font-weight: bold;
}

.join>div>:nth-child(2),
.join>div>:nth-child(8),
.join>div>:nth-child(9)
 {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.join>div>:nth-child(2) p,
.join>div>:nth-child(8) p,
.join>div>:nth-child(9) p{
    width: 100%;
}

.join>div>:nth-child(2) input {
    width: 77%;
    margin: 0;
}

.join div:nth-child(2) button {
    width: 20%;
    margin: 0;
}

.join>div>:nth-child(8) input {
    width: 62%;
    margin: 0;
}

.join div:nth-child(8) button {
    width: 35%;
    margin: 0; 
}


.join>div>:nth-child(9) input {
    width: 77%;
    margin: 0;
}
.join div:nth-child(9) button {
    width: 20%;
    margin: 0;
}



.join div:nth-child(10) div {
    text-align: left;
    padding: 10px 15px;
    border-radius: 5px;
    border: 1px solid #ddd;
    font-size: 0.9rem;
}

.join div:nth-child(10) div select {
    border: 1px;
}

.join div:nth-child(10) div select:not(.join div:nth-child(10) div select:first-of-type) {
    margin-left: 15px;
}

.join >div>:last-child div{
    font-size: 0.75rem;
    text-align: left;
    margin: 10px 0;
}

.join >div>:last-child >div:first-of-type{
    margin-bottom: 20px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 20px;
}

.join >div>:last-child div input{
    width: 5%;
    margin-right: 10px;
}

.join >div>:last-child div span{
    color: #ccc;
    font-weight: 300;
}

.join >div>:last-child div div button{
    margin: 0 5px;
    padding: 0;
    width: auto;
    border: none;
    display: inline;
}

.join >div>:last-child div div button:hover{
    box-shadow: 0 0;
}

.join >div>:last-child div button{
    margin-top: 25px;
}

.Male {
    margin-left: 4px; 
    margin-right: 20px; 
  }
  
.must {
    text-align: right;
    border: none;
}




</style>

<script>
    function onCheckClick() {
        const checkB1 = document.getElementById("hy-agree");	
        const checkB2 = document.getElementById("info-agree");
        const checkB3 = document.getElementById("pro-agree");
        const allAg = document.getElementById("all-agree");
        
        if (allAg.checked) {			
            checkB1.checked = true;
            checkB2.checked = true;
            checkB3.checked = true;	
        } else {
            checkB1.checked = false;
            checkB2.checked = false;
            checkB3.checked = false;
        }
    }
    
    function formSub(event) {
        event.preventDefault();
        
       
        const checkB1 = document.getElementById("hy-agree");    
        const checkB2 = document.getElementById("info-agree");
        const checkB3 = document.getElementById("pro-agree");

        
        if (!(checkB1.checked && checkB2.checked && checkB3.checked)) {
            alert('모든 약관에 동의해주세요!'); 
            return false; 
        }

       
        document.getElementById("join-form").submit();
    }
    
    function pwCheck() {
        const $pwdInput = $('#userPwd');
        const $pwdInput2 = $('#userPwd2');
        var regPw = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%&*^?]).{8,16}$/;
        var $userPwd = $('#userPwd');
        
        if (regPw.test($userPwd.val())) {
            if ($pwdInput.val() == $pwdInput2.val()) {
                $('#pwdCheckResult').show().css('color', 'green').text('비밀번호가 일치하며 유효한 형식입니다!');
            } else {
                $('#pwdCheckResult').show().css('color', 'crimson').text('비밀번호가 서로 다릅니다. 다시 확인해주세요!');
            }
        } else {
            $('#pwdCheckResult').show().css('color', 'crimson').text('비밀번호는 최소 8자에서 16자까지 영문자, 숫자 및 특수 문자를 각각 하나 이상 포함해야 합니다.');
        }
    }
    
    function idCheck() {
        var regId = /^[0-9a-z]{5,12}$/;
        var $userId = $('#userId');
        
        if (regId.test($userId.val())) {
            $('#IdCheckResult').show().css('color', 'green').text('유효한 아이디입니다! 중복체크 버튼을 눌러주세요!');
        } else {
            $('#IdCheckResult').show().css('color', 'crimson').text('아이디는 5~12자 사이에 영어소문자와 숫자로 이루어져야 합니다!');
        }
    }
</script>

</head>
<body>
    <article class="join">
        <h1>회원가입</h1><br><br>
        <div>
            <p>회원정보 입력</p>
            <div id="must" class="must">
                <p>* 은 필수사항입니다</p>
            </div>
            <form id="join-form" action="join.do" method="post" enctype="multipart/form-data">
                <div>
                    <p>아이디 * </p><span id="IdCheckResult" style="font-size:12px;"></span>                
                    <input type="text" id="userId" oninput="idCheck()" placeholder="아이디를 입력해주세요." name="userId" required>
                    <button type="button" id="checkId-btn" class="btn btn-dark">중복확인</button>
                </div>
                <div>
                    <p>비밀번호 *</p>
                    <input type="password" id="userPwd" oninput="pwCheck()" placeholder="비밀번호를 입력해주세요." name="userPwd" required>
                </div>
                <div>
                    <p>비밀번호 확인 *</p><span id="pwdCheckResult" style="font-size:12px;"></span>
                    <input type="password" id="userPwd2" oninput="pwCheck()" placeholder="비밀번호를 한번 더 입력해주세요." name="userPwd2" required>
                </div>
                <div>
                    <p>이름 *</p>
                    <input type="text" id="userName" placeholder="이름을 입력해주세요." name="userName" required>
                </div>
                <div>
                    <p>이메일 *</p>
                    <input type="email" id="email" placeholder="이메일을 입력해주세요." name="email" required>
                </div>
                <div>
                    <p>휴대폰 *</p>
                    <input type="tel" id="phoneNo" placeholder="연락처를 입력해주세요.(-없이)" name="phoneNo" required>
                </div>
                <div>
                    <p>주소</p>
                    <input type="text" id="postcode" placeholder="우편번호">
                    <input type="text" id="address" placeholder="주소" name="address"><br>
                    <input type="text" id="detailAddress" placeholder="상세주소">
                    <input type="text" id="extraAddress" placeholder="참고항목">
                    <input type="button" class="btn btn-dark" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                </div>
                <div>
                    <p>닉네임 *</p><span id="NickCheckResult" style="font-size:12px;"></span>
                    <input type="text" id="userNick" placeholder="닉네임을 입력해주세요." name="userNick" required>
                    <button type="button" id="checkNick-btn" class="btn btn-dark">중복확인</button>
                </div>
                <div class="gender" id="gender">
                    <p>성별</p>
                    <div style="display: flex; align-items: center;">
                        <input type="radio" id="Male" value="M" name="gender"><label for="Male">남자</label>
                        <input type="radio" id="Female" value="F" name="gender"><label for="Female">여자</label>
                    </div>
                </div>
                <div>
                    <p>생년월일</p>
                    <input type="date" id="birthDate" name="birthDate">
                </div>
                <div>
                    <p>선호장르</p>
                    <div>
                        <div>
                            선택 1 : 
                            <select name="preGenre1">
                                <option>멜로</option>
                                <option>액션</option>
                                <option>애니메이션</option>
                                <option>공포</option>
                                <option>코미디</option>
                                <option>스릴러</option>
                                <option>SF</option>
                                <option>드라마</option>
                                <option>로맨스</option>
                                <option>뮤지컬</option>
                                <option>판타지</option>
                                <option>역사</option>
                            </select>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            선택 2 :
                            <select name="preGenre2">
                                <option>멜로</option>
                                <option>액션</option>
                                <option>애니메이션</option>
                                <option>공포</option>
                                <option>코미디</option>
                                <option>스릴러</option>
                                <option>SF</option>
                                <option>드라마</option>
                                <option>로맨스</option>
                                <option>뮤지컬</option>
                                <option>판타지</option>
                                <option>역사</option>
                            </select>
                        </div>
                    </div>
                </div>
                
                <button type="submit" id="join-btn" onclick="formSub(event)" class="join-btn btn-primary">가입하기</button>
            </form>
            
            <div class="terms" id="terms">
                <p>이용약관동의</p>
                <div>
                    <input type="checkbox" onclick="onCheckClick()" name="all-agree" id="all-agree">
                    전체 동의하기
                    <br>               
                </div>
                <div>
                    <div>
                        <input type="checkbox" name="agree" id="hy-agree">
                        이용약관 동의 
                        <span>(필수)</span>
                        <a href="terms">약관 보기 ></a>
                    </div>
                    <div>
                        <input type="checkbox" name="agree" id="info-agree">
                        개인정보 수집 및 이용 동의 
                        <span>(필수)</span>
                        <a href="terms">약관 보기 ></a>
                    </div>
                    <div>
                        <input type="checkbox" name="agree" id="pro-agree">
                        프로모션 정보 수신 동의 
                        <span>(필수)</span>
                        <a href="terms">약관 보기 ></a>
                    </div>
                </div>
            </div>
        </div>
    </article>
    
    <script>
    
    
    
    
    $(() => {
        const $idInput = $('#userId');
        const $checkResult = $('#IdCheckResult');
        const $joinSubmit = $('#join-btn');
        const $checkIdBtn = $('#checkId-btn');

        $checkIdBtn.click(() => {
            console.log('checked button');

            $.ajax({
                type: 'get',
                url: 'checkId',
                data: { checkId: $idInput.val() },
                success: response => {
                    console.log(response);

                    if (response === 'N') {
                        $checkResult.show().css('color', 'crimson').text('이미 존재하는 아이디입니다!');
                        $joinSubmit.attr('disabled', true);
                    } else {
                        $checkResult.show().css('color', 'green').text('사용가능한 아이디입니다!');
                        $joinSubmit.removeAttr('disabled');
                    }
                },
                error: () => {
                    console.log('띠용 오류입니다!');
                }
            });
        });
    });
    
    
    $(() =>{

    	const $nickInput = $(' #userNick');
    	const $checkNickResult = $(' #NickCheckResult');
    	const $checkNickBtn = $('#checkNick-btn');
    	const $joinSubmit = $('#join-btn');
    	
    	$checkNickBtn.click(() =>{
    		
    		  console.log('Check Nick button clicked');
    		
    		
    		$.ajax({
    		
    			url : 'checkNick',
    			type : 'get',
    			data : {checkNick : $nickInput.val()},
    			
    			success : response => {
    				
    				console.log(response);
    				
    				if(response === 'N') {
    					$checkNickResult.show().css('color', 'crimson').text('이미 존재하는 닉네임입니다!');
    					$joinSubmit.attr('disabled', true);
    					
    					
    				} else{
    					$checkNickResult.show().css('color', 'green').text('사용가능한 닉네임입니다!');
    					$joinSubmit.removeAttr('disabled');
    			}
    			
    		},
    		
    				error : () => {
    				
    					cosole.log('sorry, this is error')
    				}
    				
    			
    			
    			
    			
    			
    		});
    		
    		
    	});
    });
       
    
    
   
 
    
    </script>
    
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode;
		                document.getElementById("address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
    	  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode;
		                document.getElementById("address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
    
    
   
    
   

</body>
</html>
    
  