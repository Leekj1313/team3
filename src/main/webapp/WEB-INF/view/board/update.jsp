<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
<style type="text/css">
	.square {
	    width: 200px;
	    padding: 40px;
	    line-height: 20px;
	    margin-bottom: 30px;
	    margin-top: 30px;
	    box-sizing: border-box;
	    margin-left: 15px;
	    margin-right: 15px;
	}
	
	/* Default box-shadow */
	.box {
	  box-shadow: 0 3px 3px rgba(0,0,0,0.2);
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container square box col-8">
	<form action="<c:url value="/board/update" />" method="post" enctype="multipart/form-data">
		<div class="mb-3 mt-3">
		    <label for="community" class="form-label">게시판</label>
		    <select class="form-control" id="community" name="community">
		    	<c:forEach items="${list}" var="community">
		    		<option value="${community.co_num}">${community.co_name}</option>
		    	</c:forEach>
		    </select>
  		</div>
		<div class="mb-3 mt-3">
		    <label for="title" class="form-label">제목</label>
		    <input type="text" class="form-control" id="title" placeholder="제목" name="title">
  		</div>
  		<div class="mb-3 mt-3">
		    <label for="content" class="form-label">내용</label>
		    <textarea rows="10" class="form-control" id="content" name="content" placeholder="내용"></textarea>
  		</div>
  		<div class="mb-3 mt-3">
		    <label for="file" class="form-label">첨부파일:</label>
		    <input type="file" class="form-control" name="file">
		    <input type="file" class="form-control" name="file">
		    <input type="file" class="form-control" name="file">
  		</div>
  		<button class="btn btn-outline-dark col-12 mt-5">수정 완료</button>
	</form>
</div>
<script type="text/javascript">
	$('[name=content]').summernote({
		placeholder: '내용',
		tabsize: 2,
		height: 400
	});
</script>
</body>
</html>