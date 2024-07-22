<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a49ed31c89f651ea1d5bd9593161c160&libraries=services"></script>
	  
   
    <style>
       #page1 { height: 80px;}
        #page2 { 
          height: 80px;
          display: flex;
          justify-content: space-around;
          margin-right: 30px;
        }

        .Movie-enroll-title { 
          height: 60px;
          width: 600px;
          display: flex;
        }
        .Movie-enroll-title h2 {
          font-weight: 600;
          float: left;
          line-height: 1.7em;
        }

        #page3 {
          height: 340px;
          width: 1200px;
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          margin: 0 auto;
          gap: 10px;
        }
        
        .welcome {
          color : white;
        
        }

        #select-movie {
          grid-column: 2/3;
          grid-column-start: 1;
          grid-column-end: 3;
          width: 100%;
          height: 100%;
          display: flex;
          align-items: center;
          justify-content: center;
          background-color: darkslategrey;
        }

        #Movie-enroll-list {
          grid-column: 3/3;
          grid-column-start: 3;
          grid-column-end: 4;
          background-color: rgb(231, 231, 231);
          display: flex;
          align-items: center;
          justify-content: center;
        }

        #Movie-enroll-title-pagination {
          display: flex;
          justify-content: center;
          margin-top: 50px;
          margin-bottom: 50px;
        }

        #Movie-enroll-list-card {
          display: flex;
        }
        
p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.6em;
    font-weight: 500;
    line-height: 1.7em;
    color: #999;
}
a, a:hover, a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}

.navbar {
    padding: 15px 10px;
    background: #fff;
    border: none;
    border-radius: 0;
    margin-bottom: 40px;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}
.container-fluid {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    margin-top: 45px;
}
#sidebar .sidebar-header {
    padding: 20px;
    margin-top: 90px;
    background: #6d7fcc;
}
#sidebar .sidebar-header {
    padding: 20px;
    margin-top: 90px;
    background: #6d7fcc;
}

.navbar-btn {
    box-shadow: none;
    outline: none !important;
    border: none;
}

.line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

.wrapper {
    display: flex;
    width: 100%;
    align-items: stretch;
    perspective: 1500px;
}


#sidebar {
    min-width: 250px;
    max-width: 250px;
    background: #7386D5;
    color: #fff;
    transition: all 0.6s cubic-bezier(0.945, 0.020, 0.270, 0.665);
    transform-origin: bottom left;
}

#sidebar.active {
    margin-left: -250px;
    transform: rotateY(100deg);
}

#sidebar .sidebar-header {
    padding: 20px;
    background: #6d7fcc;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}
#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}

#sidebar ul li.active > a, a[aria-expanded="true"] {
    color: #fff;
    background: #6d7fcc;
}


a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}




/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */
#content {
    width: 100%;
    padding: 20px;
    min-height: 100vh;
    transition: all 0.3s;
}

#innerCont {
    width: 100%;
    min-height: 100vh;
}

#sidebarCollapse {
    width: 40px;
    height: 40px;
    background: #f5f5f5;
    cursor: pointer;
}

#sidebarCollapse span {
    width: 80%;
    height: 2px;
    margin: 0 auto;
    display: block;
    background: #555;
    transition: all 0.8s cubic-bezier(0.810, -0.330, 0.345, 1.375);
    transition-delay: 0.2s;
}

#sidebarCollapse span:first-of-type {
    transform: rotate(45deg) translate(2px, 2px);
}
#sidebarCollapse span:nth-of-type(2) {
    opacity: 0;
}
#sidebarCollapse span:last-of-type {
    transform: rotate(-45deg) translate(1px, -1px);
}


#sidebarCollapse.active span {
    transform: none;
    opacity: 1;
    margin: 5px auto;
}
.highlighted-item a {
    font-size: 1.2em; 
    font-weight: bold; 
    color: #fff; 
}

.highlighted-item a:hover {
    color: #f8f9fa; 
}

.centered-label {
    display: block; 
    text-align: center; 
    font-size: 2em;
    font-weight: bold;
    margin: 0; 
    padding: 20px; 
    color: #333; 
}

