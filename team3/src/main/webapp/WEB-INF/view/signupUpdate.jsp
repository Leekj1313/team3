<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.card {
		background: #fff;
		border-radius: 2px;
		display: inline-block;
		height: 1000px;
		margin: 1rem;
		position: relative;
		width: 1000px;
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
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="card card-1 container col-5 p-5">
<h3>회원정보 수정</h3>
<form action="<%=request.getContextPath()%>/signup/update" class="was-validated" method="post">
	<div class="mb-3 mt-3">
		<label for="uname" class="form-label">이름(실명)</label>
		<input type="text" class="form-control" id="uname" name="uname" readonly value="${member.me_name}">
	</div>
	<label for="id" class="form-label">아이디</label>
	<div class="input-group">
		<input type="text" class="form-control" id="id" name="id" readonly value="${member.me_id}">
	</div>
	<div class="mb-3 mt-3">
		<label for="pw" class="form-label">비밀번호</label>
			<a href="<c:url value="/"/>" class="btn btn-outline-dark col-12">수정하기</a>		
	</div>
	
	<div class="mb-3 mt-3">
		<label for="email" class="form-label">이메일</label>
		<input type="email" class="form-control" id="email" name="email" value="${member.me_email}">
		<!-- 
		<input type="email" class="form-control" id="email" value="${member.me_email}" name="email" required>
		 <div class="valid-feedback"></div>
		<div class="invalid-feedback">필수 입력 정보입니다.</div>
		 -->
	</div>
	<div class="mb-5 mt-3">
		<label for="phone" class="form-label">전화번호</label>
		<input type="text" class="form-control" id="phone" name="phone" value="${member.me_phone}">
		<!--
		<input type="text" class="form-control" id="phone" value="${member.me_phone}" name="phone" required>
		 <div class="valid-feedback"></div>
		<div class="invalid-feedback">필수 입력 정보입니다.</div>  
		-->
	</div>
	<button type="submit" class="btn btn-outline-dark col-12">저장하기</button>
</form>
</div>
</body>
</html>