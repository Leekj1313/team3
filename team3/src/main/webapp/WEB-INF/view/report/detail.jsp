<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container">
	<c:choose>
		<c:when test="${report != null }">
			<h1>게시글 신고 상세</h1>
			<div class="mb-3 mt-3">
				<label class="form-label">게시글 신고 종류</label>
				<input type="text" class="form-control" readonly="readonly" value="${report.reportType.rt_name}">
			</div>
	
			<div class="mb-3 mt-3">
			    <label for="reportTitle" class="form-label">신고사유</label>
			    <input type="text" class="form-control" id="reportTitle" readonly="readonly" value="${report.re_title}">
		  	</div>
	
	
		<div class="mb-3 mt-3">
			    <label for="reportContent" class="form-label">신고내용</label>
			    <input type="text" class="form-control" id="reportContent" readonly="readonly" value="${report.re_content}">
		  	</div>
			
			</c:when>
		<c:otherwise>
			<h1>없는 게시글이거나 삭제된 게시글입니다.</h1>
		</c:otherwise>
	</c:choose>
</div>

	<button type="submit" class="btn btn-outline-dark col-12">신고접수</button>
</body>
</html>