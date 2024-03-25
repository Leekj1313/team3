<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<!-- 부트스트랩5 css/js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">

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
	
	.btn-tmpPost-select {
	  display: inline; 
	  width: 100%; 
	  margin-bottom: 5px;
	  border: 0;
	}
	
	.btn-tmpPost-select:hover {
	  background-color: #e0e0e0;
	  cursor: pointer;
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
	<h2 style="font-weight: bold; margin-bottom: 50px">글쓰기</h2>
   	<form action="<c:url value="/post/insert" />" method="post" enctype="multipart/form-data">
		<div class="mb-3 mt-3">
	        <button class="btn btn-success" style="float: right; margin-bottom: 10px">등록 <i class="bi bi-pencil-fill" style="font-size:small;"></i></button>
		    <label for="board" class="form-label">게시판을 선택해주세요.</label>
		    <select class="form-select" id="board" name="board">
		       <c:forEach items="${boardList}" var="board">
		        <option value="${board.bo_num}" <c:if test="${bNum == board.bo_num}">selected</c:if>>${board.bo_name}</option>
		     </c:forEach>
		  </select>
		</div>
		<div class="mb-3 mt-3">
		    <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요." name="title">
		</div>
        <div class="btn-temp">
          <button type ="button" id ="temSaveBtn" class="btn btn-success btn-temSave">임시글 저장</button>
          <div class="dropdown">
          	<button type ="button" id ="temLoadBtn" class="btn btn-success btn-temLoad dropdown-toggle" data-bs-toggle="dropdown">임시글 불러오기</button>
          	<ul class="dropdown-menu temp-dropdown">
			</ul>
          </div>
      	</div>
        <div class="mb-3 mt-3">
          <textarea rows="10" class="form-control" id="content" name="content" placeholder="내용" style="margin-top: 100px"></textarea>
        </div>
        <div class="mb-3 mt-3">
          <label for="file" class="form-label" style="font-weight: bold">첨부파일</label>
          <input type="file" class="form-control" name="file">
          <input type="file" class="form-control" name="file">
          <input type="file" class="form-control" name="file">
        </div>
        <input type="hidden" id="isTemp" name="isTemp" value="false">
        <input type="hidden" id="po_num_temp" name="po_num_temp" value="">
   </form>
</div>
<script type="text/javascript">
makeSummerNote();
function makeSummerNote(){
$('[name=content]').summernote({
    placeholder: '내용',
    tabsize: 2,
    height: 400
  })
 };
</script>
<script type="text/javascript">
let count = 0;
let po_num = 0;
$(".btn-temSave").click(function(){
   let title = $("#title").val();
   let content = $("#content").val();
   let boNum = $('#board').val();
   $.ajax({
      url : '<c:url value="/post/temp"/>',
      method : 'post',
      data : {
         po_num,
         count,
         boNum,
         title,
         content
      },
      success : function(data){
         if(data.res=="OK"){
            po_num = data.po_num;
            count = 1;
            alert("게시글 임시저장 완료.")
         }else{
            alert("게시글을 임시저장 하지 못했습니다.")
         }
      }
   });   
});

let flag = false;
$(".btn-temLoad").click(function(){
   $.ajax({
      url : '<c:url value="/post/temp"/>',
      method : 'get',
      success : function(data){
         let str ='';
         if(data.tmpList.length !=0){
            
            for(item of data.tmpList){
               str += 
               `
               <li><button type="button" class="btn-tmpPost-select" data-num="\${item.po_num}" data-boNum="\${item.po_bo_num}" data-poTitle="\${item.po_title}" data-poContent="\${item.po_content}">\${item.po_title}</button></li>      
               `
            }
            $('.temp-dropdown').html(str).show();
            flag = !flag;
            if(!flag){
            	$('.temp-dropdown').hide();
            }
         }
      }
   })
})

$(document).on("click",".btn-tmpPost-select",function(){
   
   if(confirm("임시 저장된 게시글을 불러올 시 기존 게시글 정보가 사라집니다. 진행하시겠습니까?")){
	
      let po_num = $(this).data("num");
      let po_bo_num = $(this).data("bonum");
      let po_title = $(this).data("potitle");
      let po_content = $(this).data("pocontent");
      console.log(po_num,po_bo_num,po_title,po_content);
      $('#board').val(po_bo_num);
      $('#title').val(po_title);
      //$('#content').val(po_content);
      $('#content').summernote('code', po_content);
      $("#isTemp").val("true");
      $("#po_num_temp").val(po_num);
      $('.temp-dropdown').hide();
      flag =!flag;
   }
   
})
</script>
<jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>