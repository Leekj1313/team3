<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container">
	<h2>${category.ca_name}</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>게시판</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="board">
					<tr>
						<td>${board.bo_num}</td>
						<td>
							<a href="<c:url value="/post/detail?num=${post.po_num}"/>">${post.po_title}</a>
						</td>
						<td>
							<a href="<c:url value="/post/list?boNum=${board.bo_num}"/>">${board.bo_name}</a>
						</td>
					</tr>
			</c:forEach>
			<c:if test="${list.size() == 0}">
				<tr>
					<th colspan = "5">
						<h3 class="text-center">등록된 게시판이 없습니다.</h3>
					</th>
				</tr>
			</c:if>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
	    	<li class="page-item">
	    		<c:url var="prevUrl" value="/board/list">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${pm.startPage-1}"/>
	    		</c:url>
	    		<a class="page-link" href="${prevUrl}">이전</a>
	    	</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
	    		<c:url var="page" value="/board/list">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${i}"/>
	    		</c:url>
	    		<a class="page-link" href="${page}">${i}</a>
	    	</li>
		</c:forEach>
    	<c:if test="${pm.next}">
	    	<li class="page-item">
	    		<c:url var="nextUrl" value="/board/list">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${pm.endPage+1}"/>
	    		</c:url>
	    		<a class="page-link" href="${nextUrl}">다음</a>
	    	</li>
    	</c:if>
  	</ul>
  	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
	    	<li class="page-item">
	    		<c:url var="prevUrl" value="/board/list?caNum=${category.ca_num}">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${pm.startPage-1}"/>
	    		</c:url>
	    		<a class="page-link" href="${prevUrl}">이전</a>
	    	</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
	    		<c:url var="page" value="/board/list?caNum=${category.ca_num}">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${i}"/>
	    		</c:url>
	    		<a class="page-link" href="${page}">${i}</a>
	    	</li>
		</c:forEach>
    	<c:if test="${pm.next}">
	    	<li class="page-item">
	    		<c:url var="nextUrl" value="/board/list?caNum=${category.ca_num}">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${pm.endPage+1}"/>
	    		</c:url>
	    		<a class="page-link" href="${nextUrl}">다음</a>
	    	</li>
    	</c:if>
  	</ul>
  	<a href="<c:url value="/board/delete"/>" class="btn btn-outline-danger">게시판 삭제</a>
</div>
</body>
</html>