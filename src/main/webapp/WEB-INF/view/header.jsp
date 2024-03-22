<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style type="text/css">
	.nav-item {
		padding: 0.5rem 0xp;
		display: inline-block;
	}
	
	.dropdown-hover:hover>.dropdown-menu {
		display: inline-block;
	}
	
	.dropdown-hover>.dropdown-toggle:active {
		pointer-events: none;
	}
	

	.card-1 {
	  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
	}
	
	.card-1:hover {
	  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
	}
	
	.ca-name {
		background: #F2F2F2;
		padding: 0 10px;
		font-weight: bold;
		color: 	#787878;
		border-radius: 10px;
		margin-left: 5px
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="padding: 0px; height: 80px">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Toggle button -->
			<button class="navbar-toggler px-0" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarExampleOnHover"
				aria-controls="navbarExampleOnHover" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>
			
			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarExampleOnHover">
				<!-- Left links -->
				<ul class="navbar-nav me-auto ps-lg-0" style="padding-left: 0.15rem; margin-left: 20px">
					<li class="nav-item">
						<a class="nav-link" href="<c:url value="/"/>">
							<span style="font-weight: bold">TEAM3</span>
							<i class="bi bi-chat-quote-fill" style="font-size: x-large;"></i>
						</a>
					</li>
					<!-- Navbar dropdown -->
					<li class="nav-item dropdown dropdown-hover position-static" style="margin-left: 20px; line-height: 45px">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-mdb-toggle="dropdown" aria-expanded="false">
							CATEGORY </a> <!-- Dropdown menu -->
						<div class="dropdown-menu col-10 mt-0 card-1"
							aria-labelledby="navbarDropdown"
							style="border-top-left-radius: 0; border-top-right-radius: 0;">
							<div class="container">
								<div class="row my-4 here"></div>
							</div>
						</div>
					</li>
				</ul>
				<ul class="navbar-nav ms-auto ps-lg-0"
					style="padding-right: 0.15rem">
					<c:if test="${user == null}">
						<li class="nav-item"><a class="nav-link btn btn-light"
							href="<c:url value="/login"/>">Sign in</a></li>
						<li class="nav-item"><a class="nav-link btn btn-light" style="margin-left: 7px"
							href="<c:url value="/signup"/>">Sign up</a></li>
					</c:if>
					<c:if test="${user != null}">
			        	<li class="nav-item">
				          	<a class="nav-link btn btn-light" href="<c:url value="/logout"/>">Sign out</a>
				        </li>
			        </c:if>
				</ul>
				<!-- Left links -->
			</div>
			<!-- Collapsible wrapper -->
		</div>
		<!-- Container wrapper -->
	</nav>
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
				str += '<div class="col-md-6 col-lg-2 mb-3 mb-lg-0" style="border-right: solid 2px #E6E6E6;">';
				str += '<div class="list-group list-group-flush">';
				str += '<div class="ca-name" style="margin-bottom: 15px">' + category.ca_name + '</div>'; // 카테고리 이름 출력
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

