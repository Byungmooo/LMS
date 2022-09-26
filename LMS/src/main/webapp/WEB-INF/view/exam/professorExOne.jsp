<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->
<c:choose>
   <c:when test="${memberType eq '학생'}">
      <c:import url="/WEB-INF/view/include/studentHeader.jsp"></c:import>   
   </c:when>
   <c:when test="${memberType eq '교수'}">
      <c:import url="/WEB-INF/view/include/professorHeader.jsp"></c:import>   
   </c:when>
   <c:when test="${memberType eq '직원'}">
      <c:import url="/WEB-INF/view/include/employeeHeader.jsp"></c:import>   
   </c:when>
   <c:otherwise>   
   </c:otherwise>
</c:choose>

<!-- Main -->
      
      <h4 class="card-header">
         <span >"이름"님 /</span>시험명 : ${examSheet.examName} / ${examSheet.examNo }${map.lectureName}
      </h4>
   <body>
      <div class="container-xxl flex-grow-1 container-p-y">
      <hr>
      
      <div class="col-xl-6">
         <div class="card mb-4">
            <h3 class="card-header">객관식</h3>
               
               <div class="mt-2 mb-3">
                                 <label for="largeSelect" class="form-label">
                                    <c:forEach var = "m" items="${multipleQ}">
                                    ${m.examNo}
                                    </c:forEach>--multipleQ시험번호 안들어옴
                                 </label>
                 </div>
                 
                 
            <table class="card-body">
               <c:forEach var = "m" items="${multipleQ}">
                     <div class="card-header">
                        ${m.multipleNo}번 문제: ${m.multipleContent }
                     </div>
                     <div class="card-body">
                        <label >보기 : </label>
                           <c:forEach var="ex" items="${m.exampleList}">
                              <div>
                                 ${ex}<input class="form-check-input" type="checkbox">
                              </div>
                           </c:forEach>
                     </div>
               </c:forEach>
            </table>
            </div>
      </div>
      <div class="col-xl-6">
         <div class="card mb-4">   
            <h3 class="card-header">주관식</h3>
               <table class="card-body">
                  <c:forEach var = "s" items="${subjectiveQ}">
                     <div class="card-body">
                        ${s.subjectiveNo}번 문제 : ${s.subjectiveContent }
                     </div>
                     <div class="card mb-4">
                     <input type="text" id="" class="form-control" >
                     </div>

                  </c:forEach>
               </table>
            </div>
                     <hr>
         <div>!!!::script::제출하기 클릭시 확인 팝업(학생), 수정이나 삭제시 확인팝업(교수)!!!!   </div>
         </div>   
                     <a href=""
                     class="btn btn-danger">${examSheet.examName} 제출하기</a>
                     <a href="${pageContext.request.contextPath}/exam/updateExamSheet/${e.examNo}"
                     class="btn btn-danger">시험지수정(교수)</a>
                     
                     <form action="${pageContext.request.contextPath}/exam/deleteExamSheet" method="post" class="card-body">
                        <input type="hidden" name="examNo" value="${examSheet.examNo }">
                        <button class="btn btn-danger" onclick="deleteBtn()">시험지삭제(교수)</button>
                     </form>
                   		<a href="javascript:history.back()"
						class="btn btn-danger">뒤로가기</a>	
                     <hr>
                     
      </div>
   </body>
   
   
   <c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
   
   <script> 
function deleteBtn(){
   alert("삭제되었습니다.");
    document.form.submit();
}
</script>