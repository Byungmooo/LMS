<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
      <form id="loginForm" method="post" action="${pageContext.request.contextPath}/memberLogin">
         <fieldset>
            <legend>로그인</legend>
            <table border="1">
               <tr>
                  <td>ID</td>
                  <td><input type="text" name="memberId" id="memberId"></td>
               </tr>
               <tr>
                  <td>PW</td>
                  <td><input type="password" name="memberPw" id="memberPw"></td>
               </tr>
            </table>
            <hr>
            <button type="button" id="MemberBtn">고객 로그인</button>
         </fieldset>
      </form>
</body>
<script>
   $('#MemberBtn').click(function(){
      if($('#memberId').val() == '') {
         alert('아이디를 입력하세요');
      } else if($('#memberPw').val() == '') {
         alert('패스워드를 입력하세요');
      } else {
         loginForm.submit();
      }
   });
</script>
</html>