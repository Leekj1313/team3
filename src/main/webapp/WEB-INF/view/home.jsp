<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
  .boardname {
  	color : #046582;
  	text-decoration: none;
  }
  .box1{padding: 10px; width: 220px; height: 100%; float: left; margin-top: 50px; margin-left: 60px; box-shadow: 0 3px 3px rgba(0,0,0,0.2);}
	.aTag-home {
		text-decoration: none; color: #046582;
	}
	
	.aTag-home:hover {
		text-decoration: underline;
		color: #848484;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/profile.jsp"/>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-sm-4">
		<table class="table table-hover table-bordered">
		  <thead>
		    <tr>
		      <th style="text-align: left;">
		      	<a href="<c:url value="/post/list?boNum=1"/>" class="boardname">공지게시판</a>
		      </th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${postList}" var="post">
		   		<tr>
		   			<td style="text-align: left;">
		   				<a class="aTag-home" href="<c:url value="/post/detail?num=${post.po_num}"/>">${post.po_title}</a> ${post.po_me_id} ${post.po_view}
		   			</td>
		   		</tr>
		  </c:forEach>
		  <c:if test="${postList.size() == 0}">
				<tr>
					<td>등록된 공지가 없습니다.</td>
				</tr>
		  </c:if>
		  </tbody>
		</table>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-4">
		<table class="table table-hover table-bordered">
		  <thead>
		    <tr>
		      <th style="text-align: left;">
		      	<a href="<c:url value="/post/hotlist"/>" class="boardname">HOT게시판</a>
		      </th>
		    </tr>
		  </thead>
		  <tbody>
		   	<c:forEach items="${postHotList}" var="post">
		   		<c:if test="${post.po_up >= 5}">
			   		<tr>
			   			<td style="text-align: left;">
			   				<a class="aTag-home" href="<c:url value="/post/detail?num=${post.po_num}"/>">${post.po_title}</a>
			   				${post.po_me_id} 
			   				${post.po_view} 
			   				<span style="color: #FA5858; font-weight: bold;">${post.po_up}</span>
			   			</td>
			   		</tr>
		   		</c:if>
		  	</c:forEach>
		  	
		  	<c:if test="${postHotList.size() == 0}">
				<tr>
					<td>등록된 인기글이 없습니다.</td>
				</tr>
			</c:if>
		  </tbody>
		</table>
      <hr class="d-sm-none">
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>