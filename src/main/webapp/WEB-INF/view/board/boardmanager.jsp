<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<h2>현재 게시판</h2>
	<div class="mb-3 mt-3 board-manager">
		<div class="mb-3 mt-3 board-set">
		<!-- 외부 반복, div 시작태그와 카테고리 이름 -->
			<div class="board-list">
				<div class="col-6 category">[카테고리1]</div>
				<br>
				<!-- 내부반복 게시판 이름과 수정/삭제 버튼 -->
				<div class="col-3 board">게시판1</div>
				<div class="btn-boardManger-group">
					<button class="btn btn-outline-warning btn-board-update">수정</button>
					<button class="btn btn-outline-danger btn-board-delete">삭제</button>
				</div>
				<!-- 내부반복 종료 -->
			</div>
			<hr>
			<!-- 외부 반복 종료 -->
		</div>
	</div>
</body>
<script type="text/javascript">
getBoard();

//현재 게시판과 카테고리 출력
function getBoard(){
    $.ajax({
        url : '<c:url value="/board/list"/>',
        method : 'get',
        success : function(data){
            let str = '';
            for(category of data.categoryList){
                str += `<div class="board-list">`;
                str += `<div class="col-6 category">\${category.ca_name}</div>`;
                str += `<br>`;
                for(board of data.boardList){
                    if(board.bo_ca_num === category.ca_num){
                    	//방금 가져온 board 의 bo_num
                        let boNum = board.bo_num;
                        str += `<div class="col-3 board">\${board.bo_name}</div>`;
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
				if(data == '1'){
					alert("게시판을 삭제했습니다.");
					getBoard();
				}else if(data=='-1'){
					alert("게시판을 삭제하지 못했습니다.");
				}else if(data=='-2'){
					alert("게시판 삭제 권한이 없습니다.")
				}
			},
			error : function(a, b, c) {
				
			}
		});
	})
</script>

</html>