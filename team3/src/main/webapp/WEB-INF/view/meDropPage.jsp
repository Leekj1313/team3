<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
	<h3>회원탈퇴</h3>
	<form action = '<c:url value="/signup/delete"/>' method= 'post'>
		<label for="id" class="form-label">아이디</label>
		<div class="input-group">
			<input type="text" class="form-control" id="id" name="id"  placeholder="Enter id">		
		</div>
		<div class="mb-3 mt-3">
		<label for="id" class="form-label">비밀번호</label>
			<input type="password" class="form-control" id="pw" name="pw"  placeholder="Enter password">		
		</div>
		<br>
			<button type='button' class="btn btn-outline-dark col-12 del-mem">탈퇴하기</button>		
	</form>
</div>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
$('.del-mem').click(function(){
	if(!confirm('정말 회원탈퇴를 진행하시겠습니까?')){
		return;
	}
	$("form").submit();
});
</script>
</body>
</html>