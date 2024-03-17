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
<h2>���� �Խ���</h2>
	<div class="mb-3 mt-3 board-manager">
		<div class="mb-3 mt-3 board-set">
		<!-- �ܺ� �ݺ�, div �����±׿� ī�װ� �̸� -->
			<div class="board-list">
				<div class="col-6 category">[ī�װ�1]</div>
				<br>
				<!-- ���ιݺ� �Խ��� �̸��� ����/���� ��ư -->
				<div class="col-3 board">�Խ���1</div>
				<div class="btn-boardManger-group">
					<button class="btn btn-outline-warning btn-board-update">����</button>
					<button class="btn btn-outline-danger btn-board-delete">����</button>
				</div>
				<!-- ���ιݺ� ���� -->
			</div>
			<hr>
			<!-- �ܺ� �ݺ� ���� -->
		</div>
	</div>
</body>
<script type="text/javascript">
getBoard();

//���� �Խ��ǰ� ī�װ� ���
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
                    	//��� ������ board �� bo_num
                        let boNum = board.bo_num;
                        str += `<div class="col-3 board">\${board.bo_name}</div>`;
                        str += `<div class="btn-boardManger-group">`;
                      	//bo_num�� ��ư�ȿ� ������ �־���
                        str += `<button class="btn btn-outline-warning btn-board-update" data-num="\${boNum}">����</button>`;
                        str += `<button class="btn btn-outline-danger btn-board-delete" data-num="\${boNum}">����</button>`;
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
					alert("�Խ����� �����߽��ϴ�.");
					getBoard();
				}else if(data=='-1'){
					alert("�Խ����� �������� ���߽��ϴ�.");
				}else if(data=='-2'){
					alert("�Խ��� ���� ������ �����ϴ�.")
				}
			},
			error : function(a, b, c) {
				
			}
		});
	})
</script>

</html>