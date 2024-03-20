<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩5 css/js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- <script type="text/javascript">
import { Ripple, initMDB, Input } from "mdb-ui-kit";
initMDB({ Ripple, Input });
</script> -->
<style type="text/css">
   .card {
      background: #fff;
      border-radius: 2px;
      display: inline-block;
      height: 1000px;
      margin: 1rem;
      position: relative;
      width: 1000px;
   }
   .card-1 {
      box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
      transition: all 0.3s cubic-bezier(.25,.8,.25,1);
   }
   
   .card-1:hover {
      box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
   }
   
   .error {
   	  font-size: 10pt;
   	  font-weight: bold;
   }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="card card-1 container col-5 p-5" style="padding: 50px;">
<div class="container">
	<form action="<c:url value="/signup"/>" method="post">
		<h2 style="margin-bottom: 50px">회원가입</h2>
		<div class="form-group" style="margin-bottom: 10px">
		  <input type="text" class="form-control" id="name" name="me_name" placeholder="이름(실명)">
		  <label id="name-error" class="error text-danger" for="name"></label>
		</div>
		<div class="form-group" style="margin-bottom: 10px">
		  <input type="text" class="form-control" id="id" name="me_id" placeholder="아이디">
		  <label id="id-error" class="error text-danger" for="id"></label>
		</div>
		<div class="form-group" style="margin-bottom: 10px">
		  <input type="password" class="form-control" id="pw" name="me_pw" placeholder="비밀번호">
		  <label id="pw-error" class="error text-danger" for="pw"></label>
		</div>
		<div class="form-group" style="margin-bottom: 10px">
		  <input type="password" class="form-control" id="pw2" name="me_pw2" placeholder="비밀번호 확인">
		  <label id="pw2-error" class="error text-danger" for="pw2"></label>
		</div>
		<div class="form-group" style="margin-bottom: 10px">
		  <input type="text" class="form-control" id="email" name="me_email" placeholder="이메일">
		  <label id="email-error" class="error text-danger" for="email"></label>
		</div>
		<div class="form-group">
		  <input type="text" class="form-control" id="phone" name="me_phone" placeholder="전화번호">
		  <label id="phone-error" class="error text-danger" for="phone"></label>
		</div>
		<button class="btn btn-outline-success col-12" style="margin-top: 40px">회원가입</button>
	</form>
</div>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript">
$("form").validate({
	rules : {
		me_name : {
			required : true,
			regex : /^[가-힣]{2,4}$/
		},
		me_id : {
			required : true,
			regex : /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{6,13}$/
		},
		me_pw : {
			required : true,
			regex : /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$])[A-Za-z\d!@#%^&*]{6,15}$/
		},
		me_pw2 : {
			equalTo : pw // name이 아닌 id를 써 줌
		},
		me_email : {
			required : true,
			email : true
		},
		me_phone : {
			required : true,
			regex : /^\d{3}-\d{3,4}-\d{4}$/
		}
	},
	messages : {
		me_name : {
			required : "필수 항목입니다.",
			regex : "한글로 이루어진 2~4글자 이름을 입력하세요."
		},
		me_id : {
			required : "필수 항목입니다.",
			regex : "영문으로 시작하고, 영문자와 숫자 조합의 6~13길이 아이디를 입력하세요."
		},
		me_pw : {
			required : "필수 항목입니다.",
			regex : "영문 대문자, 소문자, 숫자, 특수문자(!@#$) 각각 1개 이상을 포함한 6~15글자 비밀번호를 입력하세요."
		},
		me_pw2 : {
			equalTo : "비밀번호가 일치하지 않습니다."
		},
		me_email : {
			required : "필수 항목입니다.",
			email : "이메일 형식이 아닙니다."
		},
		me_phone : {
			required : "필수 항목입니다.",
			regex : "전화번호는 010-XXXX-XXXX 형식으로 입력하세요."
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
</body>
</html>
<!--  -->
<!-- 
<div class="card card-1 container col-5 p-5">
    <h3>회원가입</h3>
    <form action="<%=request.getContextPath()%>/signup" class="was-validated" method="post">
        <div class="mb-3 mt-3">
            <label for="uname" class="form-label">이름(실명)</label>
            <input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" pattern="[가-힣]{2,4}" required>
            <div class="valid-feedback"></div>
            <div class="invalid-feedback">한글로 이루어진 2~4글자 이름을 입력하세요.</div>
        </div>
        <label for="id" class="form-label">아이디</label>
        <div class="input-group">
            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" pattern="(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{6,13}" required>
            <button class="btn btn-dark" type="button" id="idCheck" style="border-radius: 0 8px 8px 0">중복 확인</button>
            <div class="valid-feedback"></div>
            <div class="invalid-feedback">영문으로 시작하고, 영문자와 숫자 조합의 6~13길이 아이디를 입력하세요.</div>
        </div>
        <div class="mb-3 mt-3">
            <label for="pw" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$])[A-Za-z\d!@#%^&*]{8,15}" required>
            <div class="valid-feedback"></div>
            <div class="invalid-feedback">영문 대문자, 소문자, 숫자, 특수문자(!@#$) 각각 1개 이상을 포함한 6~15글자 비밀번호를 입력하세요.</div>
        </div>
        <div class="mb-3">
            <label for="pw2" class="form-label">비밀번호 확인</label>
            <input  type="password" class="form-control" id="pw2" placeholder="Enter password check" name="pw2" required>
            <div class="valid-feedback pw-valid-feedback"></div>
            <div class="invalid-feedback pw-invalid-feedback"></div>
        </div>
        <div class="mb-3 mt-3">
            <label for="email" class="form-label">이메일</label>
            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
            <div class="valid-feedback"></div>
            <div class="invalid-feedback">필수 입력 정보입니다.</div>
        </div>
        <div class="mb-5 mt-3">
            <label for="phone" class="form-label">전화번호</label>
            <input type="text" class="form-control" id="phone" placeholder="Enter phone" name="phone" required>
            <div class="valid-feedback"></div>
            <div class="invalid-feedback">필수 입력 정보입니다.</div>
        </div>
        <button type="submit" class="btn btn-outline-dark col-12">가입하기</button>
    </form>
</div>

<script src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.12.0/validate.min.js"></script>
<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        let flag = false;
        $("#idCheck").click(function() {
            let id = $("#id").val();
            fetch("/id/check?id=" + id)
                .then(response => response.text())
                .then(data => {
                    if (data === "true") {
                        alert("사용 가능한 아이디입니다.");
                        flag = true;
                    } else {
                        alert("이미 사용중인 아이디입니다.");
                    }
                })
                .catch(error => console.error("Error: ", error));
        });
        
        $("#id").change(function() {
            flag = false;
        });
        
        $("form").submit(function() {
            if (!flag) {
                alert("아이디 중복 확인을 하세요.");
                return false;
            }
        });
        
        $("#pw2").focusout(function() {
            let pw1 = $("#pw").val();
            let pw2 = $("#pw2").val();
            if (pw1 !== "" || pw2 !== "") {
                if (pw1 === pw2) {
                    $(".pw-valid-feedback").html('비밀번호가 일치합니다.');
                    $("[name=pw2]").attr('required', false);
                } else {
                    $(".pw-invalid-feedback").html('비밀번호가 일치하지 않습니다.');
                    $("[name=pw2]").attr('required', false);
                }
            }
        });
    });
</script>
 -->
