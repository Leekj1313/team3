<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 관리</title>
<!-- 부트스트랩5 css/js -->
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
	.category-list-table {
		margin-top: 20px
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/profile.jsp"/>

<div class="container mt-3 col-6 card-1">
	<h2>카테고리 관리</h2>
	<div class="input-group mb-3 mt-3">
		<input type="text" class="form-control category-content" placeholder="새로 등록할 카테고리 이름을 입력하세요.">
		<button class="btn btn-outline-secondary btn-category-insert" type="button">등록</button>
	</div>

	<table class="table table-hover category-list-table">
		<tbody class="box-category-list">
			<tr class="box-category">
				<td class="col-2">카테고리 번호</td>
				<td class="col-7">카테고리 이름</td>
				<td class="col-3">
					<div class="btn-category-group">
						<button class="btn btn-outline-warning">수정</button>
						<button class="btn btn-outline-danger">삭제</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<!-- 페이지네이션 박스 -->
	<div class="box-category-pagination">
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="javascript:void(0);">이전</a>
			</li>
			<li class="page-item active">
				<a class="page-link" href="javascript:void(0);">1</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="javascript:void(0);">다음</a>
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
let cri = {
	page : 1,
}
//댓글을 불러와서 화면에 출력하는 함수 : 현재 댓글 페이지 정보
displayCategoryAndPagination(cri);
function displayCategoryAndPagination(cri){
	//ajax를 이용해서 서버에 현재 댓글 페이지 정보를 보내고,
	//서버에서 보낸 댓글 리스트와 페이지네이션 정보를 받아와서 화면에 출력
	$.ajax({
		url : '<c:url value="/category/list"/>',
		method : 'post',
		data : cri,
		success : function(data){
			displayCategory(data.list);
			displayCategoryPagination(JSON.parse(data.pm));
		}
	});
}

//댓글이 주어지면 댓글을 화면에 출력하는 함수
function displayCategory(categoryList){
	let str = '';
	if(categoryList.length == 0){
		$(".box-category-list").html('<h3>등록된 댓글이 없습니다.</h3>')
		return;
	}
	
	for(category of categoryList){
		str += `
		<tr class="box-category">
			<td class="col-2">\${category.ca_num}</td>
			<td class="col-7 ca_name">\${category.ca_name}</td>
			<td class="col-3">
				<div class="btn-category-group">
					<button class="btn btn-outline-warning btn-category-update" data-num="\${category.ca_num}">수정</button>
					<button class="btn btn-outline-danger btn-category-delete" data-num="\${category.ca_num}">삭제</button>
				</div>
			</td>
		</tr>`;
	}
	$(".box-category-list").html(str);
}

//페이지네이션이 주어지면 페이지네이션을 화면에 출력하는 함수
function displayCategoryPagination(pm){
	let str = '';
	//이전 버튼 활성화
	if(pm.prev){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
		</li>
		`;
	}
	
	for(i = pm.startPage; i <= pm.endPage; i++){
		let active = pm.cri.page == i ? "active" : "";
		str += `
		<li class="page-item \${active}">
			<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
		</li>
		`;
	}
	
	if(pm.next){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage+1}">다음</a>
		</li>
		`;
	}
	
	$(".box-category-pagination>ul").html(str);
}
//페이지 클릭 이벤트
$(document).on("click", ".box-category-pagination .page-link", function(){
	cri.page = $(this).data("page");
	displayCategoryAndPagination(cri);
});
</script>
<!-- 카테고리 등록 -->
<script type="text/javascript">
$(".btn-category-insert").click(function(){
	//로그인 체크
	if(!${user.me_authority eq 'ADMIN' }){
		if(confirm("관리자 기능입니다. 로그인 화면으로 이동하시겠습니까?")){
			location.href = "<c:url value='/login'/>";
			return;
		}
		//취소 누르면 현재 페이지에서 추천/비추천 동작을 안 함
		else{
			location.href = "<c:url value='/'/>";
			return;
		}
	}
	
	let category = $(".category-content").val();
	
	$.ajax({
		url : '<c:url value="/category/insert"/>',
		method : "post",
		data : {
			category
		},
		success : function(data){
			if(data == "ok"){
				alert("카테고리를 등록했숩니다.");
				cri.page = 1;
				displayCategoryAndPagination(cri);
				$(".category-content").val("");
			}else if(data == "dup"){
				alert("중복된 카테고리입니다.")
			}else{
				alert("카테고리를 등록하지 못했습니다.");
			}
		},
		error : function(a, b, c){
			
		}
	})
	
}); //click end

</script>
<!-- 카테고리 삭제 -->
<script type="text/javascript">
$(document).on("click",".btn-category-delete", function(){
	//로그인 체크
	if(!${user.me_authority eq 'ADMIN' }){
		if(confirm("관리자 기능입니다. 로그인 화면으로 이동하시겠습니까?")){
			location.href = "<c:url value='/login'/>";
			return;
		}
		//취소 누르면 현재 페이지에서 추천/비추천 동작을 안 함
		else{
			location.href = "<c:url value='/'/>";
			return;
		}
	}
	
	let num = $(this).data("num");
	$.ajax({
		url : '<c:url value="/category/delete"/>',
		method : "post",
		data : {
			num
		},
		success : function(data){
			console.log(data);
			if(data == "ok"){
				alert("카테고리를 삭제했습니다.");
				displayCategoryAndPagination(cri);
			}else{
				alert("카테고리를 삭제하지 못했습니다.");
			}
		},
		error : function(a, b, c){
			
		}
	})
});
</script>
<!-- 카테고리 수정 구현 -->
<script type="text/javascript">
$(document).on("click", ".btn-category-update", function(){
	//로그인 체크
	if(!${user.me_authority eq 'ADMIN' }){
		if(confirm("관리자 기능입니다. 로그인 화면으로 이동하시겠습니까?")){
			location.href = "<c:url value='/login'/>";
			return;
		}
		//취소 누르면 현재 페이지에서 추천/비추천 동작을 안 함
		else{
			location.href = "<c:url value='/'/>";
			return;
		}
	}
	
	initCategory();
	//현재 댓글 보여주는 창이 textarea 태그로 변경
	//기존 댓글창을 감춤
	$(this).parents(".box-category").find(".ca_name").hide();
	let comment = $(this).parents(".box-category").find(".ca_name").text();
	let textarea = 
	`
	<textarea class="form-control cat-input">\${comment}</textarea>
	`;
	$(this).parents(".box-category").find(".ca_name").after(textarea);
	
	//수정 삭제 버튼 대신 수정 완료 버튼으로 변경
	$(this).parent().hide();
	let num = $(this).data("num");
	let btn = 
	`
	<button class="btn btn-outline-success btn-complete" data-num="\${num}">수정완료</button>
	`;
	$(this).parent().after(btn);
}); //click end

function initCategory(){
	//감추었던 카테고리 이름을 보여줌
	$(".ca_name").show();
	//감추었던 수정, 삭제 버튼을 보여줌
	$(".btn-category-group").show();
	//추가했던 textarea 태그를 삭제함
	$(".cat-input").remove();
	//추가했던 수정완료 버튼을 삭제함
	$(".btn-complete").remove();
}

//수정 완료 버튼 클릭 이벤트 등록
$(document).on("click", ".btn-complete", function(){
	//로그인 체크
	if(!${user.me_authority eq 'ADMIN' }){
		if(confirm("관리자 기능입니다. 로그인 화면으로 이동하시겠습니까?")){
			location.href = "<c:url value='/login'/>";
			return;
		}
		//취소 누르면 현재 페이지에서 추천/비추천 동작을 안 함
		else{
			location.href = "<c:url value='/'/>";
			return;
		}
	}
	
	//수정하기 위해 필요한 정보를 가져옴 : 수정된 댓글 내용, 댓글 번호
	let num = $(this).data("num");
	let name = $(".cat-input").val();
	//alert(num + ":" + content);
	$.ajax({
		url : '<c:url value="/category/update"/>',
		method : 'post',
		data : {
			num,
			name
		},
		success : function(data){
			if(data == "ok"){
				alert("카테고리를 수정했습니다.");
				displayCategoryAndPagination(cri);
			}else{
				alert("카테고리를 수정하지 못했습니다.")
			}
		},
		error : function(xhr, status, error){
			
		}
	});
});
</script>
</body>
</html>