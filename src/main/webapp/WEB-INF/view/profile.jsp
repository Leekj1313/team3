<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile</title>
<style type="text/css">
	.profile {
		width: 200px; height: 210px;
		background-color: white;
		
	}

	.profile-btn {
		width: 100%;
		margin: 2px 0;
	}
	.side-box { 
		position: fixed;
		padding: 10px; width: 220px; height: auto;
		float: left;
		margin-top: 50px; margin-left: 60px;
		box-shadow: 0 3px 3px rgba(0,0,0,0.2);
		background: white
	}
	.logout-btn {
		border: 2px solid #dcdcdc;
		font-size: 12px;
		width: 60px;
		background-color: #dcdcdc;
		text-align: center;
		margin-left: 70px;
		margin-top: 3px;
	}

	.card-1 {
	  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
	}
	
	.card-1:hover {
	  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
	}
</style>
</head>
<body>
<div style="height: auto;">
	<div class="side-box card-1">
		<c:if test="${user == null}">
			<div class="sign-container">
				<a href="<c:url value="/login"/>" class="btn btn-basic profile-btn">로그인</a>
				<a href="<c:url value="/signup"/>" class="btn btn-secondary profile-btn">회원가입</a>
				<div class="" style="text-align: center">
					<a href="<c:url value="/find/id"/>" class="profile-btn" style="font-size: 8pt; color: gray; display: inline;">아이디 찾기</a>
					<span style="color: gray; opacity: 60%">|</span>
					<a href="<c:url value="/find/password"/>" class="profile-btn" style="font-size: 8pt; color: gray; display: inline;">비밀번호 찾기</a>
				</div>
			</div>
		</c:if>
		<c:if test="${user.me_authority eq 'ADMIN' }">
			<div class="profile" style="text-align: center">
				<img
					src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
					alt="profile image"
					width="100" height="100"
					style="margin-top: 20px; border-radius: 10px" />
				<div class="profile_me_id" style="font-weight: bold; margin-top: 10px"><span class="badge bg-danger" style="margin-right: 5px;">관리자</span>${user.me_id}</div>
				<div class="profile_me_name" style="color: gray; font-size: 12px">${user.me_name}</div>
				<div class="logout-btn">		
					<a class="nav-link btn" href="<c:url value="/logout"/>" data-bs-toggle="tooltip" title="Hooray!">로그아웃</a>
				</div>
			</div>
			<div class="admin-menus">
				<a href="<c:url value="/category/list"/>" class="btn btn-secondary profile-btn">카테고리 관리</a>
				<a href="<c:url value="/board/manager"/>" class="btn btn-secondary profile-btn">게시판 관리</a>
				<a href="<c:url value="/admin/membermanager"/>" class="btn btn-secondary profile-btn">회원 관리</a>
				<a href="<c:url value="/report/list"/>" class="btn btn-secondary profile-btn">신고된 글</a>
			</div>
		</c:if>
		<c:if test="${user.me_authority eq 'USER' }">
			<div class="profile" style="text-align: center">
				<img
					src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
					alt="profile image"
					width="100" height="100"
					style="margin-top: 20px; border-radius: 10px" />
				<div class="profile_me_id" style="font-weight: bold; margin-top: 10px"><span class="badge bg-success" style="margin-right: 5px;">회원</span>${user.me_id}</div>
				<div class="profile_me_name" style="color: gray; font-size: 12px">${user.me_name}</div>
				<div class="logout-btn">		
					<a class="nav-link" href="<c:url value="/logout"/>">로그아웃</a>
				</div>
			</div>
			<div class="user-menus">
				<!-- <div class="profile_me_name btn btn-secondary" style="font-size: 10px;">회원</div> -->
				<a href="<c:url value="/mypage/mypost"/>" class="btn btn-secondary profile-btn">내가 쓴 글</a>
				<a href="<c:url value="/mypage/mycomment"/>" class="btn btn-secondary profile-btn">내가 쓴 댓글</a>
				<a href="<c:url value=""/>" class="btn btn-secondary profile-btn">정보 수정</a>
			</div>
		</c:if>
	</div>
</div>
</body>
</html>