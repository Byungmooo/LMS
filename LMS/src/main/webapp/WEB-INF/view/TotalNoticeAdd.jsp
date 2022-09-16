<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>		
		<!-- Main -->
		<div class="container-xxl flex-grow-1 container-p-y">	  
			<!-- Row1 구분 -->
			<div class="row text-center">	    
				<div class="card h-100">
					<div class="card-header">
						<div class="card-title mb-0">
							<h5 class="m-0 me-2">게시글 작성</h5>
							<small class="text-muted">작은글씨</small>
						</div>
					</div>
					<div class="card-body">
					<form name="form1" method="post" action="${path}/Toal">
    <div>
        제목
        <input name="title" id="title" size="80" placeholder="제목을 입력해주세요">
    </div>
    <div>
        내용
        <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
    </div>
    <div>
        작성자
        <input name="writer" id="writer" placeholder="이름을 입력해주세요">
    </div>
    <div style="width:650px; text-align: center;">
        <button type="button" id="btnSave">확인</button>
        <button type="reset">취소</button>
    </div>
</form>
					</div>
				</div>
			</div>
			<!-- /Row1 구분 -->
		</div>
		<!-- /Main -->	
		<script>
    $(document).ready(function(){
        $("#btnSave").click(function(){
            //var title = document.form1.title.value; ==> name속성으로 처리할 경우
            //var content = document.form1.content.value;
            //var writer = document.form1.writer.value;
            var title = $("#noticeTitle").val();
            var content = $("#noticeContent").val();
            var writer = $("#memberId").val();
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                document.form1.content.focus();
                return;
            }
            if(writer == ""){
                alert("이름을 입력하세요");
                document.form1.writer.focus();
                return;
            }
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
        });
    });
</script>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>    

