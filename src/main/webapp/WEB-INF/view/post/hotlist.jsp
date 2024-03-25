<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.card-1 {
		padding: 30px;
	  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
	  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
	}
	.card-1:hover {
	  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
	}
	.title-text{
	display:block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	min-width: 100px;
	max-width: 100px;
	
	}
	
	table tr th,table tr td {
	text-align: center;
	
	}
	
	.aTag {
	text-decoration: none; color: black;
	}
	
	.aTag:hover {
	text-decoration: underline;
	color: #848484;
	}
	
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/profile.jsp"/>
<div class="container mt-3 col-7 card-1">
	<h2 style="font-weight: bold">HOT 게시판</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>게시판</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>추천수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="post">
					<tr>
						<td>${post.po_num}</td>
						<td>${post.board.bo_name}</td>
						<td>
							<c:url var="url" value="/post/detail">
							<c:param name="num" value="${post.po_num}" />
						</c:url>
						<a class="title-text aTag" href="${url}">${post.po_title}</a>
						</td>
						<td>
							<c:url var="page" value="/post/hotlist?boNum=${board.bo_num}">
								<c:param name="type" value="writer"/>
		    					<c:param name="search" value="${post.po_me_id}"/>
		    					<c:param name="page" value="1"/>
							</c:url>
							<a class="aTag" href="${page}">${post.po_me_id}</a>
						</td>
						<td><fmt:formatDate pattern="yy/MM/dd hh:mm" value="${post.po_date}"/></td>
						<td>${post.po_view}</td>
						<td>${post.po_up}</td>
					</tr>
			</c:forEach>
			<c:if test="${list.size() == 0}">
				<tr>
					<th colspan = "7">
						<h3 class="text-center">등록된 인기글이 없습니다.</h3>
					</th>
				</tr>
			</c:if>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
	    	<li class="page-item">
	    		<c:url var="prevUrl" value="/post/hotlist">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${pm.startPage-1}"/>
	    		</c:url>
	    		<a class="page-link" href="${prevUrl}">이전</a>
	    	</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
	    		<c:url var="page" value="/post/hotlist">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${i}"/>
	    		</c:url>
	    		<a class="page-link" href="${page}">${i}</a>
	    	</li>
		</c:forEach>
    	<c:if test="${pm.next}">
	    	<li class="page-item">
	    		<c:url var="nextUrl" value="/post/hotlist">
	    			<c:param name="type" value="${pm.cri.type}"/>
	    			<c:param name="search" value="${pm.cri.search}"/>
	    			<c:param name="page" value="${pm.endPage+1}"/>
	    		</c:url>
	    		<a class="page-link" href="${nextUrl}">다음</a>
	    	</li>
    	</c:if>
  	</ul>
  	<hr>
  	<form action="<c:url value="/post/hotlist"/>" class="mb-3 mt-3">
		<div class="input-group">
			<select name="type" class="form-control">
				<option value="all" <c:if test='${pm.cri.type == "all"}'>selected</c:if>>전체</option>
				<option value="title" <c:if test='${pm.cri.type == "title"}'>selected</c:if>>제목</option>
				<option value="writer" <c:if test='${pm.cri.type == "writer"}'>selected</c:if>>작성자</option>
			</select>
		    <input type="text" class="form-control" placeholder="검색어" name="search" value="${pm.cri.search}">
		    <button class="btn btn-outline-danger">검색</button>
	  	</div>
	</form>
</div>
<jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>