<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<style type="text/css">

	.card-1 {
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
<div class="card-1 container col-5 p-5 mt-3" style="padding: 50px;">
<div class="container">
	<form action="<c:url value="/password/update"/>" method="post">
		<h2 style="margin-bottom: 50px">새 비밀번호 변경</h2>
		<input type="hidden" name="id" value="${user.me_id}">
		<div class="form-group" style="margin-bottom: 10px">
		  <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
		  <label id="pw-error" class="error text-danger" for="pw"></label>
		</div>
		<div class="form-group" style="margin-bottom: 10px">
		  <input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호 확인">
		  <label id="pw2-error" class="error text-danger" for="pw2"></label>
		</div>
		<button class="btn btn-outline-success col-12" style="margin-top: 40px">비밀번호 변경</button>
	</form>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript">
$("form").validate({
	rules : {
		pw : {
			required : true,
			regex : /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$])[A-Za-z\d!@#%^&*]{6,15}$/
		},
		pw2 : {
			equalTo : pw
		}
	},
	messages : {
		pw : {
			required : "필수 항목입니다.",
			regex : "영문 대문자, 소문자, 숫자, 특수문자(!@#$) 각각 1개 이상을 포함한 6~15글자 비밀번호를 입력하세요."
		},
		pw2 : {
			equalTo : "비밀번호가 일치하지 않습니다."
		}
	}
});

$.validator.addMethod(
	"regex",
	function (value, element, regexp){
		var re = new RegExp(regexp);
		return this.optional(element) || re.test(value);
	}, 
)
</script>
<jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>