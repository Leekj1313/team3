
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 글 리스트</title>
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
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/profile.jsp"/>
<div class="container mt-3 col-6 card-1">
	<h2 style="font-weight: bold">신고글 리스트</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>신고유형</th>
				<th>게시글</th>
				<th>신고내용</th>
				<th>신고자</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="report">
				<c:if test="${report.re_state eq '신고접수'}">
						<tr>
							<td>${report.re_num}</td>
							<td>${report.re_rt_name}</td>
							<td>
							<a href="<c:url value="/post/detail?num=${report.re_po_num}"/>">${report.re_title}</a>
							</td>
							<td>${report.re_content}</td>
							<td>${report.re_me_id}</td>
							<td>
								<a href="<c:url value="/report/delete?num=${report.re_po_num}"/>" class="btn btn-outline-danger">삭제</a>
								<a href="<c:url value="/report/update?num=${report.re_num}"/>" class="btn btn-outline-primary">취소</a>
							</td>
						</tr>
				</c:if>
			</c:forEach>
			<c:if test="${list.size() == 0}">
				<tr>
					<th colspan = "6">
						<h3 class="text-center">신고된 글이 없습니다.</h3>
					</th>
				</tr>
			</c:if>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
	    	<li class="page-item">
	    		<c:url var="prevUrl" value="/report/list">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${pm.startPage-1}"/>
	    		</c:url>
	    		<a class="page-link" href="${prevUrl}">이전</a>
	    	</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
	    		<c:url var="page" value="/report/list">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${i}"/>
	    		</c:url>
	    		<a class="page-link" href="${page}">${i}</a>
	    	</li>
		</c:forEach>
    	<c:if test="${pm.next}">
	    	<li class="page-item">
	    		<c:url var="nextUrl" value="/report/list">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${pm.endPage+1}"/>
	    		</c:url>
	    		<a class="page-link" href="${nextUrl}">다음</a>
	    	</li>
    	</c:if>
  	</ul>
</div>
</body>
</html>
