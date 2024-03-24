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

<div class="container mt-3">
<h2>내 프로필</h2>
<p>회원 프로필 정보 입니다.</p>            
	<table class="table table-hover">
		<label for="id" class="form-label">이름(실명)</label>
	  		<div class="input-group">
	  			<input type="text" class="form-control" id="uname" readonly value="${member.me_name}"></input>
	    		<button type="button" class="btn btn-outline-dark btn-insert">수정</button>
			</div>
			<br>
	   	<label for="pw" class="form-label">아이디</label>
	    <div class="input-group">
	   		<input type="text" class="form-control" id="uname" readonly value="${member.me_name}"></input>
	   		<button type="button" class="btn btn-outline-dark btn-insert">수정</button>
		</div>
		<br>
	   	<label for="pw" class="form-label">이메일</label>
	     	<div class="input-group">
	   			<input type="text" class="form-control" id="uname" readonly value="${member.me_name}"></input>
	    		<button type="button" class="btn btn-outline-dark btn-insert">수정</button>
			</div>
			<br>
	</table>
</div>

<div class="container mt-3">
<h2>보안설정</h2>
<p>회원 보안 정보 입니다.</p>            
	<table class="table table-hover">
		<label for="pw" class="form-label">패스워드</label>
			<div class="input-group">
				<input type="text" class="form-control" id="uname" readonly value="${member.me_name}"></input>
				<button type="button" class="btn btn-outline-dark btn-insert">수정</button>
			</div>
			<br>
		<label for="pw" class="form-label">전화번호</label>
			<div class="input-group">
				<input type="text" class="form-control" id="uname" readonly value="${member.me_name}"></input>
				<button type="button" class="btn btn-outline-dark btn-insert">수정</button>
			</div>
			<br>
	</table>
</div>

</form>
</div>
</body>
</html>