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
<div class="container">
	<h1>�Խ��� ����</h1>
	<br>
	<form action="<c:url value="/board/manager"/>" method="post">
		<h5>�Խ��� ���</h5>
		<div class="mb-3 mt-3">
			<label for="category" class="form-label">ī�װ�</label>
			<select class="form-control" name="category" id="category">
				<c:forEach items="${caList}" var="category">
					<option value="${category.ca_num}">${category.ca_name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="mb-3 mt-3">
			<label for="title" class="form-label">�Խ��Ǹ�</label>
			<input type="text" class="form-control" id="title" placeholder="�Խ��Ǹ�" name="title">
		</div>
		<button type="submit" class="btn btn-outline-success col-12">����ϱ�</button>
	</form>
	<br>
	<h5>���� �Խ���</h5>
	<div class="mb-3 mt-3 board-manager">
		<div class="mb-3 mt-3 board-set">
		<!-- �ܺ� �ݺ�, div �����±׿� ī�װ� �̸� -->
			<div class="board-list">
				<!-- ���ιݺ�, �Խ����̸� -->
				<!-- ���ιݺ� ���� -->
			</div>
				<!-- �ܺ� �ݺ� ���� -->
		</div>
	</div>
</div>
<!-- �Խ��� ����Ʈ ��� -->
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

<!-- �Խ��� ���� -->
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
</body>
</html>