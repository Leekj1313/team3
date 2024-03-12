<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
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
			      	<li><a class="dropdown-item" href="<c:url value="/post/insert"/>">카페 글쓰기</a></li>
			      	<li><a class="dropdown-item" href="<c:url value="/post/list"/>">카페글 보기</a></li>
			    </ul>
			</li>
		 	<li class="nav-item">
				<a class="nav-link" href="<c:url value="/logout"/>">로그아웃</a>
			</li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
	<h1>게시글 상세</h1>
	<div class="mb-3 mt-3">
	    <label for="community" class="form-label">게시판:</label>
	    <a href="#">게시판명1</a>
  	</div>
	<div class="mb-3 mt-3">
	    <label for="title" class="form-label">제목:</label>
	    <input type="text" class="form-control" id="title" name="title" readonly value="테스트">
  	</div>
  	<div class="mb-3 mt-3">
	    <label for="writer" class="form-label">작성자:</label>
	    <input type="text" class="form-control" id="writer" name="writer" readonly value="user">
  	</div>
  	<div class="mb-3 mt-3">
	    <label for="date" class="form-label">작성일:</label>
	    <input type="text" class="form-control" id="date" name="date" readonly value="2024-03-09">
  	</div>
  	<div class="mb-3 mt-3">
	    <label for="view" class="form-label">조회수:</label>
	    <input type="text" class="form-control" id="view" name="view" readonly value="0">
  	</div>
  	<div class="mb-3 mt-3 clearfix">
  		<button type="button" id="btnUp" data-state="1" class="btn btn-outline-success col-5 float-start">추천</button>
  		<button type="button" id="btnDown" data-state="-1"  class="btn btn-outline-danger col-5 float-end">비추천</button>
  	</div>
  	<div class="mb-3 mt-3">
	    <label for="content" class="form-label">내용:</label>
	    <div class="form-control" style="min-height: 400px;">테스트</div>
  	</div>
  	<div class="mb-3 mt-3">
	    <label for="content" class="form-label">첨부파일:</label>
	    <a href="<c:url value="/download?filename=${file.fi_name}"/>" class="form-control" download="${file.fi_ori_name}">123.txt</a>
  	</div>
  	<a href="<c:url value="/post/list"/>" class="btn btn-outline-primary">목록으로</a>
  	<c:if test="${board.bo_me_id == user.me_id }">
  		<a href="<c:url value="/post/delete"/>" class="btn btn-outline-danger">삭제</a>
  		<a href="<c:url value="/post/update"/>" class="btn btn-outline-warning">수정</a>
  		<a href="<c:url value="/post/report"/>" class="btn btn-outline-dark">신고</a>
  	</c:if>
 		<hr>
  	<div class="mt-3 mb-3 comment-box">
  		<h3>댓글</h3>
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
  		<!-- 댓글 입력 박스 -->
  		<div class="comment-input-box"></div>
  			<div class="input-group">
			    <textarea class="form-control comment-content"></textarea>
			    <button type="button" class="btn btn-outline-success btn-comment-insert">등록</button>
					</div>
  	</div>
</div>
<!-- 추천 기능 구현 -->
<script type="text/javascript">
	let btnUp = document.getElementById("btnUp");
	let btnDown = document.getElementById("btnDown");
	
	btnUp.onclick = recommend;
	
	btnDown.onclick = recommend;
	
	function recommend() {
		//로그인 안했으면
		if('${user.me_id}' == ''){
			//확인 누르면 로그인 페이지로
			if(confirm("로그인이 필요한 서비스입니다. 로그인으로 이동하겠습니까?")){
				location.href = "<c:url value='/login'/>"
			}
			//취소 누르면 현재 페이지에서 추천/비추천 동작을 안함
			else{
				return;
			}
		}
		
		let boNum = '${board.bo_num}';
		//state가 1이면 추천, -1이면 비추천
		let state = this.getAttribute("data-state");
		
		fetch(`<c:url value="/recommend"/>?boNum=\${boNum}&state=\${state}`)
		.then(response => response.text())
		.then(data =>{
			let str = state == 1 ? '추천' : '비추천';
			intiRecommendBtn(btnUp);
			intiRecommendBtn(btnDown);
			switch(data){
				case "1":	
					alert('게시글을 추천했습니다.'); 
					selectRecommendBtn(btnUp);
					break;
				case "-1":	
					alert('게시글을 비추천했습니다.'); 
					selectRecommendBtn(btnDown);
					break;
				case "0":	
					alert(`게시글 \${str}을 취소했습니다.`); 
					break;
				default: 	alert(data);
			}
		})
		.catch(error => console.error(error));
	}
	//추천/비추천 버튼을 기본으로 돌리는 함수
	function intiRecommendBtn(btn) {
		btn.classList.remove('btn-danger');
		btn.classList.add('btn-outline-danger');
	}
	//추천/비부천 버튼을 선택했을 때 색상을 지정하는 함수
	function selectRecommendBtn(btn) {
		btn.classList.remove('btn-outline-danger');
		btn.classList.add('btn-danger');
	}
	<c:if test="${recommend != null}">
		if(${recommend.re_state == 1}){
			selectRecommendBtn(btnUp);
		}else if(${recommend.re_state == -1}){
			selectRecommendBtn(btnDown);
		}
	</c:if>
