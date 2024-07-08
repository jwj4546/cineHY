<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find_id</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
</head>
<body>
    <article class="join">

        <h1>회원가입</h1><br><br>

 
        <div>
            <p>회원정보 입력</p>
            
             <div id = must class = must>
		        <p>* 은 필수사항입니다</p>
		     </div>
		    <form action="join.do" method="post">
			    <div>
			        <p>아이디 *</p>
			        <input type="text" id="userId" placeholder="아이디를 입력해주세요." name="userId" required>
			        <button type="button" class="btn btn-dark">중복확인</button>
			    </div>
			    <div>
			        <p>비밀번호 *</p>
			        <input type="password" id="userPwd" placeholder="비밀번호를 입력해주세요." name="userPwd" required>
			    </div>
			    <div>
			        <p>비밀번호 확인 *</p>
			        <input type="password" id="userPwd2" placeholder="비밀번호를 한번 더 입력해주세요." name="pwdCheck" required>
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
			        <input type="text" id="address" placeholder="주소를 입력해주세요." name="address">
			        <button type="button" class="btn btn-dark">주소검색</button>
			    </div>
			    <div>
			        <p>닉네임</p>
			        <input type="text" id="userNick" placeholder="닉네임을 입력해주세요." name="userNick">
			        <button type="button" class="btn btn-dark">중복확인</button>
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
			        <div>
			            <select name="birthYear">
			                <option>2023</option>
			                <option>2022</option>
			                <option>2021</option>
			                <option>2020</option>
			                <option>2019</option>
			                <option>2018</option>
			                <option>2017</option>
			                <option>2016</option>
			                <option>2015</option>
			                <option>2014</option>
			                <option>2013</option>
			                <option>2012</option>
			                <option>2011</option>
			                <option>2010</option>
			                <option>2009</option>
			                <option>2008</option>
			                <option>2007</option>
			                <option>2006</option>
			                <option>2005</option>
			                <option>2004</option>
			                <option>2003</option>
			                <option>2002</option>
			                <option>2001</option>
			                <option>2000</option>
			                <option>1999</option>
			                <option>1998</option>
			                <option>1997</option>
			                <option>1996</option>
			                <option>1995</option>
			                <option>1994</option>
			                <option>1993</option>
			                <option>1992</option>
			                <option>1991</option>
			                <option>1990</option>
			            </select>
			            년
			            <select name="birthMonth">
			                <option>01</option>
			                <option>02</option>
			                <option>03</option>
			                <option>04</option>
			                <option>05</option>
			                <option>06</option>
			                <option>07</option>
			                <option>08</option>
			                <option>09</option>
			                <option>10</option>
			                <option>11</option>
			                <option>12</option>
			            </select>
			            월
			            <select name="birthDay">
			                <option>01</option>
			                <option>02</option>
			                <option>03</option>
			                <option>04</option>
			                <option>05</option>
			                <option>06</option>
			                <option>07</option>
			                <option>08</option>
			                <option>09</option>
			                <option>10</option>
			                <option>11</option>
			                <option>12</option>
			                <option>13</option>
			                <option>14</option>
			                <option>15</option>
			                <option>16</option>
			                <option>17</option>
			                <option>18</option>
			                <option>19</option>
			                <option>20</option>
			                <option>21</option>
			                <option>22</option>
			                <option>23</option>
			                <option>24</option>
			                <option>25</option>
			                <option>26</option>
			                <option>27</option>
			                <option>28</option>
			                <option>29</option>
			                <option>30</option>
			                <option>31</option>
			            </select>
			            일
			        </div>
			    </div>
			    <div>
			        <p>선호장르</p>
			        <div>
			            <div>
			                1순위 :
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
			                2순위 :
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
			    <button type="submit" id="join-btn" class="join-btn btn-primary">가입하기</button>
			    </form>
			

            <div class = "terms" id = "terms">
                <p>이용약관동의</p>
                <div>
                    <input type="checkbox" name="all-agree" id="all-agree">전체 동의하기
                </div>
                <div>
                    <div>
                        <input type="checkbox" name="agree" id="cj-agree">이용약관 동의 <span>(필수)</span>
                        <a href = "terms">약관보기 ></a>
                    </div>
                    <div>
                        <input type="checkbox" name="agree" id="info-agree">개인정보 수집 및 이용 동의 <span>(필수)</span>
                       <a href = "terms">약관보기 ></a>
                    </div>
                    <div>
                        <input type="checkbox" name="agree" id="info-agree">본인은 만 14세 이상입니다 <span>(필수)</span>
                        <a href = "terms">약관보기 ></a>
                    </div>
                    <div>
                        <input type="checkbox" name="agree" id="pro-agree">프로모션 정보 수신 동의 <span>(필수)</span>
                        <a href = "terms">약관보기 ></a>
                    </div>
                    
                    
                    
                    
                </div>
            </div>
        </div>

    </article>
    
   

</body>
</html>