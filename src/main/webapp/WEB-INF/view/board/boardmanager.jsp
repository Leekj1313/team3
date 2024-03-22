<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�Խ��� ����</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
	  margin-top: 20px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/profile.jsp"/>
<div class="container mt-3 col-6 card-1">
	<h2 style="font-weight: bold">�Խ��� ����</h2>
	<br>
	<form action="<c:url value="/board/manager"/>" method="post">
		<h4 style="font-weight: bold">�Խ��� ���</h4>
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
		<button type="submit" class="btn btn-success col-12">����ϱ�</button>
	</form>
	<hr style="border: 2px solid gray; margin: 50px 0">
	<h4 style="font-weight: bold">���� �Խ���</h4>
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
                str += `<div class="col-6 category-name" style="font-weight: bold; color: #787878;">\${category.ca_name}</div>`;
                str += `<br>`;
                for(board of data.boardList){
                    if(board.bo_ca_num === category.ca_num){
                    	//��� ������ board �� bo_num
                        let boNum = board.bo_num;
                        str += `<span class="col-3 board-name">\${board.bo_name}</span>`;
                        str += `<div class="btn-boardManger-group btn-group" style="margin-left: 20px; margin-bottom: 10px">`;
                      	//bo_num�� ��ư�ȿ� ������ �־���
                        str += `<button class="btn btn-outline-warning btn-board-update" data-num="\${boNum}">����</button>`;
                        str += `<button class="btn btn-outline-danger btn-board-delete" data-num="\${boNum}">����</button>`;
                        str += `</div><br>`;
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
				switch(data){
				case "1":
					alert("�Խ����� �����߽��ϴ�.");
					break;
				case "-1":
					alert("�Խ����� �������� ���߽��ϴ�.");
					break;
				case "-2":
					alert("�Խ��� ���� ������ �����ϴ�.")
					break;
				default :
					alert("�Խ����� �������� ���߽��ϴ�.");
					break;
				}
				getBoard();
			},
			error : function(a, b, c) {
				
			}
		});
	})
</script>

<!-- �Խ��� ���� -->
<script type="text/javascript">
	//���� ��ư�� ������, �������� ���� �Է¹޴� â�� ������ ����/���� ��ư�� ����
	$(document).on("click",".btn-board-update",function(){
		 initBoard();
		 $(this).parent().prev('.board-name').hide();
		 let boardName = $(this).parent().prev('.board-name').text();
		 let input = 
		 `
		 <input type="text" class="form-control board-input" id="bo_name" placeholder="������ �Խ��� �̸�" name="bo_name" value="\${boardName}"></input>
		 `;
		 $(this).parent().prev('.board-name').after(input);
		 $(this).parent().hide();
		 let num = $(this).data("num");
		 let btn = 
			`
			<button class="btn btn-outline-success btn-board-complete" data-num="\${num}">�����Ϸ�</button>
			`;
		 $(this).parent().after(btn);
	})

	//����â �ʱ�ȭ
	function initBoard(){
	    //�Խ��� �̸� �����ֱ�
	    $(".board-name").show();
	    //���߾��� ����/���� ��ư�� ������
	    $(".btn-boardManger-group").show();
	    //�Խ��� �Է�â ����
	    $(".board-input").remove();
	    //�߰��� ��ư ����
	    $(".btn-board-complete").remove();
	};
	
	//ajax , ���� ����
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
					alert("�Խ��� ���� ����");
					break;
				case "-1":
					alert("�Խ��� ���� ����(�Խ��� �̸��� �������� �ʾҰų� �ߺ��� �Խ��� �̸�)");
					break;
				case "-2":
					alert("�߸��� ���� ����");
					break;
				default : alert("�Խñ� ���� ����"); break;
				}
				getBoard();
			}
		})
	});
	
	
</script>
<jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>