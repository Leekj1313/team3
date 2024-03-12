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

        .login-box {
            margin: auto;
            margin-top: 100px;
            width: 500px;
            height : 400px;
            background-color: #EEEFF1;
            border-radius: 5px;
            text-align: center;
            padding: 20px;
        }

        .login-box input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            border: none;
            margin-top : 10px;
        }

        .login-box .in {
            margin-bottom: 10px;
        }

        .login-box #btn {
            background-color: #1BBC9B;
            margin-bottom: 30px;
            color: white;
        }

        .login-box a {
            text-decoration: none;
            color: #9B9B9B;
            font-size: 12px;
        }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div class="login-box">
        <form action="<%=request.getContextPath()%>/login" method="post">
        	<h1>�α���</h1>
            <input type="text" placeholder="���̵�" class="in" id="id" name="id">
            <input type="password" placeholder="��й�ȣ" class="in" id="pw" name="pw">
            <input type="submit" id="btn" value="�α���"><br>
        </form>
        <a href="#none">���̵�ã��</a>
        <a href="#none">��й�ȣã��</a>
    </div>
</body>
</html>