<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호<title>
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
<h3>새 비밀번호</h3>
<form action="<c:url value="/password/update"/>" class="was-validated" method="post">
	<input type="hidden" id="id" name="id" value="${user.me_id}">
	<div class="mb-3 mt-3">
		<label for="pw" class="form-label">새 비밀번호</label>
		<input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw" required>
		<div class="valid-feedback"></div>
		<div class="invalid-feedback">필수 입력 정보입니다.</div>
	</div>
	<div class="mb-3">
		<label for="pw2" class="form-label">새 비밀번호 확인</label>
		<input type="password" class="form-control" id="pw2" placeholder="Enter password check" name="pw2" required>
		<div class="valid-feedback-pw"></div>
		<div class="invalid-feedback">필수 입력 정보입니다.</div>
	</div>
	<button type="submit" class="btn btn-outline-dark col-12">비밀번호 변경</button>
</form>
</div>
<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$('#pw2').keyup(function(){
	let pw1 = document.getElementById('pw').value;
	let pw2 = document.getElementById('pw2').value;
	
	if(pw1 != "" || pw2 != ""){
		if(pw1 == pw2){
			$(".valid-feedback-pw").html('비밀번호가 일치합니다.');
			//$(".valid-feedback-pw").show();
			
		}else{
			$(".valid-feedback-pw").html('비밀번호가 일치하지 않습니다.');
			//$(".valid-feedback-pw").show();
		}
	}
})
</script>
</body>
</html>