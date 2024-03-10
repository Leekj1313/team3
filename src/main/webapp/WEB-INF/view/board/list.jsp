<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
  .postname {
  	color : black;
  	text-decoration: none;
  }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container">
	<h2 class="p-3">자유게시판</h2>
	<form action="<c:url value="/board/list"/>" class="mb-3 mt-3">
		<div class="input-group">
			<select name="type" class="form-control">
				<option value="all" <c:if test='${pm.cri.type == "all"}'>selected</c:if>>전체</option>
				<option value="title" <c:if test='${pm.cri.type == "title"}'>selected</c:if>>제목</option>
				<option value="title" <c:if test='${pm.cri.type == "title"}'>selected</c:if>>제목+내용</option>
				<option value="writer" <c:if test='${pm.cri.type == "writer"}'>selected</c:if>>작성자</option>
			</select>
		    <input type="text" class="form-control" placeholder="검색어" name="search" value="${pm.cri.search}">
		    <button class="btn btn-outline-dark">검색</button>
		</div>
	</form>
	<div class="form-check form-switch d-md-flex justify-content-md-end">
	  <input class="form-check-input" type="checkbox" id="mySwitch" name="darkmode" value="yes" checked>
	  <label class="form-check-label mb-3 mx-3" for="mySwitch">공지 숨기기</label>
	</div>
	<table class="table table-hover">
	    <thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>추천수</th>
			</tr>
	    </thead>
	    <tbody>
			<tr>
				<td>5</td>
				<td>
					<a class="postname" href="<c:url value="/board/detail"/>">자유게시판 게시글5</a>
				</td>
				<td>user5</td>
				<td>03/09 20:18</td>
				<td>9</td>
				<td>0</td>
			</tr>
			<tr>
				<td>4</td>
				<td>자유게시판 게시글4</td>
				<td>user4</td>
				<td>03/09 20:18</td>
				<td>77</td>
				<td>5</td>
			</tr>
			<tr>
				<td>3</td>
				<td>자유게시판 게시글3</td>
				<td>user3</td>
				<td>03/09 20:18</td>
				<td>4</td>
				<td>0</td>
			</tr>
			<tr>
				<td>2</td>
				<td>자유게시판 게시글2</td>
				<td>user2</td>
				<td>03/09 20:18</td>
				<td>10</td>
				<td>2</td>
			</tr>
			<tr>
				<td>1</td>
				<td>자유게시판 게시글1</td>
				<td>user1</td>
				<td>03/09 20:18</td>
				<td>3</td>
				<td>0</td>
			</tr>
			<c:if test="${list.size() == 0 }">
				<tr>
					<th colspan="5">
						<h3 class="text-center">등록된 게시글이 없습니다.</h3>
					</th>
				</tr>
			</c:if>
	    </tbody>
	</table>
	<ul class="pagination justify-content-center">
	  <li class="page-item"><a class="page-link" href="javascript:void(0);">이전</a></li>
	  <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
	  <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
	  <li class="page-item"><a class="page-link" href="javascript:void(0);">다음</a></li>
	</ul>
	<div class="d-md-flex justify-content-md-end">
		<a href="<c:url value="/board/insert"/>" class="btn btn-outline-dark">게시글 등록</a>	
	</div>
</div>
</body>
</html>