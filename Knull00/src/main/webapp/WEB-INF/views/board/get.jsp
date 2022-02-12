<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
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
	                           	<button data-oper='modify' class="btn btn-default">수정</button>
	                           	<button data-oper='list' class="btn btn-info" >목록</button>
	                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <!-- # 첨부파일 -->
			<!-- + 원본 이미지 출력 공간 -->
			<div class="bigPictureWrapper">
				<div class="bigPicture">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Files</div>
						<div class="panel-body">
							<!-- + 첨부파일 목록 -->
							<div class="uploadResult">
								<ul>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- # 첨부파일 스타일 태그 -->
			<style>
				.uploadResult {
					width: 100%;
					background-color: gray;
				}
				
				.uploadResult ul {
					display: flex;
					flex-flow: row;
					justify-content: center;
					align-items: center;
				}
				.uploadResult ul li {
					list-style: none;
					padding: 10px;
					align-content: center;
					text-align: center;
				}
				
				.uploadResult ul li img {
					width: 100px;
				}
				.uploadResult ul li span {
					color: white;
				}
				
				.bigPictureWrapper {
					position: absolute;
					display: none;
					justify-content: center;
					align-items: center;
					top: 0%;
					width: 100%;
					height: 100%;
					background-color: gray;
					z-index: 100;
					background: rgba(255,255,255,0.5);
				}
				
				.bigPicture {
					position: relative;
					display: flex;
					justify-content: center;
					align-items: center;
				}
				
				.bigPicture img {
					width: 600px;
				}
			</style>
            <!-- # 댓글 -->
            <div class="row">
            	<div class="col-lg-12">
            		<div class="panel panel-default">
            			<div class="panel-heading">
            				<i class="fa fa-comments fa-fw"></i>Reply
            				<button id = 'addReplyBtn' class="btn btn-primary btn-xs pull-right">
            				댓글 추가
            				</button>
            			</div>
            			<div class="panel-body">
	            			<ul class="chat">
	                       		<li class="left clearfix" data-rno ='12'>
	                       			<div>
	                       				<div class="header">
	                       					<strong class="primary-font"></strong>
	                       					<small class="pull-right text-muted"><%= sf.format(nowTime) %></small>
	                       				</div>
	                       				<p></p>
	                       			</div>
	                       		</li>
	                       	</ul>
            			</div>
            			<div class="panel-footer">
            			</div>
            		</div>
            	</div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                 <div class="modal-dialog">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                             <h4 class="modal-title" id="myModalLabel">댓글</h4>
                         </div>
                         <div class="modal-body">
                         	<div class="form-group">
                         		<label>댓글 내용</label>
                         		<input class="form-control" name = 'reply' value="새로운 댓글">
                         	</div>
                         	<div class="form-group">
                         		<label>댓글 작성자</label>
                         		<input class="form-control" name = 'replyer' value="댓글 작성자">
                         	</div>
                         	<div class="form-group">
                         		<label>일시</label>
                         		<input class="form-control" name = 'replyDate' value="">
                         	</div>
                         </div>
                         <div class="modal-footer">
                             <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
					         <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
					         <button id='modalRegisterBtn' type="button" class="btn btn-primary">추가</button>
					         <button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
                         </div>
                     </div>
                     <!-- /.modal-content -->
                 </div>
                 <!-- /.modal-dialog -->
             </div>
             <!-- /.modal -->
            
            <!-- # reply.js 참조 -->
            <script type="text/javascript" src="/resources/js/reply.js">
            </script>
            
            <!-- # 댓글 처리 -->
           	<script type="text/javascript">
           	
           		console.log("JS TEST");
           	
				$(document).ready(function() {
				  
				  var bnoValue = '<c:out value="${board.bno}" />';
				  var replyUL = $(".chat");
				  
		  	      /* # modal에 각각의 요소값 입력 */
				  var modal = $(".modal");
				  var modalInputReply = modal.find("input[name='reply']");
				  var modalInputReplyer = modal.find("input[name='replyer']");
				  var modalInputReplyDate = modal.find("input[name='replyDate']");
				  
				  var modalModBtn = $("#modalModBtn");
				  var modalRemoveBtn = $("#modalRemoveBtn");
				  var modalRegisterBtn = $("#modalRegisterBtn");
				  
				  showList(1);
				  
				  /* # 댓글 Main */
				  function showList(page) {
					  console.log("show list : " + page);
					  
					  replyService.getList({bno:bnoValue, page:page||1}, function (replyCnt, list) {
						  console.log("replyCnt : " + replyCnt);
						  console.log("list : " + list);
						  console.log(list);
						  
						  if(page == -1) {
							  pageNum = Math.ceil(replyCnt/10.0);
							  showList(pageNum);
							  return;
						  }
						  
						var str = "";
						
						if(list == null || list.length == 0) {
							return;
						}
						for(var i = 0, len = list.length || 0; i < len; i++) {
							str += "<li class='left clearfix'data-rno='"+list[i].rno+"'>";
							str += "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
							str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
							str += "<p>"+list[i].reply+"</p></div></li>";
						}
						
						replyUL.html(str);
						
						showReplyPage(replyCnt);
						
					}); 
				} 
				  
				  
				  /* # 댓글 모달 창 닫기 */
				  $("#modalCloseBtn").on("click",function(e) {
					  modal.modal('hide');
				  });
				  
				  /* # 댓글 추가 버튼 이벤트 처리 */
				  $("#addReplyBtn").on("click", function (e) {
					modal.find("input").val("");
					modalInputReplyDate.closest("div").hide();
					modal.find("button[id !='modalCloseBtn']").hide();
					
					modalRegisterBtn.show();
					
					$(".modal").modal("show");
				  });
				  
				  /* # 댓글 추가 처리 */
				  modalRegisterBtn.on("click", function(e) {
					  var reply = {
					            reply: modalInputReply.val(),
					            replyer:modalInputReplyer.val(),
					            bno:bnoValue
					          };
					  
					  replyService.add(reply, function (result) {
						  
						alert(result);
						
						modal.find("input").val("");
						modal.modal("hide");
						
						showList(-1);
					});
				  });
				  
				  /* # 댓글 클릭 이벤트 처리 */
				  $(".chat").on("click","li",function(e) {
					 var rno = $(this).data("rno");
					 
					 replyService.get(rno, function(reply) {
						 modalInputReply.val(reply.reply);
						 modalInputReplyer.val(reply.replyer).attr("readonly","readonly");
						 modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","readonly");
						 modal.data("rno",reply.rno);
						 
						 modal.find("button[id != 'modalCloseBtn']").hide();
						 modalModBtn.show();
						 modalRemoveBtn.show();
						 
						 $(".modal").modal("show");
					 });
				  });
				  
				  /* # 댓글 수정 */
				  modalModBtn.on("click", function (e) {
					var reply = {
							rno : modal.data("rno"),
							reply : modalInputReply.val()
					};
					
					replyService.update(reply, function (result) {
						alert(result);
						modal.modal("hide");
						showList(pageNum);
					});
				});
				  
				  /* # 댓글 삭제 */
				  modalRemoveBtn.on("click", function (e) {
					var rno = modal.data("rno");
					
					replyService.remove(rno, function (result) {
						
						alert(result);
						modal.modal("hide");
						showList(pageNum);
						
					});
				});
				  
				  /* # 댓글 페이징 */
			  	    var pageNum = 1;
				    var replyPageFooter = $(".panel-footer");
				    
				    function showReplyPage(replyCnt) {
						var endNum = Math.ceil(pageNum/10.0) * 10;
						var startNum = endNum - 9;
						
						var prev = startNum != 1;
						var next = false;
						
						if(endNum * 10 >= replyCnt) {
							endNum = Math.ceil(replyCnt/10.0);
						}
						
						if(endNum * 10 < replyCnt) {
							next = true;
						}
						
						var str = "<ul class='pagination pull-right'>";
						
						if(prev) {
							str += "<li class='page-item'><a class='page-link' href='"+(startNum - 1)+"'>Previous</a></li>";
						}
					
						for(var i = startNum; i <=endNum; i++) {
							var active = pageNum == i ? "active" : "";
							
							str+= "<li class='page-item "+active+"'><a class= 'page-link' href='"+i+"'>"+i+"</a></li>";
						}
						
						if(next) {
							str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
						}
						
						str += "</ul></div>";
						
						console.log(str);
						
						replyPageFooter.html(str);
					}	
				    
				    /* # 댓글 페이지 번호 클릭시 이벤트 처리 */
				    replyPageFooter.on("click","li a", function (e) {
						e.preventDefault();
						console.log("page click");
						
						var targetPageNum = $(this).attr("href");
						
						console.log("targetPageNum : " + targetPageNum);
						
						pageNum = targetPageNum;
						
						showList(pageNum);
					});
				  
				});
			</script>
			
			<!-- # 페이지 이동 -->
			<script type="text/javascript">
				$(document).ready(function () {
					var operForm = $("#operForm");
					
					/* # 게시글 수정 페이지 이동 */
				    $("button[data-oper='modify']").on("click", function(e){
				    
				    operForm.attr("action","/board/modify").submit();
				    
				    });
				  
				    /* # 게시글 목록 페이지 이동 */  
				    $("button[data-oper='list']").on("click", function(e){
					  
				    operForm.attr("action","/board/list")
				    operForm.submit();
				    
				    });
				 });
			</script>
			
			<!-- # 첨부파일 처리 -->
			<script type="text/javascript">
				$(document).ready(function () {
					(function () {
						var bno = '<c:out value="${board.bno}"/>';
						
						/* # 첨부파일 보여주기 */
						$.getJSON("/board/getAttachList",{bno:bno}, function (arr) {
						  console.log(arr);
							
					      var str = "";
					      
					      $(arr).each(function (i,attach) {
					    	  if(attach.fileType){
					              var fileCallPath =  encodeURIComponent(attach.uploadPath+ "/S_"+attach.uuid +"_"+attach.fileName);
					              
					              str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					              str += "<img src='/display?fileName="+fileCallPath+"'>";
					              str += "</div>";
					              str +"</li>";
					            }else{
					                
					              str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
					              str += "<span> "+ attach.fileName+"</span><br/>";
					              str += "<img src='/resources/img/attach.png'></a>";
					              str += "</div>";
					              str +"</li>";
					            }
							});
					      
						    $(".uploadResult ul").html(str);
						    
						});
					})();
				 });
				
				/* # 첨부파일 클릭 이벤트 */
				$(".uploadResult").on("click","li", function (e) {
					console.log("view image");
					
					var liObj = $(this);
					var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_"+liObj.data("filename"));
					
					if(liObj.data("type")) {
						showImage(path.replace(new RegExp(/\\/g),"/"));
					} else {
						self.location = "/download?fileName="+path
					}
				});
				
				/* # 원본 이미지 출력 */
				function showImage(fileCallPath) {
					alert("다운로드 이미지");
					
					$(".bigPictureWrapper").css("display","flex").show();
					
					$(".bigPicture")
					.html("<img src='/display?fileName="+fileCallPath+"'>")
					.animate({width:'100%',height:'100%'},1000);
				}
				
				/* # 원본 이미지 감추기 */
				$(".bigPictureWrapper").on("click", function (e) {
					$(".bigPicture").animate({width:'0%', height: '0%'},1000);
					setTimeout(function () {
						$('.bigPictureWrapper').hide();
					},1000);
				});
			</script>
	<%@ include file="../includes/footer.jsp" %>