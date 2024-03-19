<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 댓글</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="mt-3 mb-3 comment-box">
<h3>댓글</h3>
	<div class="comment-list">
		<div class="input-group mb-3">
		<div class="col-3">${cpmment.me_id}</div>
		<div class="col-9">${cpmment.cm_content}</div>
	</div>
	</div>
	<div class="comment-pagination">
		<ul class="pagination justify-content-center">
		
		</ul>
</div>
</div>
</body>
</html>