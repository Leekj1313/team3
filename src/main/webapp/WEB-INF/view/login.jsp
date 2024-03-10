<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
<div class="container card card-1 col-5 p-5">
	<!-- id와 pw를 입력받아 서버로 전송하는 코드를 작성. post방식으로 전송 -->
	<form action="<%=request.getContextPath()%>/login" method="post">
		<h3>로그인</h3>
		<div class="mb-3 mt-5">
		    <label for="id" class="form-label">아이디</label>
		    <input type="text" class="form-control" id="id" placeholder="아이디" name="id">
	  	</div>
		<div class="mb-3 mt-3">
		    <label for="pw" class="form-label">비밀번호</label>
		    <input type="password" class="form-control" id="pw" placeholder="비밀번호" name="pw">
	  	</div>
		<button class="btn btn-outline-dark col-12">로그인</button>
	</form>
	<!-- 
	session.setAttribute()는 세션에 정보를 저장하고,
	request.setAttribute()는 요청에 정보를 저장
	세션은 세션이 유지되는 동안에 다른 페이지에서도 사용 가능
	요청은 해당 url에 대해서만 사용 가능
	 -->
</div>

</body>
</html>