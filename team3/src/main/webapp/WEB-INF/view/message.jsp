<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message-알림 문구 출력</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h1>메세지</h1>
	<script type="text/javascript">
		let msg = '${msg}';//서버에서 보낸 msg값을 변수에 저장
		if(msg != ''){
			alert(msg);
		}
		let redirectURL = '${url}';//서버에서 보낸 url을 변수에 저장
		if(redirectURL != ''){
			location.href = '<c:url value="/${url}"/>';
		}else{
			location.href = '<c:url value="/"/>';
		}
	</script>
</body>
</html>