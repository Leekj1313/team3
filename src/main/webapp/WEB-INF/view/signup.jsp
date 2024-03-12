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
<!-- <script type="text/javascript">
import { Ripple, initMDB, Input } from "mdb-ui-kit";
initMDB({ Ripple, Input });
</script> -->
<style type="text/css">
	.divv {
		border: solid 1px gray;
		box-shadow: 5px 5px 5px 5px gray inset;
		margin: 20px;
	}
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
<h3>회원가입</h3>
<form action="<%=request.getContextPath()%>/signup" class="was-validated" method="post">
	<div class="mb-3 mt-3">
		<label for="uname" class="form-label">이름(실명)</label>
		<input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>
		<div class="valid-feedback"></div>
		<div class="invalid-feedback">필수 입력 정보입니다.</div>
	</div>
	<label for="id" class="form-label">아이디</label>
	<div class="input-group">
		<input type="text" class="form-control" id="id" placeholder="Enter id" name="id" required>
		<button class="btn btn-outline-dark" type="button" id="idCheck">중복 확인</button>
		<div class="valid-feedback"></div>
		<div class="invalid-feedback">필수 입력 정보입니다.</div>
	</div>
	<div class="mb-3 mt-3">
		<label for="pw" class="form-label">비밀번호</label>
		<input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw" required>
		<div class="valid-feedback"></div>
		<div class="invalid-feedback">필수 입력 정보입니다.</div>
	</div>
	<div class="mb-3">
		<label for="pw2" class="form-label">비밀번호 확인</label>
		<input type="password" class="form-control" id="pw2" placeholder="Enter password check" name="pw2" required>
		<div class="valid-feedback-pw"></div>
		<div class="invalid-feedback">필수 입력 정보입니다.</div>
	</div>
	<div class="mb-3 mt-3">
		<label for="email" class="form-label">이메일</label>
		<input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
		<div class="valid-feedback"></div>
		<div class="invalid-feedback">필수 입력 정보입니다.</div>
	</div>
	<div class="mb-5 mt-3">
		<label for="phone" class="form-label">전화번호</label>
		<input type="text" class="form-control" id="phone" placeholder="Enter phone" name="phone" required>
		<div class="valid-feedback"></div>
		<div class="invalid-feedback">필수 입력 정보입니다.</div>
	</div>
	<button type="submit" class="btn btn-outline-dark col-12">가입하기</button>
</form>
</div>
<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
let flag = false;
$("#idCheck").click(function(){
	let id = $("[name=id]").val();
	fetch(`<c:url value="/id/check"/>?id=\${id}`)
	.then(response=>response.text())
	.then(data => {
		if(data == "true"){
			alert("사용 가능한 아이디입니다.");
			flag = true;
		}else{
			alert("이미 사용중인 아이디입니다.");
		}
	})
	.catch(error => console.error("Error : ", error));
});
$("[name=id]").change(function(){
	flag = false;
});
$("form").submit(function(){
	//정규표현식을 구현
	
	if(!flag){
		alert("아이디 중복 확인을 하세요.");
		return false;
	}
});

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