#map {
            width: 100%;
            height: 350px;
        }
        #placesList {
            margin-top: 10px;
        }
        .placeItem {
            margin-bottom: 10px;
            padding: 5px;
            border: 1px solid #ddd;
            cursor: pointer;
        }
        
        
 .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	.wrap * {padding: 0;margin: 0;}
	.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	.info .close:hover {cursor: pointer;}
	.info .body {position: relative;overflow: hidden;}
	.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.info .link {color: #5085BB;}




/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
        transform: rotateY(90deg);
    }
    #sidebar.active {
        margin-left: 0;
        transform: none;
    }
    #sidebarCollapse span:first-of-type,
    #sidebarCollapse span:nth-of-type(2),
    #sidebarCollapse span:last-of-type {
        transform: none;
        opacity: 1;
        margin: 5px auto;
    }
    #sidebarCollapse.active span {
        margin: 0 auto;
    }
    #sidebarCollapse.active span:first-of-type {
        transform: rotate(45deg) translate(2px, 2px);
    }
    #sidebarCollapse.active span:nth-of-type(2) {
        opacity: 0;
    }
    #sidebarCollapse.active span:last-of-type {
        transform: rotate(-45deg) translate(1px, -1px);
    }
    
   

}


    </style>
    <title>영화등록 페이지</title>
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
             
            <ul class="navbar-nav">
                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                    	<div class = "welcome">
                        <label>${sessionScope.loginUser.userNick}님 환영합니다</label> &nbsp;&nbsp;
                        </div>
                        <li class="nav-item active" style="float: right;">
                          <a class="nav-link" href="myPage">마이페이지</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="logout">로그아웃</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item active" style="float: right;">
                          <a class="nav-link" href="login">로그인</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="join">회원가입</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
          </div>
        </nav>
      </header>
      <!-- 사이드바  -->
      <div class="wrapper">
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>나의 화양영화</h3>
            </div>

            <ul class="list-unstyled components">
                <p>마이페이지</p>
                <li >
                    <a href="myInfoUpdate" >나의 정보수정</a>                 
                </li>
                <li>
                    <a href="myTicketList">나의 영화 예매내역</a>
                <li>
                    <a href="myProductList">나의 구매내역</a>
                </li>
                <li >
				    <a href="myReview">나의 영화 평점 & 리뷰</a>
				</li>
				<li>
                    <a href="chatAdmin">관리자와 1:1 채팅 </a>
                </li>
                <li class="highlighted-item">
                    <a href="myNearby">내 주변 영화관 찾기 ></a>
                </li>
                <li>
                    <a href="resign">회원탈퇴</a>
                </li>
            </ul>

        </nav>

        <!-- Page Content Holder -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="navbar-btn">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                    <div>
              		<label class="centered-label">안녕하세요! ${sessionScope.loginUser.userId}님의 마이페이지입니다</label>
              		</div>
                </div>
            </nav>
            
           <div id = "innerCont">
           
        <h1>내 주변 영화관 찾기</h1>
		   <div id="map"></div>
           </div>
         </div>
         

<script>


		var infowindow = new kakao.maps.InfoWindow({zIndex:1})
		
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 7 // 지도의 확대 레벨 
            }; 

        // 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);
        
        

        function addMarker(position, title, address, jibun, url) {
            var marker = new kakao.maps.Marker({
                map: map, 
                position: position
            });

            var content = '<div class="wrap">' + 
                '    <div class="info">' + 
                '        <div class="title">' + 
                '            ' + title + 
                '            <div class="close" onclick="closeOverlay(\'' + title + '\')" title="닫기"></div>' + 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc">' + 
                '                <div class="ellipsis">' + address + '</div>' + 
                '                <div class="jibun ellipsis">' + jibun + '</div>' + 
                '                <div><a href="' + url + '" target="_blank" class="link">예매 ㄱㄱ?</a></div>' + 
                '            </div>' + 
                '        </div>' + 
                '    </div>' +    
                '</div>';

            var overlay = new kakao.maps.CustomOverlay({
                content: content,
                map: map,
                position: marker.getPosition()
            });

            kakao.maps.event.addListener(marker, 'click', function() {
                overlay.setMap(map);
            });

            return overlay;
        }

        function closeOverlay(title) {
            if (overlays[title]) {
                overlays[title].setMap(null);
            }
        }

        var overlays = {};
        
        overlays['화양영화 강남점'] = addMarker(
            new kakao.maps.LatLng(37.5108222996049, 127.058975747876),
            '화양영화 강남점',
            '서울특별시 강남구 봉은사로 524',
            '(우) 63309 (지번) 삼성동 159-1',
            'http://localhost:82/myapp/reservation'
        );

        overlays['화양영화 홍대점'] = addMarker(
            new kakao.maps.LatLng(37.557228128807, 126.925018795463),
            '화양영화 홍대점',
            '서울특별시 마포구 양화로 176',
            '(우) 63309 (지번) 동교동 2181',
            'http://localhost:82/myapp/reservation'
        );

        overlays['화양영화 강서점'] = addMarker(
            new kakao.maps.LatLng(37.5639090755594, 126.803697375411),
            '화양영화 강서방화점',
            '서울 강서구 양천로 476 롯데시네마 가양 4층',
            '(우) 63309 (지번) 등촌동 2181',
            'http://localhost:82/myapp/reservation'
        );

        overlays['화양영화 마곡점'] = addMarker(
            new kakao.maps.LatLng(37.5593327898848, 126.835060692518),
            '화양영화 마곡점',
            '서울특별시 강서구 공항대로 247',
            '(우) 63309 (지번) 딩댕동 2181',
            'http://localhost:82/myapp/reservation'
        );

        overlays['화양영화 종로점'] = addMarker(
            new kakao.maps.LatLng(37.5697055281416, 126.972199549314),
            '화양영화 종로점',
            '서울특별시 중구 소공동 130',
            '(우) 63309 (지번) 국채보상로 2181',
            'http://localhost:82/myapp/reservation'
        );

        overlays['화양영화 잠실점'] = addMarker(
            new kakao.maps.LatLng(37.5013289852791, 127.081341645293),
            '화양영화 잠실점',
            '서울 송파구 올림픽로 300',
            '(우) 63309 (지번) 신천동 2181',
            'http://localhost:82/myapp/reservation'
        );

       
    


// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
        message = '<div style="padding:5px; width:180px">당신 거기 있어줄래요?</div>'; 
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
        
        var ps = new kakao.maps.services.Places();

        ps.keywordSearch('서울 영화관', placesSearchCB); 
        
        function placesSearchCB (data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                var bounds = new kakao.maps.LatLngBounds();

                for (var i=0; i<data.length; i++) {
                    displayMarker2(data[i]);    
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                }       

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            } 
        }
    });
} else {
    // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}



// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}

function displayMarker2(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
            $(this).toggleClass('active');
        });
    });
</script>
     
</body>
</html>