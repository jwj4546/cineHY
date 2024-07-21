<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

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
        
#sidebar p {
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

#sidebar ul ul a {
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

#sidebarCollapse>span {
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
    <jsp:include page="/WEB-INF/views/common/menubar.jsp"></jsp:include>
      <!-- 사이드바  -->
      <div>
      <div class="wrapper">
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>나의 화양영화</h3>
            </div>

            <ul class="list-unstyled components">
                <p>관리자기능</p>
                <li >
                    <a href="movieEnroll" >상영할 영화 등록</a>                 
                </li>
                <li>
                    <a href="movieScheduleEnroll">상영 스케줄 등록</a>
                <li>
                    <a href="#">회원관리</a>
                </li>
                <li >
				    <a href="productForm">상품 등록</a>
				</li>
				<li>
                    <a href="getQna">1:1 채팅 관리</a>
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
              		<label class="centered-label">안녕하세요! ${sessionScope.loginUser.userId}님의 관리자페이지입니다</label>
              		</div>
                </div>
            </nav>
            
           <div id = "innerCont">
           
           <!-- 여기에 컨텐트를 넣어주세요!!!
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
            -->
           </div>
            

           
    	</div>
	</div>
   	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
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
