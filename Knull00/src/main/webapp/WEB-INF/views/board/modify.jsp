<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    <%@ include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">자유 공간</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            게시판
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form action="/board/modify" role="form" method="post">
	                           	<div class="form-group">
	                           		<label>글 번호</label>
	                           		<input class="form-control" name="bno"
	                           		value='<c:out value="${board.bno }"/>'
	                           		readonly="readonly">
	                           	</div>
	                           	<div class="form-group">
	                           		<label>제목</label>
	                           		<input class="form-control" name="title"
	                           		value='<c:out value="${board.title }"/>'>
	                           	</div>
	                           	<div class="form-group">
	                           		<label>글 내용</label>
	                           		<input class="form-control" name="content"
	                           		value='<c:out value="${board.content }"/>'>
	                           	</div>
	                           	<div class="form-group">
	                           		<label>작성자</label>
	                           		<input class="form-control" name="writer"
	                           		value='<c:out value="${board.writer }"/>'
	                           		>
	                           	</div>
	                           	<div class="form-group">
	                           		<!-- <label>작성일시</label> -->
	                           		<input type="hidden" class="form-control" name="regDate"
	                           		value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" />'
	                           		readonly="readonly">
	                           	</div>
	                           	<div class="form-group">
	                           		<!-- <label>수정일시</label> -->
	                           		<input type="hidden" class="form-control" name="updateDate"
	                           		value='<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }" />'
	                           		readonly="readonly">
	                           	</div>
	                           	
	                           	<button type = "submit" data-oper='modify' class="btn btn-default">수정</button>
	                           	<button type = "submit" data-oper='remove' class="btn btn-danger">삭제</button>
	                           	<button type = "submit" data-oper='list' class="btn btn-info">목록</button>
                           	</form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            
            <!-- # button에 'data-oper' 속성을 이용하기 위해 e.preventDefalut()로
            기본 동작을 막고 마지막에 직접 submit()을 수행시킴. --> 
            <script type="text/javascript">
				$(document).ready(function () {
					var formObj = $("form");
					
					$('button').on("click", function (e) {
						e.preventDefalut();
						
						var operation = $(this).data("oper");
						
						console.log(operation);
						
						if(operation === 'remove') {
							formObj.attr("action", "board/remove");
						} else if(operation === 'list'){
							formObj = null;
							self.location = "/board/list";
							return;
						}
						formObj.submit();
					});
				});
			</script>
            
	<%@ include file="../includes/footer.jsp" %>