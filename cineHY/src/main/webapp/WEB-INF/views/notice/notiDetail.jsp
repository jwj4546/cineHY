<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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

        table * {margin:5px;}
        table {width:100%;}
    </style>
</head>
<body>
        
    <jsp:include page="../common/menubar.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기</h2>
            <br>

            <a class="btn btn-secondary" style="float:right;" href="">목록으로</a>
            <br><br>

            <table id="contentArea" algin="center" class="table">
            
            
            
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${notice.noticeTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${notice.noticeWriter }</td>
                    <th>작성일</th>
                    <td>${notice.createDate }</td>
                </tr>
                
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${notice.noticeContent }</p></td>
                </tr>
            </table>
            <br>

            <div align="center">
            
            	<c:if test="${ sessionScope.loginUser.userId == 'admin' }">
				    <a class="btn btn-primary" onclick="postSubmit(this.innerHTML)">수정하기</a>
	                <a class="btn btn-danger" onclick="postSubmit(this.innerHTML)">삭제하기</a>
				</c:if>
                
                
                
                
                
                
                <form method="post" action="" id="postForm">
                	<input type= "hidden" name="boardNo" value="${notice.noticeNo }">
                </form>
                
                
                
                <script>
                
                
                $(() =>{
            
	                function postSubmit(el){
	                	//console.log(el);
	                	/*
	                	if('수정하기'=== el){
	                		$('#postForm').attr('action', 'boardUpdaateForm.do').submit();
	                	}else{
	                		$('#postForm').attr('action', 'boardDelete.do').submit()
	                	}
	                	*/
	                	const attrValue = '수정하기' === el ? 'boardUpdateForm.do' : 'boardDelete.do';
	                	$('#postForm').attr('action', attrValue).submit();
	                }
	                
	                
                });
                
                </script>
                
            </div>
            <br><br>
        </div>
        <br><br>
    </div>
    
    <script>
    
    
    function saveReply(){
    	
    	//빈 문자열이 아닐때만 요청 보낼거임 (빈 게시글작성 막기 위해)trim(): 앞 뒤 공백 제거
    	if($('#content').val().trim() != ''){
    		
    		$.ajax({
        		url : 'reply',
        		data : {
        			refBoardNo : ${ notice.noticeNo },
        			replyContent : $('#content').val(),
        			replyWriter : '${ sessionScope.loginUser.userId }'
        			
        		},
        		type : 'post',
        		
        		success : result => {
        			console.log(result);
        			
        			if(result == 'success'){
        				selectReply();
        				$('#content').val('');
        			};
        		}
        	});
    		
    	}else {
    		alertify.alert('내용 쓰셈');
    	}
    }
    
    
    	$(() =>{
    		selectReply();
    		//setInt
    	})
    
    
    	function selectReply(){
    		
    		$.ajax({
    			url:'reply',
    			type :'get',
    			data : {
    				noticeNo : ${notice.noticeNo}
    			},
    			
    			success : result => {
    				console.log(result);  //json타입의 배열 출력됨
    				
    				let resultStr ='';
    				
    				for(let i in result){
    					resultStr += '<tr>'
    								+'<td>'+ result[i].replyWriter +'</td>'
    								+'<td>'+result[i].replyContent +'</td>'
    								+'<td>'+ result[i].createDate +'</td>'
    								+'</tr>';
    				};
    				
    				$('#replyArea tbody').html(resultStr);
    				$('#rcount').html(result.length);
    			}
    			
    		});
    		
    		
    	}
    	
    </script>
    
     <jsp:include page="../common/footer.jsp" />
    
    
    
    
</body>
</html>