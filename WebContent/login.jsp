<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹으로  디자인이 해상도에 맞게 변경되게되는 메타태그 -->
<meta name = "viewport" content = "width=device-width",initial-scale = "1" >
<!-- 디자인을 담당할 css 참조 -->
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<nav class = "navbar navbar-default">
		<div class = "navbar-header">
			<button type = "button" class = "navbar-toggle collapsed" 
				data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1"
				aria-expanded = "false">
				<!-- icon bar가 화면 줄였을때 작대기라고 보면 된다 -->
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				</button>
				<a class = "navbar-brand" href = "main.jsp">JSP 게시판 웹사이트</a>
		</div>
		<div class = "collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
				<ul class = "nav navbar-nav">
					<li><a href = "main.jsp">메인</a>
					<li><a href = "bbs.jsp">게시판</a>
				</ul>
				<ul class = "nav navbar-nav navbar-right">
					<li class = "dropdown">
						<a href = "#" class = "dropdown-toggle"
							data-toggle = "dropdown" role = "button" aria-haspopup="true"
							aria-expaned = "false">접속하기<span class = "carot"></span></a>
						<ul class = "dropdown-menu">
							<li class = "active"><a href = "login.jsp">로그인</a></li>
							<li><a href = "join.jsp">회원가입</a></li>
						</ul>
					</li>
					
				</ul>
		</div>
	</nav>
	
	<div class = "container">
		<div class = "col-lg-4"></div>
		<div class = "col-lg-4">
			<div class = "jumbotron" style = "padding-top: 20px;">
				<form method = "post" action="loginAction.jsp">
					<h2 style="text-align : center;">로그인 화면</h2>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID"
							maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPW"
							maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
					
				</form>
			</div>
		</div>
			
		<div class = "col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>