</script>
<!-- 댓글 등록 구현 -->
<script type="text/javascript">
	//등록 버튼 클릭 이벤트를 등록
	$(".btn-comment-insert").click(function() {
		//로그인 체크
		if('${user.me_id}' == ''){
			//확인 누르면 로그인 페이지로
			if(confirm("로그인이 필요한 서비스입니다. 로그인으로 이동하겠습니까?")){
				location.href = "<c:url value='/login'/>"
			}
			//취소 누르면 현재 페이지에서 댓글 동작을 안함
			else{
				return;
			}
		}
		
		//입력받은 댓글을 가져옴
		let content = $(".comment-content").val();
		//게시글 번호를 가져옴
		let num = '${board.bo_num}';
		$.ajax({
			url : '<c:url value="/comment/insert"/>',
			method : "post",
			data : {
				content,
				num
			},
			success : function(data) {
				if(data == "ok"){
					alert("댓글을 등록했습니다.")
					cri.page = 1;
					getCommentList(cri);
					$(".comment-content").val("");
				}else{
					alert("댓글을 등록하지 못했습니다.")
				}
			},
			error : function(a, b, c) {
				
			}
		})
	});//click end
</script>
<!-- 댓글 조회 구현 -->
<script type="text/javascript">
	//댓글 리스트를 화면에 출력하는 함수
	//댓글 현재페이지 정보
	let cri = {
		page : 1,
		boNum : '${board.bo_num}'
	}
	function getCommentList(cri) {
		$.ajax({
			url : '<c:url value="/comment/list"/>',
			method : "post",
			data : cri,
			success : function(data) {
				console.log(data.list);
				
				let str = '';
				for(comment of data.list){
					let btns = '';
					if('${user.me_id}' == comment.cm_me_id){
						btns +=
						`
							<button class="btn btn-outline-warning btn-comment-update" data-num="\${comment.cm_num}">수정</button>
							<button class="btn btn-outline-danger btn-comment-delete" data-num="\${comment.cm_num}">삭제</button>
						`
					}
					
					str +=
					`
					<div class="input-group mb-3">
		  				<div class="col-3">\${comment.cm_me_id}</div>
		  				<div class="col-6">\${comment.cm_content}</div>
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
						<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage - 1}">이전</a>
					</li>
					`;
				}
				//숫자 페이지
				for(i = pm.startPage; i<= pm.endPage; i++){
					let active = pm.cri.page == i ? "active" : "";
					pmStr += `
						<li class="page-item \${active}">
							<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
						</li>
					`;
				}
				//다음 버튼 활성화 여부
				if(pm.next){
					pmStr += `
					<li class="page-item">
						<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage + 1}">다음</a>
					</li>
					`;
				}
				$(".comment-pagination>ul").html(pmStr);
			},
			error : function(a, b, c) {
				
			}
		});
	}
	$(document).on("click",".comment-pagination .page-link", function() {
		cri.page = $(this).data("page");
		getCommentList(cri);
	})
	getCommentList(cri);
</script>
<!-- 댓글 삭제 기능 -->
<script type="text/javascript">
	//이벤트를 등록할 때 요소가 있으면 해당 요소에 이벤트를 등록. 요소가 나중에 추가되면 동작을 하지 않음
	$("선택자").click(function() {})
	//document 객체에 이벤트를 등록하기 때문에 요소가 나중에 추가되도 동작
	$(document).on("click",".btn-comment-delete", function() {
		let num = $(this).data("num");
		$.ajax({
			url : '<c:url value="/comment/delete"/>',
			method : "post",
			data : {
				num
			},
			success : function(data) {
				console.log(data)
				if(data == 'ok'){
					alert("댓글을 삭제했습니다.");
					getCommentList(cri);
				}else{
					alert("댓글을 삭제하지 못했습니다.");
				}
			},
			error : function(a, b, c) {
				
			}
		});
	})
</script>
</body>
</html>