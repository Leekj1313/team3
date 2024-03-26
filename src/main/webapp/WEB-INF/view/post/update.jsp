<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
<style type="text/css">

	.btn-temp {
	   display: flex;
	   justify-content: flex-end;
	   margin-top: 10px;
	}
	
	.btn-temp .btn {
	  margin-left: 5px;
	}
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

<div class="container mt-3 col-7 card-1">
	<h2 style="font-weight: bold">게시글 수정</h2>
	<form action="<c:url value="/post/update"/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${post.po_num}">
		<div class="mb-3 mt-3">
		    <label for="board" class="form-label">게시판:</label>
		    <select class="form-control" id="board" name="board">
		    	<c:forEach items="${boardList}" var="board">
		    		<!--  
		    		<option value="${board.bo_num}">${board.bo_name}</option>
		    		-->
		    		<option value="${board.bo_num}" <c:if test="${post.board.bo_num == board.bo_num}">selected</c:if>>${board.bo_name}</option>
		    	</c:forEach>
		    </select>
	  	</div>
		<div class="mb-3 mt-3">
		    <label for="title" class="form-label">제목:</label>
		    <input type="text" class="form-control" id="title" placeholder="제목" name="title" value="${post.po_title}">
	  	</div>
	  	<div class="mb-3 mt-3">
		    <textarea rows="10" class="form-control" id="content" name="content" placeholder="내용">${post.po_content}</textarea>
	  	</div>
	  	<div class="mb-3 mt-3" id="attachment">
		    <label>첨부파일:</label>
	  		<c:forEach items="${fileList}" var="file">
				<div class="form-control">
					<span>${file.fi_ori_name}</span>
					<a href="" class="btn-del" data-target="${file.fi_num}">&times;</a>
				</div>
			</c:forEach>
		   	<c:forEach begin="1" end="${3 - fileList.size()}">
				<input type="file" class="form-control" name="file">
			</c:forEach>
	  	</div>
	  	<button class="btn btn-success col-12">수정하기</button>
	</form>
</div>
<script type="text/javascript">
$('[name=content]').summernote({
    placeholder: '내용',
    tabsize: 2,
    height: 400
  });
</script>
<script type="text/javascript">
		$(".btn-del").click(function(e){
			e.preventDefault();
			//X버튼의 data-target값을 가져옴
			let fi_num = $(this).data("target");
			
			//input file을 추가
			let inputFile = '<input type="file" class="form-control" name="file">';
			$("#attachment").append(inputFile);
			
			//input hidden을 추가. 삭제하려는 첨부파일 번호를 이용하여
			let inputHidden = `<input type="hidden" name="fi_num" value="\${fi_num}">`;
			$("#attachment").prepend(inputHidden);
			
			//클릭한 X버튼이 있는 첨부파일을 삭제
			$(this).parent().remove();
		})
</script>
<jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>