<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.profile {
		width: 200px; height: 200px;
		background-color: #dcdcdc;
	
	}
	.menus {
		
	}
	.admin-btn {
		width: 100%;
		margin: 2px 0;
	}
	.side-box { 
		padding: 10px; width: 220px; height: 100%;
		float: left;
		margin-top: 50px; margin-left: 60px;
		box-shadow: 0 3px 3px rgba(0,0,0,0.2);
	}
</style>
</head>
<body>
<div class="side-box">
	<div class="profile">
	</div>
	<c:if test="${user.me_authority eq 'ADMIN' }">
		<div class="admin-menus">
			<a href="<c:url value="/category/list"/>" class="btn btn-secondary admin-btn">카테고리 관리</a>
			<a href="<c:url value=""/>" class="btn btn-secondary admin-btn">게시판 관리</a>
			<a href="<c:url value=""/>" class="btn btn-secondary admin-btn">회원 관리</a>
		</div>
	</c:if>
	<c:if test="${user.me_authority eq 'USER' }">
		<div class="user-menus">
			<a href="<c:url value=""/>" class="btn btn-secondary admin-btn">내가 쓴 글</a>
			<a href="<c:url value="/mypage/mycomment"/>" class="btn btn-secondary admin-btn">댓글 단 글</a>
			<a href="<c:url value="/signup/update"/>" class="btn btn-secondary admin-btn">정보 수정</a>
			<a href="<c:url value="/signup/delete"/>" class="btn btn-secondary admin-btn">회원 탈퇴</a>
		</div>
	</c:if>
</div>
</body>
</html>