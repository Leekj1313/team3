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
<style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  .boardname {
  	color : #046582;
  	text-decoration: none;
  }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-sm-4">
		<table class="table table-hover table-bordered">
		  <thead>
		    <tr>
		      <th>
		      	<a href="<c:url value="#"/>" class="boardname">공지게시판</a>
		      </th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>John</td>
		    </tr>
		    <tr>
		      <td>Mary</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		  </tbody>
		</table>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-4">
		<table class="table table-hover table-bordered">
		  <thead>
		    <tr>
		      <th>
		      	<a href="<c:url value="#"/>" class="boardname">HOT게시판</a>
		      </th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>John</td>
		    </tr>
		    <tr>
		      <td>Mary</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		  </tbody>
		</table>
      <hr class="d-sm-none">
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-sm-4">
		<table class="table table-hover table-bordered">
		  <thead>
		    <tr>
		      <th>
		      	<a href="<c:url value="/post/list"/>" class="boardname">자유게시판</a>
		      </th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>John</td>
		    </tr>
		    <tr>
		      <td>Mary</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		  </tbody>
		</table>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-4">
		<table class="table table-hover table-bordered">
		  <thead>
		    <tr>
		      <th>
		      	<a href="<c:url value="#"/>" class="boardname">취미게시판</a>
		      </th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>John</td>
		    </tr>
		    <tr>
		      <td>Mary</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		  </tbody>
		</table>
      <hr class="d-sm-none">
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-sm-4">
		<table class="table table-hover table-bordered">
		  <thead>
		    <tr>
		      <th>
		      	<a href="<c:url value="#"/>" class="boardname">정보게시판</a>
		      </th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>John</td>
		    </tr>
		    <tr>
		      <td>Mary</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		  </tbody>
		</table>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-4">
		<table class="table table-hover table-bordered">
		  <thead>
		    <tr>
		      <th>
		      	<a href="<c:url value="#"/>" class="boardname">축구게시판</a>
		      </th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>John</td>
		    </tr>
		    <tr>
		      <td>Mary</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		    <tr>
		      <td>July</td>
		    </tr>
		  </tbody>
		</table>
      <hr class="d-sm-none">
    </div>
  </div>
</div>

</body>
</html>