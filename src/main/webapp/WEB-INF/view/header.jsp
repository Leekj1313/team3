<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.nav-item {
	  padding: 0.5rem 0xp;
	}
	
	.dropdown-hover:hover>.dropdown-menu {
	display: inline-block;
	}
	
	.dropdown-hover>.dropdown-toggle:active {
	/*Without this, clicking will make it sticky*/
	pointer-events: none;
	}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px; height: 80px">
  <!-- Container wrapper -->
  <div class="container-fluid">
    <!-- Toggle button -->
    <button class="navbar-toggler px-0" type="button" data-mdb-toggle="collapse"
      data-mdb-target="#navbarExampleOnHover" aria-controls="navbarExampleOnHover" aria-expanded="false"
      aria-label="Toggle navigation">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Collapsible wrapper -->
    <div class="collapse navbar-collapse" id="navbarExampleOnHover">
      <!-- Left links -->
      <ul class="navbar-nav me-auto ps-lg-0" style="padding-left: 0.15rem">
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/"/>">HOME</a>
        </li>
        <!-- Navbar dropdown -->
        <li class="nav-item dropdown dropdown-hover position-static">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
            data-mdb-toggle="dropdown" aria-expanded="false">
            Category
          </a>
          <!-- Dropdown menu -->
          <div class="dropdown-menu col-11 mt-0" aria-labelledby="navbarDropdown" style="border-top-left-radius: 0;
                            border-top-right-radius: 0;
                          ">

            <div class="container">
              <div class="row my-4 here">

               
              </div>
            </div>
          </div>
        </li>
      </ul>
      <ul class="navbar-nav ms-auto ps-lg-0" style="padding-right: 0.15rem">
      	<c:if test="${user == null}">
      	<li class="nav-item">
          <a class="nav-link" href="<c:url value="/signup"/>">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/login"/>">로그인</a>
        </li>
        </c:if>
      </ul>
      <!-- Left links -->
    </div>
    <!-- Collapsible wrapper -->
  </div>
  <!-- Container wrapper -->
</nav>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
getBoard();
function getBoard(){
	$.ajax({
		url : '<c:url value="/header"/>',
		method : 'get',
		success : function(data){
			let str = '';
			var url = '<c:url value="/post/list"/>';
			for (category of data.categoryList){
                str += '<div class="col-md-6 col-lg-2 mb-3 mb-lg-0" style="border-right: solid 1px gray;">';
                str += '<div class="list-group list-group-flush">';
                str += '<div style="font-weight: bold; margin-bottom: 20px;">' + category.ca_name + '</div>'; // 카테고리 이름 출력
                for (board of data.boardList){
                    if (board.bo_ca_num === category.ca_num){
                        str += '<a href="' + url + '?boNum=' + board.bo_num + '" class="list-group-item list-group-item-action">' + board.bo_name + '</a>'; // 해당 카테고리에 속하는 보드 출력
                    }
                }
                str += '</div>';
                str += '</div>';
            }
			$(".here").html(str);
		}
	})
}

</script>
</body>
</html>

