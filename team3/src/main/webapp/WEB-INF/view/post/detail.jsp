<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post detail-게시글 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container">
	<h1>게시글 상세</h1>
	<div class="mb-3 mt-3">
	    <label for="community" class="form-label">게시판:</label>
	    <a href="">게시판명</a>
  	</div>
	<div class="mb-3 mt-3">
		<label class="form-label">게시판</label>
		<input type="text" class="form-control" readonly="readonly" value="${post.po_num}">
	</div>
	<div class="mb-3 mt-3">
		<label class="form-label">제목</label>
		<input type="text" class="form-control" readonly="readonly" value="${post.po_title}">
	</div>
	<div class="mb-3 mt-3">
		<label class="form-label">작성자</label>
		<input type="text" class="form-control" readonly="readonly" value="${post.po_me_id}">
	</div>
	<div class="mb-3 mt-3">
		<label class="form-label">작성일</label>
		<input type="text" class="form-control" readonly="readonly" value="${post.po_date}">
	</div>
	<div class="mb-3 mt-3">
		<label for="title" class="form-label">조회수</label>
		<input type="text" class="form-control" readonly="readonly" value="${post.po_view}">
	</div>
	<div class="mb-3 mt-3 clearfix">
		<button type="button" class="btn btn-outline-success btn-up float-start col-6" data-state="1">추천</button>
		<button type="button" class="btn btn-outline-success btn-down float-end col-6" data-state="-1">비추천</button>
	</div>
	<div class="mb-3 mt-3">
		<label for="content" class="form-label">내용</label>
		<div class="form-control" style="min-height: 400px">${post.po_content}</div>
	</div>
	<c:if test="${fileList != null && fileList.size() != 0 }">
		<div class="mb-3 mt-3">
			<label class="form-label">첨부파일</label>
			<c:forEach items="${fileList}" var="file">
				<a href="<c:url value="/download?filename=${file.fi_name}"/>" download="${file.fi_ori_name}" class="form-control">${file.fi_ori_name}</a>
			</c:forEach>
		</div>
	</c:if>
	<a href="<c:url value="/post/update"/>" class="btn btn-outline-warning">게시글 수정</a>
	<a href="<c:url value="/post/delete"/>" class="btn btn-outline-danger">게시글 삭제</a>
	<a href="<c:url value="/post/report"/>" class="btn btn-outline-dark">게시글 신고</a>
	<a href="<c:url value="/post/list"/>" class="btn btn-outline-primary">이전으로</a>
	
</body>
</html>