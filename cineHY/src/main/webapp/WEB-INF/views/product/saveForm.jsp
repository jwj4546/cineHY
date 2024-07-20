<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>상품 등록</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"></jsp:include>
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
    
    <jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>