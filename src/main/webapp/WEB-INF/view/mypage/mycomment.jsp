<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 댓글 페이지</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	.card-1 {
		padding: 30px;
	  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
	}
	.card-1:hover {
	  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
	}
	.category-list-table {
		margin-top: 20px
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/profile.jsp"/>

<div class="container mt-3 col-6 card-1">
	<h2 style="font-weight: bold">내가 쓴 댓글</h2>
	<form action="<c:url value="/mypage/mycomment"/>" class="mb-3 mt-3">
		<div class="input-group">
			<select name="type" class="form-select">
				<option value="all" <c:if test='${pm.cri.type == "all"}'>selected</c:if>>전체</option>
				<option value="potitle" <c:if test='${pm.cri.type == "potitle"}'>selected</c:if>>게시글 제목</option>
				<option value="cmcontent" <c:if test='${pm.cri.type == "cmcontent"}'>selected</c:if>>댓글 내용</option>
			</select>
		    <input type="text" class="form-control" placeholder="검색어" name="search" value="${pm.cri.search}">
		    <button class="btn btn-secondary"><i class="bi bi-search"></i></button>
		</div>
	</form>
	<table class="table table-hover">
	    <thead>
			<tr>
				<th>번호</th>
				<th>게시글 제목</th>
				<th>작성자</th>
				<th>댓글 내용</th>
			</tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${list}" var="comment">
			<tr>
				<td>${comment.cm_po_num}</td>
				<td >
					<c:url var="url" value="/post/detail">
						<c:param name="num" value="${comment.post.po_num}"/>
					</c:url>
					<a class="aTag" href="${url}">${comment.post.po_title}</a>
				</td>
				<td>${comment.post.po_me_id}</td>
				<td>${comment.cm_content}</td>
			</tr>
			</c:forEach>
			<c:if test="${list.size() == 0}">
				<tr>
					<th colspan="5">
						<h3 class="text-center">등록된 댓글이 없습니다.</h3>
					</th>
				</tr>
			</c:if>
	    </tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item">
				<c:url var="prevUrl" value="/mypage/mycomment">
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="page" value="${pm.startPage - 1}"/>
				</c:url>
				<a class="page-link" href="${prevUrl}">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
				<c:url var="page" value="/mypage/mycomment">
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="page" value="${i}"/>
				</c:url>
				<a class="page-link" href="${page}">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item">
				<c:url var="nextUrl" value="/mypage/mycomment">
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="page" value="${pm.endPage + 1}"/>
				</c:url>
				<a class="page-link" href="${nextUrl}">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</c:if>
	</ul>
</div>
<jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>