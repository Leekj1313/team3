<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	.login-box {
	    margin: auto;
	    margin-top: 100px;
	    width: 500px;
	    height : 400px;
	    background-color: #EEEFF1;
	    border-radius: 5px;
	    text-align: center;
	    padding: 20px;
	}
	
	.login-box input {
	    width: 100%;
	    padding: 10px;
	    box-sizing: border-box;
	    border-radius: 5px;
	    border: none;
	    margin-top : 10px;
	}
	
	.login-box .in {
	    margin-bottom: 10px;
	}
	
	.login-box #btn {
	    background-color: #1BBC9B;
	    margin-bottom: 30px;
	    color: white;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/profile.jsp"/>

<div class="login-box">
    <form action="<c:url value="/find/password"/>" method="post">
    	<h2 style="font-weight: bold">비밀번호 찾기</h2>
    	<div class="input-group">
     		<label for="id" class="form-label">아이디</label>
        	<input type="text" placeholder="아이디" class="id" id="id" name="id" required>
    	</div>
    	<div class="input-group">
        	<label for="phone" class="form-label">전화번호</label>
        	<input type="text" placeholder="전화번호" class="phone" id="phone" name="phone" required>
    	</div>
        <input type="submit" id="btn" value="비밀번호 찾기"><br>
    </form>
</div>
<jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>