<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>상품 등록/수정</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
        <h2 class="text-center mb-4">상품 등록</h2>
        <form id="productForm" method="post" action="save" enctype="multipart/form-data">
            <div class="form-group row">
                <label for="name" class="col-sm-2 col-form-label">상품이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="productName" placeholder="상품 이름">
                </div>
            </div>
            <div class="form-group row">
                <label for="category" class="col-sm-2 col-form-label">카테고리</label>
                <div class="col-sm-10">
                      <select class="custom-select" id="inputGroupSelect01" name="productCategory">
                        <option selected>선택</option>
                        <option value="m">영화관람권</option>
                        <option value="p">팝콘</option>
                        <option value="d">음료</option>
                        <option value="s">스낵</option>
                      </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="productInfo" class="col-sm-2 col-form-label">상품정보</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="productInfo" rows="10" name="productComment" placeholder="상품정보"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="price" class="col-sm-2 col-form-label">가격</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="price" name="productPrice" placeholder="가격">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">상품 사진</label>
                <div class="col-sm-10">
                    <div><input type="file" id="upfile" class="form-control-file border" name="upfile" onchange="loadImg(this);"></div>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">상세 정보 이미지</label>
                <div class="col-sm-10">
                    <div class="row">
                        <div class="col">
                        	<img id="imgArea" src="" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-10 offset-sm-2">
                    <button type="submit" class="btn btn-primary">상품등록</button>
                    <button type="reset" class="btn btn-secondary">취소</button>
                </div>
            </div>
        </form>
    </div>
    <script>
    	function loadImg(inputFile) {
    		
    		if(inputFile.files.length) {
    			const reader = new FileReader();
    			
    			reader.readAsDataURL(inputFile.files[0]);
    			
    			reader.onload = e => {
    				document.getElementById('imgArea').src = e.target.result;
    			};
    		} else {
    			document.getElementById('imgArea').src = "";
    		}
    	}
    
    </script>
    
    <footer class="text-center mt-5">
        <p>
            (04377) 서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층(한강로동)<br>
            대표이사: 이름 | 사업자등록번호: 123-45-67890 | 통신판매업신고번호: 제2021-서울용-0662호<br>
            개인정보보호책임자: 이름 | 호스팅사업자: CJ 올리브네트웍스 | 문의전화: 02-1234-5678 | 이메일: email@example.com<br>
            © CJ CGV. All Rights Reserved.
        </p>
    </footer>

</body>
</html>