<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <form method="post" action="${pageContext.request.contextPath}/index">
         <fieldset>
            <legend>로그인</legend>
            <table border="1">
               <tr>
                  <td>ID</td>
                  <td><input type="text" name="memberId"></td>
               </tr>
               <tr>
                  <td>PW</td>
                  <td><input type="password" name="memberPw"></td>
               </tr>
            </table>
            <hr>
            <button type="submit">LOGIN</button>
         </fieldset>
      </form>
</body>
</html>