<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
<style type="text/css">

	.btn-temp {
    display: flex;
    justify-content: flex-end;
    margin-top: 10px;
  }

  .btn-temp .btn {
    margin-left: 5px;
  }

</style>


</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container">
	<form action="<c:url value="/post/update"/>" method="post" enctype="multipart/form-data">
		<div class="mb-3 mt-3">
		    <label for="board" class="form-label">게시판:</label>
		    <select class="form-control" id="board" name="board">
		    	<c:forEach items="${list}" var="board">
		    		<option value="${board.bo_num}">${board.bo_name}</option>
		    	</c:forEach>
		    </select>
	  	</div>
		<div class="mb-3 mt-3">
		    <label for="title" class="form-label">제목:</label>
		    <input type="text" class="form-control" id="title" placeholder="제목" name="title" value="${post.po_title}">
	  	</div>
	  	<div class="btn-temp">
		  	<button type ="button" id ="temSaveBtn" class="btn btn-success">임시글 저장</button>
		  	<button type ="button" id ="temLoadBtn" class="btn btn-success">임시글 불러오기</button>
		</div>

	  	<div class="mb-3 mt-3">
		    <textarea rows="10" class="form-control" id="content" name="content" placeholder="내용">${post.po_content}</textarea>
	  	</div>
	  	<div class="mb-3 mt-3">
		    <label for="content" class="form-label">첨부파일:</label>
		    <input type="file" class="form-control" name="file">
		    <input type="file" class="form-control" name="file">
		    <input type="file" class="form-control" name="file">
	  	</div>
	  	<button class="btn btn-success col-12">수정하기</button>
	</form>
</div>
<script type="text/javascript">
$('[name=content]').summernote({
    placeholder: '내용',
    tabsize: 2,
    height: 400
  });
</script>