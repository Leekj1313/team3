<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post-게시글 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container">
	<h1>게시글 리스트</h1>
	<form action="<c:url value="/post/list"/>">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${postList}" var="post">
				<tr>
					<td>${post.po_num}</td>
					
					<td>
						
						<a href="<c:url value="/post/detail?num=${post.po_num}"/>">${post.po_title}</a>
						
					</td>
					<td>
						<a href="<c:url value=""/>">${post.po_me_id}</a>
					</td>
					<td>${post.po_date}</td>
					<td>${post.po_view}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
		    	<li class="page-item">
		    		<c:url var="prevUrl" value="/post/list">
		    			<c:param name="type" value="${pm.cri.type}"/>
		    			<c:param name="search" value="${pm.cri.search}"/>
		    			<c:param name="page" value="${pm.startPage-1}"/>
		    		</c:url>
		    		<a class="page-link" href="${prevUrl}">이전</a>
		    	</li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
		    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
		    		<c:url var="page" value="/post/list">
		    			<c:param name="type" value="${pm.cri.type}"/>
		    			<c:param name="search" value="${pm.cri.search}"/>
		    			<c:param name="page" value="${i}"/>
		    		</c:url>
		    		<a class="page-link" href="${page}">${i}</a>
		    	</li>
			</c:forEach>
	    	<c:if test="${pm.next}">
		    	<li class="page-item">
		    		<c:url var="nextUrl" value="/post/list">
		    			<c:param name="type" value="${pm.cri.type}"/>
		    			<c:param name="search" value="${pm.cri.search}"/>
		    			<c:param name="page" value="${pm.endPage+1}"/>
		    		</c:url>
		    		<a class="page-link" href="${nextUrl}">다음</a>
		    	</li>
	    	</c:if>
	  	</ul>
	  	<hr>
		<div class="input-group">
			<select class="form-control" name="type">
				<option value="all" <c:if test='${pm.cri.type == "all"}'>selected</c:if>>전체</option>
				<option value="bo_title" <c:if test='${pm.cri.type == "po_title"}'>selected</c:if>>제목</option>
				<option value="bo_me_id" <c:if test='${pm.cri.type == "po_me_id"}'>selected</c:if>>작성자</option>
			</select>
			<input type="text" class="form-control" placeholder="검색어" name="search" value="${pm.cri.search}">
			<button class="btn btn-outline-success">검색</button>
		</div>
			<br>
		<a href="<c:url value="/post/insert"/>" class="btn btn-outline-primary">게시글 작성</a>
		</div>
</body>
</html>