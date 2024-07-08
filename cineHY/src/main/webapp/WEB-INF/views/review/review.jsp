<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}

        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
    </style>
</head>
<body>
    
    

    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>게시판</h2>
            <br>
            
            
            
            	
            <br>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>첨부파일</th>
                    </tr>
                </thead>
                <tbody> 
                
                <!--DB에서 가져온 내용 -->
                    <!-- 조회된 결과 있을때 -->
                	
		                    <c:forEach items="${ list }" var="review">
		                    	<tr class="review-detail" id ="reviewNo-${review.reviewNo }">
		                    		<td>${review.reviewNo }</td>
		                    		<td>${review.reviewTitle }</td>
		                    		<td>${review.reviewWriter }</td>
		                    		<td>${review.count }</td>
		                    		<td>${review.createDate }</td>
		                    		
		                    	</tr>
		                    </c:forEach>
	                                
                    
                </tbody>
            </table>
            <br>
            
            <script>
            	$(() =>{
            		
            		$('.board-detail').click(e =>{
            			
            			
            			
            			location.href = 'board-detail?boardNo=' + e.currentTarget.id.split('-')[1];
            			
            			
            	
            		
            		});
            	
            	} );
            
            </script>

            
	                	
            <br><br>
            <script type="text/javascript">
            $(()=>{
            	$('#searchForm option[value="${condition}"]').after('selected', true);
            });
            </script>
            
        </div>
        <br><br>

    </div>


</body>
</html>