/**
 * 
 */
 
 console.log("댓글 모듈....");
 
 var replyService = (function(){
	
	function add(reply,callback,error) {
		console.log("추가 댓글....");
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset = utf-8",
			success : function (result,status,xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function (xhr,status,er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	return {add : add};
	
	})();