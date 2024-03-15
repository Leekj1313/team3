<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container">
	<form action="<c:url value="/board/insert"/>" method="post">
		<h1>게시판 등록</h1>
		<div class="mb-3 mt-3">
			<label for="category" class="form-label">카테고리</label>
			<select class="form-control" name="category" id="category">
				<c:forEach items="${list}" var="category">
					<option value="${category.ca_num}">${category.ca_name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="mb-3 mt-3">
			<label for="title" class="form-label">게시판명</label>
			<input type="text" class="form-control" id="title" placeholder="게시판명" name="title">
		</div>
		<button type="submit" class="btn btn-outline-success col-12">등록하기</button>
	</form>
</div>
</body>
</html>