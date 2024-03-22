<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 신고내역</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container">
	<h2>게시글 신고 내역</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>신고사유</th>
				<th>신고자</th>
				<th>신고일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="post">
					<tr>
						<td>${report.re_num}</td>
						<td>
							<c:url var="url" value="/report/detail">
							<c:param name="num" value="${report.re_num}" />
						</c:url>
						<a href="${url}">${report.re_title}</a>
						</td>
						<td>
							<c:url var="page" value="/report/list?poNum=${report.re_num}">
								<c:param name="type" value="writer"/>
		    					<c:param name="search" value="${report.re_me_id}"/>
		    					<c:param name="page" value="1"/>
							</c:url>
							<a href="${page}">${report.re_me_id}</a>
						</td>
						<td><fmt:formatDate pattern="yy/MM/dd hh:mm" value="${report.re_date}"/></td>
					</tr>
			</c:forEach>
			<c:if test="${list.size() == 0}">
				<tr>
					<th colspan = "5">
						<h3 class="text-center">등록된 신고내역이 없습니다.</h3>
					</th>
				</tr>
			</c:if>
		</tbody>
	</table>
	
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
	    	<li class="page-item">
	    		<c:url var="prevUrl" value="/report/list?boNum=${report.re_num}">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${pm.startPage-1}"/>
	    		</c:url>
	    		<a class="page-link" href="${prevUrl}">이전</a>
	    	</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
	    		<c:url var="page" value="/report/list?reNum=${report.re_num}">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${i}"/>
	    		</c:url>
	    		<a class="page-link" href="${page}">${i}</a>
	    	</li>
		</c:forEach>
    	<c:if test="${pm.next}">
	    	<li class="page-item">
	    		<c:url var="nextUrl" value="/post/list?boNum=${report.re_num}">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${pm.endPage+1}"/>
	    		</c:url>
	    		<a class="page-link" href="${nextUrl}">다음</a>
	    	</li>
    	</c:if>
  	</ul>
	<a href="<c:url value="/report/insert"/>" class="btn btn-outline-success">신고</a>
  	<a href="<c:url value="/report/detail"/>" class="btn btn-outline-success">신고상세</a>
	<a href="<c:url value="/post/delete"/>" class="btn btn-outline-success">신고처리</a>
	<a href="<c:url value="/"/>" class="btn btn-outline-success">뒤로가기</a>
	
</div>
</body>
</html>