<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지</title>
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
	
	td{
		line-height: 60px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/profile.jsp"/>

<div class="container mt-3 col-6 card-1">
	<h2 style="font-weight: bold">회원 관리</h2>
	<form action="<c:url value="/admin/membermanager"/>" class="mb-3 mt-3">
		<div class="input-group">
			<select name="type" class="form-select">
				<option value="meId" <c:if test='${pm.cri.type == "meId"}'>selected</c:if>>아이디</option>
				<option value="meAuthority" <c:if test='${pm.cri.type == "meAuthority"}'>selected</c:if>>권한</option>
				<option value="meMsState" <c:if test='${pm.cri.type == "meMsState"}'>selected</c:if>>상태</option>
			</select>
		    <input type="text" class="form-control" placeholder="검색어" name="search" value="${pm.cri.search}">
		    <button class="btn btn-secondary">검색</button>
		</div>
	</form>
	<table class="table table-hover" style="text-align: center">
	    <thead>
			<tr>
				<th>아이디</th>
				<th>권한</th>
				<th>상태</th>	
				<th></th>
			</tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${list}" var="member">
			<tr>
				<td class="col-3" style="font-weight: bold; <c:if test='${member.me_authority == "ADMIN"}'>color: red;</c:if>">${member.me_id}</td>
				<td class="col-3">
					<form action="<c:url value="/admin/memberauth?id=${member.me_id}"/>" class="mb-3 mt-3" method="post">
						<div class="input-group">
							<select class="form-select" name="authority">
								<option value="ADMIN" <c:if test='${member.me_authority == "ADMIN"}'>selected</c:if>>관리자</option>
								<option value="USER" <c:if test='${member.me_authority == "USER"}'>selected</c:if>>회원</option>
								<option value="WUSER" <c:if test='${member.me_authority == "WUSER"}'>selected</c:if>>대기회원</option>
							</select>
							<button class="btn btn-secondary">변경</button>
						</div>
					</form>
				</td>
				<td class="col-2">${member.me_ms_state}</td>
				<td class="col-2">
				   <div class="btn-manager-group">
				      <a href="<c:url value="/admin/memberdelete?id=${member.me_id}"/>" class="btn btn-outline-danger">삭제</a>
				   </div>
				</td>
			</tr>
			</c:forEach>
			<c:if test="${list.size() == 0 }">
				<tr>
					<th colspan="5">
						<h3 class="text-center">등록된 회원이 없습니다.</h3>
					</th>
				</tr>
			</c:if>
	    </tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item">
				<c:url var="prevUrl" value="/admin/membermanager">
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
				<c:url var="page" value="/admin/membermanager">
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="search" value="${pm.cri.search}"/>
					<c:param name="page" value="${i}"/>
				</c:url>
				<a class="page-link" href="${page}">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item">
				<c:url var="nextUrl" value="/admin/membermanager">
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