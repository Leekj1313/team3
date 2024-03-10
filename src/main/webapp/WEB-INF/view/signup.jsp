<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
 body {
           
        }

        .signup-box {
            margin: auto;
            width: 500px;
            height : 600px;
            background-color: #EEEFF1;
            border-radius: 5px;
            text-align: center;
            padding: 20px;
        }

        .signup-box input {
            width: 70%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            border: none;
            margin-top : 10px;
        }

        .signup-box .in {
            margin-bottom: 10px;
        }

        .signup-box #btn {
            background-color: #1BBC9B;
            margin-bottom: 30px;
            color: white;
        }

</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="signup-box">
        <form action="">
        	<h1>회원가입</h1>
            <input type="text" placeholder="아이디" class="in">
            <button type="button" class="btn btn-success idCheck">중복확인</button>
            <input type="password" placeholder="비밀번호" class="in">
            <input type="password" placeholder="비밀번호 확인" class="in">
            <input type="text" placeholder="이름" class="in">
            <input type="text" placeholder="전화번호" class="in">
            <input type="text" placeholder="이메일" class="in">
            <input type="submit" id="btn" value="회원가입"><br>
        </form>
    </div>
</body>
</html>