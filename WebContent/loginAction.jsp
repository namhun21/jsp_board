<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "user.UserDAO" %>
<%@page import = "java.io.PrintWriter" %><!-- javascript 문장 사용하기 위해 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class = "user.User" scope = "page"></jsp:useBean> <!-- 자바빈즈 사용한다는 뜻   class는 package내에 User클래스-->
<jsp:setProperty name="user" property = "userID" /> <!-- login페이지에서 보낸 userID를 받아옴 -->
<jsp:setProperty name="user" property = "userPW" /> <!-- login페이지에서 보낸 userID를 받아옴 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPW());
		if(result == 1){ //로그인 성공시
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");//성공했을 때 다음 페이지로 이동하도록
			script.println("</script>");
		}else if(result == 0){ //비밀번호 틀렸을 경우 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("alert('history.back()')");//이전페이지로 사용자를 돌려보냄
			script.println("</script>");
		}
		else if(result == -1){ //아이디 존재하지 않을 경우 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다.')");
			script.println("alert('history.back()')");//이전페이지로 사용자를 돌려보냄
			script.println("</script>");
		}
		else if(result == -2){ //DB오류 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("alert('history.back()')");//이전페이지로 사용자를 돌려보냄
			script.println("</script>");
		}
	%>
</body>
</html>