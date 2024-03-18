<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 댓글</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="mt-3 mb-3 comment-box">
	<h3>댓글 단 글</h3>
	<!-- 댓글 리스트를 보여주는 박스 -->
	<div class="comment-list">
		<div class="input-group mb-3">
			<div class="col-3">user</div>
			<div class="col-9">댓글 내용</div>
		</div>
	</div>
	<!-- 댓글 페이지네이션 박스 -->
	<div class="comment-pagination">
		<ul class="pagination justify-content-center">
			
		</ul>
	</div>
</div>
		  		
<script type="text/javascript">
	//댓글 현재페이지 정보
	let cri = {
		page : 1,
		poNum : '${post.po_num}'
	}
	//댓글 리스트를 화면에 출력하는 함수
	function getCommentList(cri){
		$.ajax({
			url : '<c:url value="/mypage/mycomment"/>',
			method : "post",
			data : cri,
			success : function(data){
			
				let str = '';
				for(comment of data.list){
					let btns = '';
					if('${user.me_id}' == comment.cm_me_id){
						btns +=					
						`
						<div class="btn-comment-group">
							<button class="btn btn-outline-warning btn-comment-update" data-num="\${comment.cm_num}">수정</button>
							<button class="btn btn-outline-danger btn-comment-delete" data-num="\${comment.cm_num}">삭제</button>
						</div>
						`
					}
					
					str +=
					`
					<div class="input-group mb-3 box-comment">
						<div class="col-3">\${comment.cm_me_id}</div>
						<div class="col-6 cm_content">\${comment.cm_content}</div>
						\${btns}
					</div>
					`;
				}
				$(".comment-list").html(str);
				//JSON.parse(문자열) : json형태의 문자열을 객체로 변환
				//JSON.stringify(객체) : 객체를 json형태의 문자열로 변환
				let pm = JSON.parse(data.pm);
				let pmStr = "";
				//이전 버튼 활성화 여부
				if(pm.prev){
					pmStr += `
					<li class="page-item">
						<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
					</li>
					`;
				}
				//숫자 페이지
				for(i = pm.startPage; i<= pm.endPage; i++){
					let active = pm.cri.page == i ? "active" :"";
					pmStr += `
					<li class="page-item \${active}">
						<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
					</li>
					`
				}
				//다음 버튼 활성화 여부
				if(pm.next){
					pmStr += `
					<li class="page-item">
						<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage+1}">다음</a>
					</li>
					`;
				}
				$(".comment-pagination>ul").html(pmStr);
			}, 
			error : function(a, b, c){
				
			}
		});
	}
	$(document).on("click",".comment-pagination .page-link", function() {
		cri.page = $(this).data("page");
		getCommentList(cri);
	})
	getCommentList(cri);
</script>

</body>
</html>