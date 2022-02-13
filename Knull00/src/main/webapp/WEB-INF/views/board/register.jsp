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
                            <form role="form" action="/board/register" method="post">
                            	<div class="form-group">
                            		<label>제목</label>
                            		<input class="form-control" name="title">
                            	</div>
                            	<div class="form-group">
                            		<label>내용</label>
                            		<textarea rows="3" class="form-control" name="content"></textarea>
                            	</div>
                            	<div class="form-group">
                            		<label>작성자</label>
                            		<input class="form-control" name="writer">
                            	</div>
                            	<button type="submit" class="btn btn-default">
                            	등록
                            	</button>
                            	<button type="reset" class="btn btn-default">
                            	리셋
                            	</button>
                            </form>
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
            			<div class="panel-heading">파일 첨부</div>
            			<div class="panel-body">
            				<div class="form-group uploadDiv">
            					<input type="file" name="uploadFile" multiple="multiple">
            				</div>
            				<div class="uploadResult">
            					<ul>
            					</ul>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>
            
	<%@ include file="../includes/footer.jsp" %>
	
	<script type="text/javascript">
	
	$(document).ready(function (e) {
		var formObj = $("form[role='form']");
		
		/* # 버튼 클릭 */
		$("button[type='submit']").on("click", function (e) {
			e.preventDefault();
			
			console.log("전송 체크....");
			
			var str = "";
			
			$(".uploadResult ul li").each(function (i,obj) {
				var jobj = $(obj);
				console.dir(jobj);
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			    str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			    str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			    str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
				
			});
		    formObj.append(str).submit();
		});
		
		/* # 파일 업로드 확장자 제한 */
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880;
		
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert('파일 사이즈 초과.');
				return false;
			}
			
			if(regex.test(fileName)) {
				alert('해당 종류의 파일은 업로드 할 수 없습니다.');
				return false;
			}
			
			return true;
		}
		
		/* # 첨부파일 이벤트 감지 */
		$("input[type='file']").change(function (e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			for (var i = 0; i < files.length; i++) {
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile",files[i]);
			}
			
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function (result) {
					console.log(result);
					showUploadResult(result);
				}
			});
		});
		
		/* # 첨부파일 업로드 */
		function showUploadResult(uploadResultArr) {
			if(!uploadResultArr || uploadResultArr.length == 0) {
				return;
			}
			
			var uploadUL = $(".uploadResult ul");
			var str = "";
			
			$(uploadResultArr).each(function (i,obj) {
				if(obj.image){
					var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/S_"+obj.uuid +"_"+obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"'";
					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
					str +" ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str +"</li>";
				}else{
					var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
				    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				      
					str += "<li "
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'></a>";
					str += "</div>";
					str +"</li>";
				}
			});
			uploadUL.append(str);
		}
		
		/* # 첨부파일 삭제 */
		$(".uploadResult").on("click","button", function (e) {
			console.log("삭제 파일");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url : "/deleteFile",
				data : {fileName:targetFile, type:type},
				dataType : 'text',
				type : 'POST',
				success : function (result) {
					alert(result);
					targetLi.remove();
				}
			});
		});
		
		
	});
	
	</script>