<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<style type="text/css">
    .card {
        background: #fff;
        border-radius: 2px;
        display: inline-block;
        /* Change width and height to fit content */
        /*height: 1000px;*/
        /*width: 1000px;*/
        margin: 1rem;
        margin-left: 550px;
        position: relative;
        /* Added max-width to prevent overflow */
        max-width: 1000px;
    }
    .card-1 {
        box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        transition: all 0.3s cubic-bezier(.25,.8,.25,1);
    }
    
    .card-1:hover {
        box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<jsp:include page="/WEB-INF/view/profile.jsp"/>

<div class="card card-1 container col-5 p-5">
    <h3>회원정보 수정</h3>
    <form action="<c:url value='/signup/update'/>" method="post">
        <div class="container mt-3">
        <h2>내 프로필</h2>
        <p>회원 프로필 정보 입니다.</p>            
            <table class="table table-hover">
            	<tr>
                    <td><label for="name" class="form-label">아이디</label></td>
                    <td>
                        <div class="input-group">
                            <input type="text" class="form-control" id="id" name="id" readonly value="${member.me_id}">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="name" class="form-label">이름(실명)</label></td>
                    <td>
                        <div class="input-group">
                            <input type="text" class="form-control update-name" id="name" name="name" value="${member.me_name}">
                            <button type="button" class="btn btn-outline-dark btn-insert btn-name" id="nameCheck">수정</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="email" class="form-label">이메일</label></td>
                    <td>
                        <div class="input-group">
                            <input type="text" class="form-control update-email" id="email" name="email" value="${member.me_email}">
                            <button type="button" class="btn btn-outline-dark btn-insert btn-email">수정</button>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        
        <div class="container mt-3">
        <h2>보안설정</h2>
        <p>회원 보안 정보 입니다.</p>            
            <table class="table table-hover">
                <tr>
                    <td><label for="pw" class="form-label">비밀번호</label></td>
                    <td>
                        <div class="input-group">
                            <a href="<c:url value='/password/update'/>" class="btn btn-outline-dark">변경하러가기</a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="phone" class="form-label">전화번호</label></td>
                    <td>
                        <div class="input-group">
                            <input type="text" class="form-control update-phone" id="phone" name="phone" value="${member.me_phone}">
                            <button type="button" class="btn btn-outline-dark btn-insert btn-phone">수정</button>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <a href="<c:url value='/signup/delete'/>" class="btn btn-outline-dark mt-3">회원탈퇴</a>
</div>
<jsp:include page="/WEB-INF/view/footer.jsp"/>



<script type="text/javascript">


$('.btn-name').click(function(){
	let newName = $('.update-name').val();
	$.ajax({
		url : '<c:url value ="/signup/updatename"/>',
		method : "post",
		data : {
			newName
		},
		success : function(data){
			console.log(data);
			if(data=="true"){
				alert("회원 이름 수정 성공")
				
			}else{
				alert("회원 이름 수정 실패")
			}
			
		}
	})
})

$('.btn-email').click(function(){
	let newEmail = $('.update-email').val();
	$.ajax({
		url : '<c:url value ="/signup/updateemail"/>',
		method : "post",
		data : {
			newEmail
		},
		success : function(data){
			console.log(data);
			if(data=="true"){
				alert("회원 이메일 수정 성공")
				
			}else{
				alert("회원 이메일 수정 실패")
			}
			
		}
	})
})

$('.btn-phone').click(function(){
	let newPhone = $('.update-phone').val();
	$.ajax({
		url : '<c:url value ="/signup/updatephone"/>',
		method : "post",
		data : {
			newPhone
		},
		success : function(data){
			console.log(data);
			if(data=="true"){
				alert("회원 전화번호 수정 성공")
				
			}else{
				alert("회원 전화번호 수정 실패")
			}
			
		}
	})
})


</script>
</body>
</html>
