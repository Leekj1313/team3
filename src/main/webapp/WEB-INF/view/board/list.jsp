<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.box1{width: 10%; height: 100%; float: left; background-color: aliceblue; margin-top: 20px;}
	.btn-update{bottom: 40px; position: relative;}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<c:url value="/"/>">Logo</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
		   <li class="nav-item dropdown">
	   			<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">내 정보</a>
			    <ul class="dropdown-menu">
		      		<li><a class="dropdown-item" href="<c:url value="/myinfo"/>">내 정보 수정</a></li>
			      	<li><a class="dropdown-item" href="#">작성글</a></li>
			      	<li><a class="dropdown-item" href="#">작성댓글</a></li>
			      	<li><a class="dropdown-item" href="#">추천한 글</a></li>
			    </ul>
			</li>
			<li class="nav-item dropdown">
	   			<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">카페 이용</a>
			    <ul class="dropdown-menu">
			      	<li><a class="dropdown-item" href="<c:url value="/board/insert"/>">카페 글쓰기</a></li>
			      	<li><a class="dropdown-item" href="<c:url value="/board/list"/>">카페글 보기</a></li>
			    </ul>
			</li>
		 	<li class="nav-item">
				<a class="nav-link" href="<c:url value="/logout"/>">로그아웃</a>
			</li>
      </ul>
    </div>
  </div>
</nav>
<div class="box1">
	<a href="<c:url value="/category/insert"/>" class="btn btn-outline-success">카테고리 등록</a>
	<a href="<c:url value="/post/insert"/>" class="btn btn-outline-success">게시판 등록</a>
	<hr>
	<h5>카테고리명</h5>
	<button class="btn btn-outline-warning btn-update float-end">!</button>
	<hr>
	<a href="#">게시판명1</a>
	<button class="btn btn-outline-warning">!</button>
	<button class="btn btn-outline-danger">X</button>
	<br>
	<a href="#">게시판명2</a>
	<button class="btn btn-outline-warning">!</button>
	<button class="btn btn-outline-danger">X</button>
	<br>
	<a href="#">게시판명3</a>
	<button class="btn btn-outline-warning">!</button>
	<button class="btn btn-outline-danger">X</button>
	<hr>
	<h5>카테고리명</h5>
	<hr>
	<a href="#">게시판명4</a>
	<br>
	<a href="#">게시판명5</a>
	<br>
	<a href="#">게시판명6</a>
</div>

<div class="container">
	<h1>게시글 리스트</h1>
	<h2>게시판명1</h2>
	<form action="<c:url value="/board/list"/>" class="mb-3 mt-3">
	</form>
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
				<tr>
					<td>1</td>
					<td>
						<a href="<c:url value="/board/detail"/>">테스트</a>
					</td>
					<td>
						<c:url var="page" value="/board/list">
							<c:param name="type" value="writer"/>
	    					<c:param name="search" value="${board.bo_me_id}"/>
	    					<c:param name="page" value="1"/>
						</c:url>
						<a href="#">user</a>
					</td>
					<td>2024-03-09</td>
					<td>0</td>
				</tr>
			<c:if test="${list.size() == 0}">
				<tr>
					<th colspan = "5">
						<h3 class="text-center">등록된 게시글이 없습니다.</h3>
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
  	<hr>
	<div class="input-group">
		<select name="type" class="form-control">
			<option value="all" <c:if test='${pm.cri.type == "all"}'>selected</c:if>>전체</option>
			<option value="title" <c:if test='${pm.cri.type == "title"}'>selected</c:if>>제목</option>
			<option value="writer" <c:if test='${pm.cri.type == "writer"}'>selected</c:if>>작성자</option>
		</select>
	    <input type="text" class="form-control" placeholder="검색어" name="search" value="${pm.cri.search}">
	    <button class="btn btn-outline-danger">검색</button>
  	</div>
  	<br>
	<a href="<c:url value="/board/insert"/>" class="btn btn-outline-success">글등록</a>
</div>
</body>
</html>