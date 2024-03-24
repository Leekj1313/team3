<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="container">
	<h1>게시판 관리</h1>
	<br>
	<form action="<c:url value="/board/manager"/>" method="post">
		<h5>게시판 등록</h5>
		<div class="mb-3 mt-3">
			<label for="category" class="form-label">카테고리</label>
			<select class="form-control" name="category" id="category">
				<c:forEach items="${caList}" var="category">
					<option value="${category.ca_num}">${category.ca_name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="mb-3 mt-3">
			<label for="title" class="form-label">게시판명</label>
			<input type="text" class="form-control" id="title" placeholder="게시판명" name="title">
		</div>
		<button type="submit" class="btn btn-outline-success col-12">등록하기</button>
	</form>
	<br>
	<h5>현재 게시판</h5>
	<div class="mb-3 mt-3 board-manager">
		<div class="mb-3 mt-3 board-set">
		<!-- 외부 반복, div 시작태그와 카테고리 이름 -->
			<div class="board-list">
				<!-- 내부반복, 게시판이름 -->
				<!-- 내부반복 종료 -->
			</div>
				<!-- 외부 반복 종료 -->
		</div>
	</div>
</div>
<!-- 게시판 리스트 출력 -->
<script type="text/javascript">
getBoard();
function getBoard(){
    $.ajax({
        url : '<c:url value="/board/list"/>',
        method : 'get',
        success : function(data){
            let str = '';
            for(category of data.categoryList){
                str += `<div class="board-list">`;
                str += `<div class="col-6 category-name">\${category.ca_name}</div>`;
                str += `<br>`;
                for(board of data.boardList){
                    if(board.bo_ca_num === category.ca_num){
                    	//방금 가져온 board 의 bo_num
                        let boNum = board.bo_num;
                        str += `<div class="col-3 board-name">\${board.bo_name}</div>`;
                        str += `<div class="btn-boardManger-group">`;
                      	//bo_num을 버튼안에 값으로 넣어줌
                        str += `<button class="btn btn-outline-warning btn-board-update" data-num="\${boNum}">수정</button>`;
                        str += `<button class="btn btn-outline-danger btn-board-delete" data-num="\${boNum}">삭제</button>`;
                        str += `</div>`;
                    }
                }
                str+= `</div>`;
                str+= `<hr>`;
            }
            $('.board-set').html(str);
        }
    })
}
</script>

<!-- 게시판 삭제 -->
<script type="text/javascript">
	$(document).on("click",".btn-board-delete", function() {
		let num = $(this).data("num");
		$.ajax({
			url : '<c:url value="/board/delete"/>',
			method : "post",
			data : {
				num
			},
			success : function(data) {
				switch(data){
				case "1":
					alert("게시판을 삭제했습니다.");
					break;
				case "-1":
					alert("게시판을 삭제하지 못했습니다.");
					break;
				case "-2":
					alert("게시판 삭제 권한이 없습니다.")
					break;
				default :
					alert("게시판을 삭제하지 못했습니다.");
					break;
				}
				getBoard();
			},
			error : function(a, b, c) {
				
			}
		});
	})
</script>

<!-- 게시판 수정 -->
<script type="text/javascript">
	//수정 버튼을 누르면, 수정받을 값을 입력받는 창과 기존의 수정/삭제 버튼을 감춤
	$(document).on("click",".btn-board-update",function(){
		 initBoard();
		 $(this).parent().prev('.board-name').hide();
		 let boardName = $(this).parent().prev('.board-name').text();
		 let input = 
		 `
		 <input type="text" class="form-control board-input" id="bo_name" placeholder="수정할 게시판 이름" name="bo_name" value="\${boardName}"></input>
		 `;
		 $(this).parent().prev('.board-name').after(input);
		 $(this).parent().hide();
		 let num = $(this).data("num");
		 let btn = 
			`
			<button class="btn btn-outline-success btn-board-complete" data-num="\${num}">수정완료</button>
			`;
		 $(this).parent().after(btn);
	})

	//수정창 초기화
	function initBoard(){
	    //게시판 이름 보여주기
	    $(".board-name").show();
	    //감추었던 수정/삭제 버튼을 보여줌
	    $(".btn-boardManger-group").show();
	    //게시판 입력창 삭제
	    $(".board-input").remove();
	    //추가된 버튼 삭제
	    $(".btn-board-complete").remove();
	};
	
	//ajax , 수정 실행
	$(document).on("click",".btn-board-complete",function(){
		let num = $(this).data("num");
		let boName = $('.board-input').val();
		let btnComplete = $(this);
		$.ajax({
			url : '<c:url value="/board/update"/>',
			method :'post',
			data :{
				num,
				boName
			},
			success : function(data){
				switch(data){
				case "1" :
					alert("게시판 수정 성공");
					break;
				case "-1":
					alert("게시판 수정 실패(게시판 이름을 지정하지 않았거나 중복된 게시판 이름)");
					break;
				case "-2":
					alert("잘못된 권한 접근");
					break;
				default : alert("게시글 수정 실패"); break;
				}
				getBoard();
			}
		})
	});
	
	
</script>
</body>
</html>