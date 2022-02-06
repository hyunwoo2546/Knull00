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
	                           	<div class="form-group">
	                           		<label>글 번호</label>
	                           		<input class="form-control" name="bno"
	                           		value='<c:out value="${board.bno }"/>'
	                           		readonly="readonly">
	                           	</div>
	                           	<div class="form-group">
	                           		<label>제목</label>
	                           		<input class="form-control" name="title"
	                           		value='<c:out value="${board.title }"/>'
	                           		readonly="readonly">
	                           	</div>
	                           	<div class="form-group">
	                           		<label>글 내용</label>
	                           		<input class="form-control" name="content"
	                           		value='<c:out value="${board.content }"/>'
	                           		readonly="readonly">
	                           	</div>
	                           	<div class="form-group">
	                           		<label>작성자</label>
	                           		<input class="form-control" name="writer"
	                           		value='<c:out value="${board.writer }"/>'
	                           		readonly="readonly">
	                           	</div>
	                           	
		                        <form id='operForm' action="/board/modify" method="get">
								  <input type='hidden' id='bno' name='bno' value='<c:out value = "${board.bno }"/>'>
								  <input type='hidden' name='pageNum' value='<c:out value = "${cri.pageNum }"/>'>
								  <input type='hidden' name='amount' value='<c:out value = "${cri.amount }"/>'>
								  <input type='hidden' name='keyword' value='<c:out value = "${cri.keyword }"/>'>
								  <input type='hidden' name='type' value='<c:out value = "${cri.type }"/>'>
								</form>
								
	                           	<button data-oper='modify' class="btn btn-default"
	                           	onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'">
	                           	수정
	                           	</button>
	                           	<button data-oper='list' class="btn btn-info" >목록</button>
	                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
            	<div class="col-lg-12">
            		<div class="panel panel-default">
            			<div class="panel-heading">
            				<i class="fa fa-comments fa-fw"></i>Reply
            			</div>
            			<div class="panel-body">
	            			<ul class="chat">
	                       		<li class="left clearfix" data-rno='12'>
	                       			<div>
	                       				<div class="header">
	                       					<strong class="primary-font">user00</strong>
	                       					<small class="pull-right text-muted">2022-02-07 02:30</small>
	                       				</div>
	                       				<p>Good Job!</p>
	                       			</div>
	                       		</li>
	                       	</ul>
            			</div>
            		</div>
            	</div>
            </div>
            
            
            <script type="text/javascript" src="/resources/js/reply.js"></script>
            <script type="text/javascript">
            	
            	/* console.log("=========");
            	console.log("JS TEST"); */
            	
            	
            	
            	/* # 댓글 전체 조회 
            	replyService.getList({bno:bnoValue , page:1}, function(list){
					for(var i = 0, len = list.length||0; i < len; i++ ) {
						console.log(list[i]);
					}
				}); */
            	
            	/* # 댓글 삭제
            	replyService.remove(41, function (count) {
					console.log("10번 댓글 삭제....");
					console.log(count);
					
					if(count === "success") {
						alert("댓글 삭제 완료...");
					}
				}, function (err) {
					alert("에러....");
				}); */
            	
            	/* # 댓글 수정
            	replyService.update({
            		rno : 2,
            		bno : bnoValue,
            		reply : "지금 우리 학교는"
            	}, function (result) {
					alert("수정완료....");
				}); */
				
				/* # 특정 댓글 조회 
				replyService.get(5,function(data) {
					console.log(data);
				}); */
				
            </script>
            
           	<script type="text/javascript">
				$(document).ready(function() {
				  
				  var operForm = $("#operForm");
				  var bnoValue = '<c:out value="${board.bno}" />';
				  var replyUL = $(".chat");
				  
				  showList(1);
				  
				  function showList(page) {
					replyService.getList({bno:bnoValue, page:page||1}, function (list) {
						var str = "";
						
						if(list == null || list.length == 0) {
							replyUL.html("");
							
							return;
						}
						for(var i = 0, len = list.length || 0; i < len; i++) {
							str += "<li class='left clearfix'data-rno='"+list[i].rno+"'>";
							str += "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
							str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
							str += "<p>"+list[i].reply+"</p></div></li>";
						}
						
						replyUL.html(str);
						
					}); // End function
				} // End showList
				  
				  $("button[data-oper='modify']").on("click", function(e){
				    
				    operForm.attr("action","/board/modify").submit();
				    
				  });
				  
				    
				  $("button[data-oper='list']").on("click", function(e){
					  
				    operForm.attr("action","/board/list")
				    operForm.submit();
				    
				  });  
				});
			</script>
            
	<%@ include file="../includes/footer.jsp" %>