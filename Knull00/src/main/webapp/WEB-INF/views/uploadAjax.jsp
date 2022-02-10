<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.uploadResult {
		width:100%;
		background-color : gray;
	}
	
	.uploadResult ul {
		display:flex;
		flex-flow:row;
		justify-content:center;
		align-items:center;
	}
	
	.uploadResult ul li {
		list-style : none;
		padding:10px;
		align-content : center;
		text-align : center;
		align-content : center;
	}
	
	.uploadResult ul li img{
		width : 20px;
	}
	
	.uploadResult ul li span {
		color:white;
	}
	
	.bigPictureWrapper {
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top:0%;
		width: 100%;
		height: 100%;
		background-color: gray;
		z-index: 100;
		background:rgba(255,255,255,0.5);
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
</head>
<body>

<h1>Ajax 업로드</h1>

<div class="uploadDiv">
	<input type='file' name ='uploadFile' multiple>
</div>

<div class="uploadResult">
	<ul></ul>
</div>

<button id="uploadBtn">업로드</button>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		/* # 첨부 파일 목록 */
		var uploadResult = $(".uploadResult ul");
		
		function showUploadedFile(uploadResultArr) {
			var str = "";
			
			$(uploadResultArr).each(function (i,obj) {
				str += "<li>"+obj.fileName+"</li>" 
			});
			uploadResult.append(str);
		}
		
		/* # 파일 업로드 확장자 제한 */
	
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|torrent)$");
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
	
		/* # 파일 업로드 */
		var cloneObj = $(".uploadDiv").clone();
		
		$("#uploadBtn").on("click", function (e) {
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;
			
			console.log(files);
			
			for(var i = 0; i < files.length; i++) {
				
				if(!checkExtension(files[i].name,files[i].size)) {
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
					
					showUploadedFile(result);
					
					$(".uploadDiv").html(cloneObj.html());
					
				}
			});
		});
	});
</script>

</body>
</html>