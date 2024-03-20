<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 신고</title>
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
<h3>게시글 신고</h3>
<form action="<%=request.getContextPath()%>/report/insert" class="was-validated" method="post">

	<div class="mb-3 mt-3">
		<label for="report_type" class="form-label">신고종류</label>
		    <select class="form-control" id="report_type" name="report_type">
		    	<c:forEach items="${list}" var="report_type">
		    		<option value="${report_type.rt_name}">${report_type.rt_name}</option>
		    	</c:forEach>
		    </select>
	</div>
	
	<label for="report_name" class="form-label">신고사유</label>
	
		<div class="input-group">
			<div class="mb-3 mt-3">
			    <label for="title" class="form-label">신고사유</label>
			    <input type="text" class="form-control" id="re_title" placeholder="신고사유 name="re_title">
		  	</div>
		</div>
	
		<label for="report_content" class="form-label">신고내용</label>
		<div class="mb-3 mt-3">
		    <textarea rows="10" class="form-control" id="report_content" name="report_content" placeholder="신고내용"></textarea>
		</div>
	
	
	<button type="submit" class="btn btn-outline-dark col-12">신고접수</button>
	
</form>
</div>
</body>
</html>