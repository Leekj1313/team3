<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.a-group , .writer-view-date-box{
		display: flex;
	    justify-content: flex-end;
	    margin-top: 10px;
	}
	.a-group .btn, .writer-view-date-box .form-label{
		margin-left: 5px;
		display : inline;
	}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container">
			<h1>게시글 상세</h1>
			<div >
				<div class="mb-3 mt-3">
				    <label for="community" class="form-label">게시판:</label>
				    <input type="text" class="form-control" id="community" name="community" readonly value="${board.community.co_name}">
			  	</div>
				<div class="mb-3 mt-3">
				    <label for="title" class="form-label">제목:</label>
				    <input type="text" class="form-control" id="title" name="title" readonly value="${board.bo_title }">
			  	</div>
			  	<div class="writer-view-date-box">
				    <label for="writer" class="form-label">작성자:</label>
				    <label for="view" class="form-label">조회수:</label>	
				    <label for="date" class=form-label>작성일 :</label>		    
			  	</div>
			  	<div class="mb-3 mt-3">
				    <label for="content" class="form-label">내용:</label>
				    <div class="form-control" style="min-height: 400px;">${board.bo_content }</div>
			  	</div>
			  	<c:if test="${fileList != null && fileList.size() != 0}">
				  	<div class="mb-3 mt-3">
					    <label for="content" class="form-label">첨부파일:</label>
					    <c:forEach items="${fileList }" var="file">
					    	<a href="<c:url value="/download?filename=${file.fi_name}"/>" class="form-control" download="${file.fi_ori_name}">${file.fi_ori_name}</a>
					    </c:forEach>
				  	</div>
			  	</c:if>
			  	<div class="mb-3 mt-3 clearfix">
			  		<button type="button" id="btnUp" data-state="1" class="btn btn-outline-danger col-5 float-start">추천</button>
			  		<button type="button" id="btnDown" data-state="-1"  class="btn btn-outline-danger col-5 float-end">비추천</button>
			  	</div>
			  	<div class="a-group">
				  	<a href="<c:url value="/board/list"/>" class="btn btn-success ">목록</a>
				  	<c:if test="${board.bo_me_id == user.me_id }">
				  		<a href="<c:url value="/board/update?num=${board.bo_num}"/>" class="btn btn-warning ">수정</a>
				  		<a href="<c:url value="/board/delete?num=${board.bo_num}"/>" class="btn btn-danger">삭제</a>
				  	</c:if>
			  	</div>
			  				  	<div class="mt-3 mb-3 comment-box">
			  		<h3>댓글</h3>
			  		<!-- 댓글 리스트를 보여주는 박스 -->
			  		<div class="comment-list">
			  			<div class="input-group mb-3">
							<div class="col-3">abc123</div>
							<div class="col-9">댓글 내용</div>
						</div>
			  		</div>
			  		<!-- 댓글 페이지네이션 박스 -->
			  		<div class="comment-pagination">
			  			<ul class="pagination justify-content-center">
			  				
			  			</ul>
			  		</div>
			  		<!-- 댓글 입력 박스 -->
			  		<div class="comment-input-box">
						<div class="input-group">
							<textarea class="form-control comment-content"></textarea>
							<button type="button" class="btn btn-outline-success btn-comment-insert">등록</button>
						</div>
			  		</div>
			  	</div>
			</div>

</div> 
</body>
</html>